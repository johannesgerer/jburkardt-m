  function [] = steady_navierstokes_3d(flow_case)
%-------------------------------------------------------------------------------
%  steady_navierstokes_3d.m - solves the 3D steady-state Stokes equations.
%
%                 Features include:
%                     - Taylor-Hood elements
%                     - Uzawa (augmented Lagrangian) Method
%
%                     - an efficient sparse matrix implementation
%             
%
%  Copyright (c) 2008, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    [] = steady_navierstokes_3da(flow_case)
%
%  Variables:  flow_case
%                         = 1  a verification
%                         = 2  flow past a sphere in a pipe
%
%              mesh_root
%              Re         =  Reynolds number  (1/viscosity)
%-------------------------------------------------------------------------------

tic
%-------------------------------------------------------------------------------
%  Define "Input" Parameters
%-------------------------------------------------------------------------------
  if ( nargin<1 )
    flow_case = 2;
  end
  
  fprintf(' running flow_case=%d\n',flow_case)
  
  
  n_gauss          = 5;        % number of quadrature points
  
  max_iterations   = 25;  
  max_elem_per_partition = 10000;  % maximum number of elements in a mesh
                                   % per partition (for memory efficiency)
  
  epsilon          = 0.0005;   % penalty parameter


  if ( flow_case == 1 )
    Re = 10;

  elseif ( flow_case == 2 )
    Re = 1;
    
  else
    error(' steady_navierstokes_3d: flow_case=%d is not defined\n',flow_case)
    
  end
  
  mu               = 1/Re;
  
%-------------------------------------------------------------------------------
%  Geometry Module
%-------------------------------------------------------------------------------
  %-----------------------------------------------------------------------------
  %  FLOW_CASE==1    -a Verification Example-
  %-----------------------------------------------------------------------------
  if ( flow_case == 1 )   % Validation example
    x_l = 0;  y_l = 0;  z_l = 0;
    x_r = 5;  y_r = 1;  z_r = 1;
    
    n_nodesx = 21;  n_nodesy = 21;  n_nodesz = 21;
    
    [ x, e_conn ] = threed_mesh( 2, x_r-x_l , y_r-y_l , z_r-z_l , ...
                                    n_nodesx, n_nodesy, n_nodesz );

    x(:,1) = x(:,1)+x_l;  x(:,2) = x(:,2)+y_l;  x(:,3) = x(:,3)+z_l;

    [n_nodes,dim] = size(x);


    %  Specify Dirichlet boundary conditions on velocities
    %    variable(1) = u
    %    variable(2) = v
    %    variable(3) = w
  
    %  Setting Dirichlet values on the left (x=x_l) and right (x=x_r) 
    %  faces
    n = 0;
    for i=1:n_nodes
      if ( abs(x(i,1)-x_l) < 1e-8 )  % set inflow conditions at x=0
        n = n + 1;
        variable(1).dirichlet_node(n)  = i;
        variable(1).dirichlet_value(n) = d_function(x(i,:));
        n = n + 1;
        variable(2).dirichlet_node(n)  = i;
        variable(2).dirichlet_value(n) = 0;
        n = n + 1;
        variable(3).dirichlet_node(n)  = i;
        variable(3).dirichlet_value(n) = 0;

      elseif ( abs(x(i,2)-y_l) < 1e-8 || abs(x(i,2)-y_r) < 1e-8 || ...
               abs(x(i,3)-z_l) < 1e-8 || abs(x(i,3)-z_r) < 1e-8    ) % set wall
        n = n + 1;
        variable(1).dirichlet_node(n)  = i;
        variable(1).dirichlet_value(n) = 0;
        n = n + 1;
        variable(2).dirichlet_node(n)  = i;
        variable(2).dirichlet_value(n) = 0;
        n = n + 1;
        variable(3).dirichlet_node(n)  = i;
        variable(3).dirichlet_value(n) = 0;
 
      end
    end

    nd_val = n;
  end % flow_case==1

  %-----------------------------------------------------------------------------
  %  FLOW_CASE==2    -Flow past a sphere in a pipe-
  %-----------------------------------------------------------------------------
  if ( flow_case==2 )
    
    mesh_root = 'sphere_mesh2rcm';
    
    x      = load( strcat(mesh_root,'.node') );
    e_conn = load( strcat(mesh_root,'.elem') );
    
    b_node = load( strcat(mesh_root,'.boundary') );
    
    inflow_counter  = 0;
    outflow_counter = 0;
    wall_counter    = 0;
    
    for n = b_node'
      r2 = x(n,1)^2 + x(n,2)^2;
      
      % Inflow Boundary Conditions
      if ( abs( x(n,3)+2 ) < 1e-3 )
        inflow_counter = inflow_counter + 1;
        inflow_nodes(inflow_counter) = n;
        
      elseif ( abs( x(n,3)-7 ) < 1e-3  &&  r2 < 4 -1e-3 )
        outflow_counter = outflow_counter + 1;
        outflow_nodes(outflow_counter) = n;
        
      else
        wall_counter = wall_counter + 1;
        wall_nodes(wall_counter) = n;
        
      end
      
    end % boundary node loop
    
    nd_val = length(b_node);
  end % flow_case==2
  
%-------------------------------------------------------------------------------
%  Solver Module
%-------------------------------------------------------------------------------
  [n_nodes   , n_dimensions] = size(x     );
  [n_elements, nel_dof     ] = size(e_conn);
  
  %-----------------------------------------------------------------------------
  %  Determine equation numbers, set up boundary condition information
  %-----------------------------------------------------------------------------
  n_diru      = 0;
  n_equations = 0;
  ide_u       = zeros(n_nodes,3);
  ide_p       = zeros(n_nodes,1);

  dir_u       = zeros(nd_val,1);
  
  if ( flow_case==1 )
    for n_var=1:3
      for n_nd=1:n_nodes
        is_dir  = 0;
        for i=1:length(variable(n_var).dirichlet_node)
          if ( variable(n_var).dirichlet_node(i)==n_nd )
            is_dir = i;
          end
        end
        % determine whether this degree of freedom corresponds to a
        % Dirichlet boundary condition.
        if (is_dir>0)
          n_diru = n_diru + 1;
          ide_u(n_nd,n_var) = -n_diru;
          dir_u(n_diru) = variable(n_var).dirichlet_value(is_dir);
        else
          n_equations = n_equations + 1;
          ide_u(n_nd,n_var) = n_equations;
        end
      end
    end
  end % flow_case==1
  
  if ( flow_case==2 )
    for n_nd=inflow_nodes
      r2 = x(n_nd,1)^2 + x(n_nd,2)^2;
      
      n_diru        = n_diru + 1;
      ide_u(n_nd,1) = -n_diru;
      dir_u(n_diru) = 0;
      
      n_diru        = n_diru + 1;
      ide_u(n_nd,2) = -n_diru;
      dir_u(n_diru) = 0;
      
      n_diru        = n_diru + 1;
      ide_u(n_nd,3) = -n_diru;
      dir_u(n_diru) = 1-0.25*r2;
    end
    
    for n_nd=wall_nodes
      for j=1:3
        n_diru      = n_diru + 1;
        ide_u(n_nd,j) = -n_diru;
        dir_u(n_diru) = 0;
      end
    end  
    
    for n_nd=1:n_nodes
      if ( ide_u(n_nd,1)==0 )
        for j=1:3
          n_equations   = n_equations + 1;
          ide_u(n_nd,j) = n_equations;
        end
      end
    end
  end % flow_case==2
  
  
  n_equations_u = n_equations;

  for n_el=1:n_elements
    vertex = e_conn(n_el,1:4);
    for n_c=1:4
      if (ide_p(vertex(n_c))==0)
        n_equations = n_equations + 1;
        ide_p(vertex(n_c)) = n_equations;
      end
    end
  end
  
  n_equations_p = n_equations - n_equations_u;
  
  t0=toc;
  fprintf('time for setup is: %d\n',t0)
  
  fprintf('  solving 3d Navier-Stokes equations for problem with\n')
  fprintf('    %d nodes and %d elements, corresponding to\n',n_nodes,n_elements)
  fprintf('    %d velocity and %d pressure degrees of freedom\n\n',...
          n_equations_u, n_equations_p)
%-------------------------------------------------------------------------------
%  Begin Newton Iterations
%-------------------------------------------------------------------------------

  %  Initial Guess (must satisfy boundary conditions)
  u = zeros(n_nodes,1); 
  v = zeros(n_nodes,1);
  w = zeros(n_nodes,1);
  
  for n=1:n_nodes
    index = ide_u(n,1);
    if (index<0)
      u(n) = dir_u(-index);
    end

    index = ide_u(n,2);
    if (index<0)
      v(n) = dir_u(-index);
    end
    
    index = ide_u(n,3);
    if (index<0)
      w(n) = dir_u(-index);
    end
  end
  
  % initialize the pressure
  p = zeros(n_nodes,1);

  converged = 0;
  diverged  = 0;
  iteration = 0;
  
  while (~converged && ~diverged)
  
    tic
    iteration = iteration + 1;
    
    fprintf('--------------------------------------------------\n')
    fprintf('! Newton Iteration %d \n',iteration)
    fprintf('--------------------------------------------------\n')

    %  Integrate finite element matrices
    
    %  Define mesh partitions for integration
    n_part = floor( n_elements / (max_elem_per_partition+1) ) + 1;
    elem_segment = floor( linspace(0,n_elements,n_part+1) )
    max_part_size = max( diff( elem_segment ) );
        
    res  = zeros (n_equations,          1); % weak residual vector

    [r,s,t,wt] = threed_gauss(n_gauss);
    one        = ones(length(r),1);

    for n_pt=1:n_part
      II        = zeros(34*34*max_part_size,1);
      JJ        = zeros(34*34*max_part_size,1);
      XX        = zeros(34*34*max_part_size,1);
      ntriplets = 0;
    

    for n_el=elem_segment(n_pt)+1:elem_segment(n_pt+1)
      % compute value of each test function and their spatial derivaties
      % at the integration points
      nodes_local                     = e_conn(n_el,:);
      x_local                         = x(nodes_local,:);
      [x_g,wt_g,phi,phi_x,phi_y,phi_z] = threed_shape(x_local       ,r,s,t,wt);
      [x_g,wt_g,psi,psi_x,psi_y,psi_z] = threed_shape(x_local(1:4,:),r,s,t,wt);
      
      % compute the value of each variable at the Gauss points
      mu_g      = mu*one;
      epsilon_g = epsilon*one;
      
      fx_g      = fx_function(x_g,mu);
      fy_g      = fy_function(x_g);
      fz_g      = fz_function(x_g);
    
      u_g       = phi  *u(nodes_local);
      u_xg      = phi_x*u(nodes_local);
      u_yg      = phi_y*u(nodes_local);
      u_zg      = phi_z*u(nodes_local);
      
      v_g       = phi  *v(nodes_local);
      v_xg      = phi_x*v(nodes_local);
      v_yg      = phi_y*v(nodes_local);
      v_zg      = phi_z*v(nodes_local);
      
      w_g       = phi  *w(nodes_local);
      w_xg      = phi_x*w(nodes_local);
      w_yg      = phi_y*w(nodes_local);
      w_zg      = phi_z*w(nodes_local);
      
      p_g       = psi  *p(nodes_local(1:4));
      
      %-------------------------------------------------------------------------
      %  Assemble the weak form of the equations (element contributions)
      %-------------------------------------------------------------------------
      a11_loc =-threed_bilinear(    2*mu_g, phi_x, phi_x, wt_g) ...
              - threed_bilinear(      mu_g, phi_y, phi_y, wt_g) ...
              - threed_bilinear(      mu_g, phi_z, phi_z, wt_g) ...
              - threed_bilinear(       u_g, phi_x, phi  , wt_g) ...
              - threed_bilinear(       v_g, phi_y, phi  , wt_g) ...
              - threed_bilinear(       w_g, phi_z, phi  , wt_g) ...
              - threed_bilinear(      u_xg, phi  , phi  , wt_g) ;
                
      a12_loc =-threed_bilinear(      mu_g, phi_x, phi_y, wt_g) ...
              - threed_bilinear(      u_yg, phi  , phi  , wt_g) ;
      
      a13_loc =-threed_bilinear(      mu_g, phi_x, phi_z, wt_g) ...
              - threed_bilinear(      u_zg, phi  , phi  , wt_g) ;
      
      a21_loc =-threed_bilinear(      mu_g, phi_y, phi_x, wt_g) ...
              - threed_bilinear(      v_xg, phi  , phi  , wt_g) ;
    
      a22_loc =-threed_bilinear(      mu_g, phi_x, phi_x, wt_g) ...
              - threed_bilinear(    2*mu_g, phi_y, phi_y, wt_g) ...
              - threed_bilinear(      mu_g, phi_z, phi_z, wt_g) ...
              - threed_bilinear(       u_g, phi_x, phi  , wt_g) ...
              - threed_bilinear(       v_g, phi_y, phi  , wt_g) ...
              - threed_bilinear(       w_g, phi_z, phi  , wt_g) ...
              - threed_bilinear(      v_yg, phi  , phi  , wt_g) ;
              
      a23_loc =-threed_bilinear(      mu_g, phi_y, phi_z, wt_g) ...
              - threed_bilinear(      v_zg, phi  , phi  , wt_g) ;
      
      a31_loc =-threed_bilinear(      mu_g, phi_z, phi_x, wt_g) ...
              - threed_bilinear(      w_xg, phi  , phi  , wt_g) ;
              
      a32_loc =-threed_bilinear(      mu_g, phi_z, phi_y, wt_g) ...
              - threed_bilinear(      w_yg, phi  , phi  , wt_g) ;
              
      a33_loc =-threed_bilinear(      mu_g, phi_x, phi_x, wt_g) ...
              - threed_bilinear(      mu_g, phi_y, phi_y, wt_g) ...
              - threed_bilinear(    2*mu_g, phi_z, phi_z, wt_g) ...
              - threed_bilinear(       u_g, phi_x, phi  , wt_g) ...
              - threed_bilinear(       v_g, phi_y, phi  , wt_g) ...
              - threed_bilinear(       w_g, phi_z, phi  , wt_g) ...
              - threed_bilinear(      w_zg, phi  , phi  , wt_g) ;
                
      b1_loc  = threed_bilinear(       one, phi_x, psi  , wt_g) ;
      b2_loc  = threed_bilinear(       one, phi_y, psi  , wt_g) ;
      b3_loc  = threed_bilinear(       one, phi_z, psi  , wt_g) ;
    
      m_loc   = threed_bilinear( epsilon_g./mu_g, psi  , psi  , wt_g) ;
    
      f1_loc  = threed_f_int(                              fx_g, phi  , wt_g) ...
              - threed_f_int( u_g.*u_xg + v_g.*u_yg + w_g.*u_zg, phi  , wt_g) ...
              + threed_f_int(                               p_g, phi_x, wt_g) ...
              - threed_f_int(                      2*mu_g.*u_xg, phi_x, wt_g) ...
              - threed_f_int(                 mu_g.*(u_yg+v_xg), phi_y, wt_g) ...
              - threed_f_int(                 mu_g.*(u_zg+w_xg), phi_z, wt_g) ;
      
      f2_loc  = threed_f_int(                              fy_g, phi  , wt_g) ...
              - threed_f_int( u_g.*v_xg + v_g.*v_yg + w_g.*v_zg, phi  , wt_g) ...
              + threed_f_int(                               p_g, phi_y, wt_g) ...
              - threed_f_int(                 mu_g.*(u_yg+v_xg), phi_x, wt_g) ...
              - threed_f_int(                      2*mu_g.*v_yg, phi_y, wt_g) ...
              - threed_f_int(                 mu_g.*(v_zg+w_yg), phi_z, wt_g) ;
      
      f3_loc  = threed_f_int(                              fz_g, phi  , wt_g) ...
              - threed_f_int( u_g.*w_xg + v_g.*w_yg + w_g.*w_zg, phi  , wt_g) ...
              + threed_f_int(                               p_g, phi_z, wt_g) ...
              - threed_f_int(                 mu_g.*(u_zg+w_xg), phi_x, wt_g) ...
              - threed_f_int(                 mu_g.*(v_zg+w_yg), phi_y, wt_g) ...
              - threed_f_int(                      2*mu_g.*w_zg, phi_z, wt_g) ;

      f4_loc  = threed_f_int(                u_xg + v_yg + w_zg, psi  , wt_g) ...
              + epsilon/mu*...
                threed_f_int(                               p_g, psi  , wt_g) ;
      
      %-------------------------------------------------------------------------
      %  Assemble contributions into the global system matrix
      %-------------------------------------------------------------------------
      % u-momentum equations
      for n_t=1:10
        n_test = ide_u(nodes_local(n_t),1);
        if (n_test > 0)  % this is an unknown, fill the row
          for n_u=1:10
            n_unku = ide_u(nodes_local(n_u),1);
            n_unkv = ide_u(nodes_local(n_u),2);
            n_unkw = ide_u(nodes_local(n_u),3);
            if (n_unku > 0)
              ntriplets = ntriplets + 1;
              II( ntriplets ) = n_test;
              JJ( ntriplets ) = n_unku;
              XX( ntriplets ) = a11_loc(n_t,n_u);
            end
            %
            if (n_unkv > 0)
              ntriplets = ntriplets + 1;
              II( ntriplets ) = n_test;
              JJ( ntriplets ) = n_unkv;
              XX( ntriplets ) = a12_loc(n_t,n_u);
            end
            %
            if (n_unkw > 0)
              ntriplets = ntriplets + 1;
              II( ntriplets ) = n_test;
              JJ( ntriplets ) = n_unkw;
              XX( ntriplets ) = a13_loc(n_t,n_u);
            end
          end
          for n_p=1:4
            n_unkp = ide_p(nodes_local(n_p));

            ntriplets = ntriplets + 1;
            II( ntriplets ) = n_test;
            JJ( ntriplets ) = n_unkp;
            XX( ntriplets ) = b1_loc(n_p,n_t);
          end
          res(n_test) = res(n_test) + f1_loc(n_t);
        end
      end

      
      % v-momentum equations
      for n_t=1:10
        n_test = ide_u(nodes_local(n_t),2);
        if (n_test > 0)  % this is an unknown, fill the row
          for n_u=1:10
            n_unku = ide_u(nodes_local(n_u),1);
            n_unkv = ide_u(nodes_local(n_u),2);
            n_unkw = ide_u(nodes_local(n_u),3);
            if (n_unku > 0)
              ntriplets = ntriplets + 1;
              II( ntriplets ) = n_test;
              JJ( ntriplets ) = n_unku;
              XX( ntriplets ) = a21_loc(n_t,n_u);
            end
            %
            if (n_unkv > 0)
              ntriplets = ntriplets + 1;
              II( ntriplets ) = n_test;
              JJ( ntriplets ) = n_unkv;
              XX( ntriplets ) = a22_loc(n_t,n_u);
            end
            %
            if (n_unkw > 0)
              ntriplets = ntriplets + 1;
              II( ntriplets ) = n_test;
              JJ( ntriplets ) = n_unkw;
              XX( ntriplets ) = a23_loc(n_t,n_u);
            end
          end
          for n_p=1:4
            n_unkp = ide_p(nodes_local(n_p));

            ntriplets = ntriplets + 1;
            II( ntriplets ) = n_test;
            JJ( ntriplets ) = n_unkp;
            XX( ntriplets ) = b2_loc(n_p,n_t);
          end
          res(n_test) = res(n_test) + f2_loc(n_t);
        end
      end

      % w-momentum equations
      for n_t=1:10
        n_test = ide_u(nodes_local(n_t),3);
        if (n_test > 0)  % this is an unknown, fill the row
          for n_u=1:10
            n_unku = ide_u(nodes_local(n_u),1);
            n_unkv = ide_u(nodes_local(n_u),2);
            n_unkw = ide_u(nodes_local(n_u),3);
            if (n_unku > 0)
              ntriplets = ntriplets + 1;
              II( ntriplets ) = n_test;
              JJ( ntriplets ) = n_unku;
              XX( ntriplets ) = a31_loc(n_t,n_u);
            end
            %
            if (n_unkv > 0)
              ntriplets = ntriplets + 1;
              II( ntriplets ) = n_test;
              JJ( ntriplets ) = n_unkv;
              XX( ntriplets ) = a32_loc(n_t,n_u);
            end
            %
            if (n_unkw > 0)
              ntriplets = ntriplets + 1;
              II( ntriplets ) = n_test;
              JJ( ntriplets ) = n_unkw;
              XX( ntriplets ) = a33_loc(n_t,n_u);
            end
          end
          for n_p=1:4
            n_unkp = ide_p(nodes_local(n_p));

            ntriplets = ntriplets + 1;
            II( ntriplets ) = n_test;
            JJ( ntriplets ) = n_unkp;
            XX( ntriplets ) = b3_loc(n_p,n_t);
          end
          res(n_test) = res(n_test) + f3_loc(n_t);
        end
      end

      % continuity equations
      for n_t=1:4
        n_test = ide_p(nodes_local(n_t));
        for n_u=1:10
          n_unku = ide_u(nodes_local(n_u),1);
          n_unkv = ide_u(nodes_local(n_u),2);
          n_unkw = ide_u(nodes_local(n_u),3);
          if (n_unku > 0)
            ntriplets = ntriplets + 1;
            II( ntriplets ) = n_test;
            JJ( ntriplets ) = n_unku;
            XX( ntriplets ) = b1_loc(n_t,n_u);
          end
          %
          if (n_unkv > 0)
            ntriplets = ntriplets + 1;
            II( ntriplets ) = n_test;
            JJ( ntriplets ) = n_unkv;
            XX( ntriplets ) = b2_loc(n_t,n_u);
          end
          %
          if (n_unkw > 0)
            ntriplets = ntriplets + 1;
            II( ntriplets ) = n_test;
            JJ( ntriplets ) = n_unkw;
            XX( ntriplets ) = b3_loc(n_t,n_u);
          end
        end
        for n_p=1:4
          n_unkp = ide_p(nodes_local(n_p));

          ntriplets = ntriplets + 1;
          II( ntriplets ) = n_test;
          JJ( ntriplets ) = n_unkp;
          XX( ntriplets ) = m_loc(n_t,n_p);
        end
        res(n_test) = res(n_test) + f4_loc(n_t);
      end

%       n_uu = find( ide_u(nodes_local,1)>0 );
%       n_vv = find( ide_u(nodes_local,2)>0 );
%       n_ww = find( ide_u(nodes_local,3)>0 );
%       
%       n_unkuu = ide_u(nodes_local(n_uu),1);
%       n_unkvv = ide_u(nodes_local(n_vv),2);
%       n_unkww = ide_u(nodes_local(n_ww),3);
%       n_unkpp = ide_p(nodes_local(1:4));
%       
%       % u-momentum equations
%       J(n_unkuu, n_unkuu) = J(n_unkuu, n_unkuu) + a11_loc(n_uu,n_uu);
%       J(n_unkuu, n_unkvv) = J(n_unkuu, n_unkvv) + a12_loc(n_uu,n_vv);
%       J(n_unkuu, n_unkww) = J(n_unkuu, n_unkww) + a13_loc(n_uu,n_ww);
%       J(n_unkuu, n_unkpp) = J(n_unkuu, n_unkpp) + b1_loc(1:4,n_uu)';
%       
%       res(n_unkuu) = res(n_unkuu) + f1_loc(n_uu);
%       
%       % v-momentum equations
%       J(n_unkvv, n_unkuu) = J(n_unkvv, n_unkuu) + a21_loc(n_vv,n_uu);
%       J(n_unkvv, n_unkvv) = J(n_unkvv, n_unkvv) + a22_loc(n_vv,n_vv);
%       J(n_unkvv, n_unkww) = J(n_unkvv, n_unkww) + a23_loc(n_vv,n_ww);
%       J(n_unkvv, n_unkpp) = J(n_unkvv, n_unkpp) + b2_loc(1:4,n_vv)';
%       
%       res(n_unkvv) = res(n_unkvv) + f2_loc(n_vv);
% 
%       % w-momentum equations
%       J(n_unkww, n_unkuu) = J(n_unkww, n_unkuu) + a31_loc(n_ww,n_uu);
%       J(n_unkww, n_unkvv) = J(n_unkww, n_unkvv) + a32_loc(n_ww,n_vv);
%       J(n_unkww, n_unkww) = J(n_unkww, n_unkww) + a33_loc(n_ww,n_ww);
%       J(n_unkww, n_unkpp) = J(n_unkww, n_unkpp) + b3_loc(1:4,n_ww)';
%       
%       res(n_unkww) = res(n_unkww) + f3_loc(n_ww);
% 
%       % continuity equations
%       J(n_unkpp, n_unkuu) = J(n_unkpp, n_unkuu) + b1_loc(1:4,n_uu);
%       J(n_unkpp, n_unkvv) = J(n_unkpp, n_unkvv) + b2_loc(1:4,n_vv);
%       J(n_unkpp, n_unkww) = J(n_unkpp, n_unkww) + b3_loc(1:4,n_ww);      
%       J(n_unkpp, n_unkpp) = J(n_unkpp, n_unkpp) + m_loc;
%       
%       res(n_unkpp) = res(n_unkpp) + f4_loc;

    end % element loop
    
    n_pt
    if ( n_pt==1 )
      J = sparse( II(1:ntriplets), JJ(1:ntriplets), XX(1:ntriplets), ...
                 n_equations, n_equations);
    else
      J = J + sparse( II(1:ntriplets), JJ(1:ntriplets), XX(1:ntriplets), ...
                 n_equations, n_equations);
    end
    
    end % part
    
    clear II JJ XX
    
    t1=toc;
    fprintf('  time for matrix integration is: %d\n',t1)

%   figure(1)
%   spy(A(1:n_equations_u,n_equations_u+1:end))

    
    %  Direct solve (for small system sizes)
%    tic
%    uvw = -J\res;
%    t2=toc;
%    fprintf('  time for direct solve is: %d\n\n',t2)

    % Iterative solve (ILU preconditioner)
    tic
    setup.type='nofill';   % to save storage
    [JL,JU] = ilu(J,setup);
    t1=toc;
    fprintf('  time to compute ILU preconditioner is: %d\n',t1)
    fprintf('    number of nonzeros in J, L and U are: \n')
    fprintf('      nnz(J)=%d    nnz(L)=%d   nnz(U)=%d\n\n',nnz(J),nnz(JL),nnz(JU))
    tic
    uvw = gmres(J,-res,60,[],[],JL,JU);
    t2=toc;
    fprintf('  time for gmres solve is: %d\n\n',t2)
    
  
    for n=1:n_nodes
      index = ide_u(n,1);
      if (index>0)
        u(n) = u(n) + uvw(index);
      end

      index = ide_u(n,2);
      if (index>0)
        v(n) = v(n) + uvw(index);
      end

      index = ide_u(n,3);
      if (index>0)
        w(n) = w(n) + uvw(index);
      end
    end

    for n=1:n_nodes
      index = ide_p(n,1);
      if (index>0)
        p(n) = p(n) + uvw(index);
      end
    end

    resid_test = norm(res);
    step_test  = norm(uvw);

    fprintf('  || res || = %d, and || step || = %d\n\n',resid_test, step_test);
    
    converged = ( resid_test < 1e-9 & step_test < 1e-9 );
  
    diverged  = iteration>max_iterations;
    
  end % Newton iterations

%-------------------------------------------------------------------------------
%  Post Processing Module
%-------------------------------------------------------------------------------

  tic
%
%  Pressure is only computed at the vertices.
%  Assign pressures at the midside nodes by averaging vertex values.
%
  for n=1:n_elements
    local_nodes = e_conn(n,:);
    p( local_nodes(5) ) = ( p( local_nodes(1) ) + p( local_nodes(2) ) )/2;
    p( local_nodes(6) ) = ( p( local_nodes(2) ) + p( local_nodes(3) ) )/2;
    p( local_nodes(7) ) = ( p( local_nodes(3) ) + p( local_nodes(1) ) )/2;
    p( local_nodes(8) ) = ( p( local_nodes(2) ) + p( local_nodes(4) ) )/2;
    p( local_nodes(9) ) = ( p( local_nodes(3) ) + p( local_nodes(4) ) )/2;
    p( local_nodes(10)) = ( p( local_nodes(1) ) + p( local_nodes(4) ) )/2;
  end
%
%  Save the data in a MATLAB file "ns_3d.mat".
%
  save ns_3d  x e_conn u v w p
%
%  Write out a graphics file.
%
  if ( 0 ) 
    threed_to_tecplot ( x, e_conn, [u,v,w,p], 'ns_3d.plt', 'navier stokes flow' );
  end

  if ( 0 )
    threed_to_vtk ( x, e_conn, [u,v,w,p], 'ns3d_fem.vtk', 'Navier Stokes UVW P' );
  end

  if ( 0 )
    threed_to_vtu ( x, e_conn, [u,v,w,p], 'ns3d_fem.vtu', 'Navier Stokes UVW P' );
  end

  if ( 1 )
    threed_to_vu ( 'ns_3d.vu', x, e_conn, [u,v,w,p] );
  end

  t3=toc;
  fprintf('  time for postprocessing is: %d\n',t3)
end % function
  
%-------------------------------------------------------------------------------
%  Supporting Functions
%-------------------------------------------------------------------------------

function f = fx_function(x,mu)
  f = zeros(length(x),1);
  
  % for flow_case==1
  %  f = -8*mu + 32*mu*(x(:,2).*(1-x(:,2)) + x(:,3).*(1-x(:,3)));
end

function f = fy_function(x)
  f = zeros(length(x),1);
end

function f = fz_function(x)
  f = zeros(length(x),1);
end

function u = d_function(x)
  u = 16*x(:,2).*(1-x(:,2))*x(:,3)*(1-x(:,3));
end
