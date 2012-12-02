function [M, F, b, x, e_conn] =  assemb_co ( param )

%  The FEM equation for the steady state temperature distribution is
%
%    M_2 z^{ss} + F + b = 0

%
%% Initialization
%---------------------------------------------------------------------

  n_nodesx   =  param.nodesx;    % number of nodes in the x direction
  n_nodesy   =  param.nodesy;    % number of nodes in the y direction

  n_gauss    = 7;        % number of points used in Gauss integration
%
%%  Geometry Module
%-----------------------------------------------------------------------
%
%  Generate a mesh of the L \times W rectangle with quadratic elements
%
  n_nodes    = n_nodesx*n_nodesy;
  n_elements = 2*(n_nodesx-1)*(n_nodesy-1)/4;

  x_nodes = linspace(0.0, param.L, n_nodesx);
  y_nodes = linspace(0.0, param.W, n_nodesy);
%
%  Generate node coordinates.
%
  x = zeros(n_nodes, 2);
  for ii=1:n_nodesx
    x_i = x_nodes(ii); k = ii - n_nodesx;
    for jj=1:n_nodesy
      k = k + n_nodesx;
      x(k,:) = [ x_i  y_nodes(jj)];
    end
  end
%
%  Generate element connectivity
%
  e_conn = zeros(n_elements, 6);
  ie     = 0;
%
%  Template for odd numbered triangles
%
  elmt_odd = [ 0 ; 2+2*n_nodesx;   2*n_nodesx; 
                    1+n_nodesx ; 1+2*n_nodesx; n_nodesx];
%
%  Template for even numbered triangles
%
  elmt_evn = [ 0 ;      2 ;    2+2*n_nodesx;   
                         1;    2+n_nodesx ;    1+n_nodesx];

  for jj=1:2:n_nodesy-1
    for ii=1:2:n_nodesx-1
      k = ii + (jj-1)*n_nodesx;
      ie = ie + 1;
      e_conn(ie,:) = k + elmt_odd;
      ie = ie + 1;
      e_conn(ie,:) = k + elmt_evn;
    end
  end
%
%  Set up arrays for elements with faces on left/right boundary.
%
  Omega_left  =            1:(n_nodesx-1):n_elements;
  Omega_right = (n_nodesx-1):(n_nodesx-1):n_elements;
%
%  With Neumann/Robins bc all nodes are unknown.
%
  n_equations = n_nodes;
%
%  Begin the SPMD block:
%
  spmd
%
%  Set up codistributed structure
%
%  Column pointers and such for codistributed arrays.
%
    Vc  = codistributed.colon(1, n_equations);
    lP  = getLocalPart(Vc);
    lP_1 = lP(1); lP_end = lP(end); % first and last columns of M on this lab
  
    fid  = fopen(['out' int2str(labindex)], 'w');
    fprintf(fid, 'Lab %d : column range %d  %d \n', labindex, lP_1, lP_end);

    co_dist_Vc = getCodistributor(Vc); 
    dPM = co_dist_Vc.Partition;
    col_shft = [0 cumsum(dPM(1:end-1))];
%
%  sparse arrays on each lab
%
    M_lab = sparse(n_equations, dPM(labindex));
    b_lab = sparse(dPM(labindex), 1); F_lab = b_lab;

    [n_elements, nel_dof] = size(e_conn);
    [r, s, w] = twod_gauss(n_gauss);
%
%  Build the finite element matrices - Begin loop over elements
%
    n_el_lab = 0;
    fprintf(fid, 'Lab %d : begin n_el loop \n', labindex);

    for n_el=1:n_elements
%
%  Which nodes are in this element?
%
      nodes_local = e_conn(n_el,:);
%
%  subset of nodes/columns on this lab
%
      lab_nodes_local = extract( nodes_local, lP_1, lP_end);

%     fprintf(fid, '\n \n n_el = %d \n', n_el);
%     fprintf(fid, 'lab_nodes_local has %d rows \n', size(lab_nodes_local, 1));

      if ~isempty(lab_nodes_local) % continue the calculation for this elmnt
        n_el_lab = n_el_lab + 1;
%       fprintf(fid, 'Lab %d : n_el loop location 1 \n', labindex);
%
%  coordinates, shape functions & gradients evaluated at the Gauss pts.
%
        x_local                   = x(nodes_local,:);
        [x_g, w_g, phi, p_x, p_y] = twod_shape(x_local, r, s, w);

%-------------------------------------------------------------------
%% Element contributions to the weak form of the equations
%  First we evaluate the surface integral (2D) terms
%-------------------------------------------------------------------
        M_loc =   twod_bilinear(param.k_x, p_x, p_x, w_g) + ...
                  twod_bilinear(param.k_y, p_y, p_y, w_g);
        src_g  =  source(x_g,  param); % distributed source term
        F_loc  =  twod_f_int( src_g , phi, w_g );
%
%  pre-allocate boundary arrays
%
        b_loc  =   zeros(nel_dof,1);
%       fprintf(fid, 'Lab %d : n_el loop location 2 \n', labindex);

%---------------------------------------------------------------------
%%  Add boundary terms
%---------------------------------------------------------------------
%
%  Add boundary-integral terms for left and right bounary elements
%  Left  boundary n_el = [1:2*(n_nodesx-1):n_elements
%  Right boundary n_el = [2*(n_nodesx-1):2*(n_nodesx-1):n_elements
%
        if any(Omega_left == n_el);
%
%  Here we impose Robin boundary term. The node points on the boundary
%  are nodes_local([3 6 1]) and  are at x_local([3 6 1],:)
%
          [phi_g1, ip, x_g1,  w_g1] = boundary(3, x_local, 5); % n_gauss=5
          alpha_g1 = steps(x_g1(:,2), param.yh, param.ep, param.alpha );
          phi_a    = diag(alpha_g1)*phi_g1;  % mult. each row by alpha(y_g)
          beta_g1  = steps(x_g1(:,2), param.yh, param.ep, param.beta );
%
%  1D integrals are from y = w to y = 0
%
          for ii=1:3
            for jj=1:3
              M_loc(ip(ii),ip(jj)) = M_loc(ip(ii),ip(jj)) + ...
                            oned_f_int( phi_g1(:, jj), phi_a(:,ii), w_g1 );
            end
            b_loc(ip(ii),1) = b_loc(ip(ii),1) + ...
                                  oned_f_int( beta_g1, phi_a(:,ii), w_g1 );
          end

        elseif any(Omega_right == n_el);
%
%  Here we impose boundary term for a specified flux
%  The node points on the boundary are nodes_local([2 3 5]) and
%  are at x_local([2 3 5],:)
%  We need \int f(y) \phi(L, y) dy along the right boundary.
%
          [phi_g1, ip,  ~  ,  w_g1] = boundary(2, x_local, 5); % n_gauss=5;
          for ii=1:3
             b_loc(ip(ii),1) = b_loc(ip(ii),1) + ...
                             oned_f_int( param.flux, phi_g1(:,ii), w_g1 );
          end
        end

%-----------------------------------------------------------------
%% Assemble contributions into the global system matrices
%-----------------------------------------------------------------
%  For M_lab we want all the rows (test functions) but only the
%  columns associated with nodes on this lab
%
        for n_t = 1:nel_dof               % local DOF  - test fcn
          t_glb  = nodes_local(n_t);     % global DOF - test fcn
          for n_u = 1:size(lab_nodes_local, 1)
            n_locj = lab_nodes_local(n_u, 1);  % local DOF in current n_el
            n_glbj = lab_nodes_local(n_u, 2) ...
                         - col_shft(labindex); % global DOF
            M_lab(t_glb,n_glbj) = M_lab(t_glb,n_glbj) ...
                                          +  M_loc(n_t,n_locj);
          end
%
%  Some triangles have nodes on more than one lab;
%  we want only the rows associated with nodes on this lab 
%
          if t_glb >= lP_1 && t_glb <= lP_end 
            t_loc = t_glb - col_shft(labindex); 
            b_lab(t_loc,1)  = b_lab(t_loc,1)  + b_loc(n_t,1);
            F_lab(t_loc,1)  = F_lab(t_loc,1)  + F_loc(n_t,1);
          end

        end % for  n_t

      end % if not empty

    end  % n_el

    fprintf(fid,'Fraction of elements evaluated on this lab  is %8.6f \n',...
                                                      n_el_lab/n_elements);
%
%  Assemble the 'lab' parts in a codistributed format.
%  syntax for version R2009b
%
    codist_matrix = codistributor1d( 2, dPM, [n_equations, n_equations]);
    M = codistributed.build(M_lab, codist_matrix );
    codist_vector = codistributor1d( 1, dPM, [n_equations, 1]);
    b  = codistributed.build(b_lab , codist_vector );
    F  = codistributed.build(F_lab , codist_vector );
   
    fclose(fid);

  end
%
%  This terminates the SPMD block.
%
  return
end
