  function [M] = build_mass_2d(x, e_conn)
%-----------------------------------------------------------------------
%  build_mass_2d.m - builds the finite element "Mass" matrix
%                    assuming H^1(\Omega)  (no Dirichlet)
%
%  Copyright (c) 2007, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    [M] = build_mass_2d
%
%  Variables:  x
%                        Nodal coordinates
%              e_conn
%                        2D element connectivity
%
%              M
%                        M_{ij} = \int h_i h_j dx
%-----------------------------------------------------------------------

  n_gauss          = 3;  % number of points used in integration
                         % 3 should be sufficient for low-order elems.

  [n_nodes   , n_dimensions] = size(x     );
  [n_elements, nel_dof     ] = size(e_conn);
    
  %---------------------------------------------------------------------
  %  Build the finite element matrices
  %---------------------------------------------------------------------
  M = sparse(n_nodes,n_nodes);
  b = zeros (n_nodes,1      );

  [r,s,w] = twod_gauss(n_gauss);
  
  for n_el=1:n_elements
    % compute value of each test function and their spatial derivaties
    % at the integration points
    nodes_local           = e_conn(n_el,:);
    x_local               = x(nodes_local,:);
    [x_g,w_g,phi,p_x,p_y] = twod_shape(x_local,r,s,w);
      
    % compute the value of weighting function at the Gauss points
    p_g = p_function(x_g);
    
    %-------------------------------------------------------------------
    %  Integrate the element contributions to M
    %-------------------------------------------------------------------
    M_loc = twod_bilinear(p_g, phi, phi, w_g);

    %-----------------------------------------------------------------
    %  Assemble contributions into the global system matrix
    %-----------------------------------------------------------------
    M(nodes_local,nodes_local) = M(nodes_local,nodes_local) + M_loc;
    
  end
  
%-----------------------------------------------------------------------
%  Supporting Functions
%-----------------------------------------------------------------------
% twod_gauss
% twod_shape
% twod_bilinear

function p = p_function(x)
  p = 1;

function [r,s,w] = twod_gauss(rule)
%-----------------------------------------------------------------------
%  twod_gauss.m - calculate Gauss integration points for triangular 
%                 elements
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    [r,s,w] = twod_gauss(rule)
%
%  Variables:     rule
%                        Number of Gauss points:
%                 r
%                        xi coordinate of Gauss points
%                 s
%                        eta coordinate of Gauss points
%                 w
%                        Gauss weights corresponding to (r,s)
%-----------------------------------------------------------------------

  if (rule == 1)
    % The trivial linear triangle case

  elseif (rule == 3)
    % The following points correspond to a 3 point rule
    r    = zeros(3,1);  s    = zeros(3,1);
    r(1) = 2/3;         s(1) = 1/6;
    r(2) = 1/6;         s(2) = 2/3;
    r(3) = 1/6;         s(3) = 1/6;

    w    = zeros(3,1);
    w(1) = 1/6;
    w(2) = w(1);
    w(3) = w(1);
   
  elseif (rule == 7)
    % The following points correspond to a 7 point rule,
    % see Dunavant, IJNME, v. 21, pp. 1129-1148, 1995.
    % or Braess, p. 95.

    t1 = 1/3;    t2 = (6+sqrt(15))/21;   t3 = 4/7 - t2;
   
    r    = zeros(7,1);  s    = zeros(7,1);
    r(1) = t1;          s(1) = t1;
    r(2) = t2;          s(2) = t2;
    r(3) = 1-2*t2;      s(3) = t2;
    r(4) = t2;          s(4) = r(3);
    r(5) = t3;          s(5) = t3;
    r(6) = 1-2*t3;      s(6) = t3;
    r(7) = t3;          s(7) = r(6);
   
    t1 = 9/80;    t2 = ( 155+sqrt(15))/2400;  t3 = 31/240 - t2;
     
    w     = zeros(7,1);
    w(1)  = t1;
    w(2)  = t2;
    w(3)  = t2;
    w(4)  = t2;
    w(5)  = t3;
    w(6)  = t3;
    w(7)  = t3;

  elseif (rule == 13)
    r     = zeros(13,1);      s     = zeros(13,1);
    r(1)  = 0.0651301029022;  s(1)  = r(1);
    r(2)  = 0.8697397941956;  s(2)  = r(1);
    r(3)  = r(1);             s(3)  = r(2);
    r(4)  = 0.3128654960049;  s(4)  = 0.0486903154253;
    r(5)  = 0.6384441885698;  s(5)  = r(4);
    r(6)  = s(4);             s(6)  = r(5);
    r(7)  = r(5);             s(7)  = r(6);
    r(8)  = r(4);             s(8)  = r(5);
    r(9)  = r(6);             s(9)  = r(4);
    r(10) = 0.2603459660790;  s(10) = r(10);
    r(11) = 0.4793080678419;  s(11) = r(10);
    r(12) = r(10);            s(12) = r(11);
    r(13) = 0.3333333333333;  s(13) = r(13);

    w     = zeros(13,1);
    w(1)  = 0.0533472356088;
    w(2)  = w(1);
    w(3)  = w(1);
    w(4)  = 0.0771137608903;
    w(5)  = w(4);
    w(6)  = w(4);
    w(7)  = w(4);
    w(8)  = w(4);
    w(9)  = w(4);
    w(10) = 0.1756152574332;
    w(11) = w(10);
    w(12) = w(10);
    w(13) =-0.1495700444677;
    
    w = w/2;
  else
    error('quadrature rules other than 1, 3, 7 or 13 are not supported\n');
    keyboard
  end
function M = twod_bilinear( kernel, phi, test, w_g )
%-----------------------------------------------------------------------
%  twod_bilinear.m - routine to compute \int{ kernel*phi*test }
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    M = twod_bilinear(kernel, phi, test, w_g)
%
%  Variables:     kernel
%                        Kernel function in the integral evaluated
%                        at the Gauss points
%
%                 phi
%                        matrix of element test functions evaluated
%                        at the Gauss points (dim: n_gauss, n_dof)
%
%                 test
%                        matrix of test functions evaluated at the
%                        Gauss points (dim: n_gauss, n_dof)
%
%                 w_g
%                        Row vector of Gauss weights
%-----------------------------------------------------------------------
  [n_gauss,n_row] = size(test);
  [n_g1   ,n_col] = size(phi );

  M = zeros(n_row,n_col);
  for i=1:n_row
    for j=1:n_col
 %     M(i,j) = ( kernel' .* phi(:,i)' )*( test(:,j) .* w_g );
      M(i,j) = ( w_g'    .* test(:,i)' ) * ( kernel .* phi(:,j) );
    end
  end
function [x_g,w_g,phi,p_x,p_y] = twod_shape(x_local,r,s,w)
%-----------------------------------------------------------------------
%  twod_shape.m - computes test functions and derivatives on an
%                 element given element coordinates and Gauss points.
%
%                 ! Note: optimized for straight-sided elements.  Use
%                 ! `twod_shapeiso' for isoparametric elements.
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    [x_g,w_g,phi,p_x,p_y] = twod_shape(x_local,r,w)
%
%  Variables:     x_local
%                        Coordinates of the element nodes
%                 (r,s)
%                        Coordinates of Gauss points in unit triangle
%                 w
%                        Gauss weights associated with (r,s)
%
%                 x_g
%                        Coordinates of Gauss points in the element
%                 w_g
%                        Gauss weights scaled by the element Jacobian
%                 phi
%                        Value of element shape functions at x_g
%                 p_x
%                 p_y
%                        First spatial derivatives of phi
%
%  Changes:
%      n = 7 implemented by Alexander Hay, 2007
%-----------------------------------------------------------------------
  x          = x_local;
  [n,ncoord] = size(x);

%  fprintf('Space Dimension           : %i\n',ncoord)
%  fprintf('Number of shape functions : %i\n',n)

  if (ncoord ~= 2)
     fprintf('### WARNING : TWOD_SHAPE ###\n')
     fprintf('Number of space coordinates : %i\n',ncoord)
     fprintf('### WARNING : TWOD_SHAPE ###\n')
  end

  rule = length(r);
   
  % Compute (r,s) -> (x,y) transformation for straight-sided elements
  c0 =  x(1,:);
  c1 = -x(1,:) + x(2,:);
  c2 = -x(1,:)          + x(3,:);

  x_g(:,1) = c0(1) + c1(1)*r + c2(1)*s;
  xr  = c1(1);
  xs  = c2(1);

  x_g(:,2) = c0(2) + c1(2)*r + c2(2)*s;
  yr  = c1(2);
  ys  = c2(2);

  % Compute the Jacobian of the (r,s) -> (x,y) transformation
  jac = xr.*ys - yr.*xs;
  w_g = jac.*w;

  rx  = ys./jac;
  sx  =-yr./jac;
  ry  =-xs./jac;
  sy  = xr./jac;

  if (n == 3)
    % Compute shape function and derivatives at Gauss points
    phi = zeros(rule,n);
    phi(:,1) = 1. - r  - s;
    phi(:,2) =      r     ;
    phi(:,3) =           s;
   
    p_x = zeros(rule,n);
    p_x(:,1) =    - rx - sx;
    p_x(:,2) =      rx     ;
    p_x(:,3) =           sx;
   
    p_y = zeros(rule,n);
    p_y(:,1) =    - ry - sy;
    p_y(:,2) =      ry     ;
    p_y(:,3) =           sy;

  elseif (n == 6)
    % Compute shape function and derivatives at Gauss points
    phi = zeros(rule,n);
    phi(:,1) = 1. - 3.*r - 3.*s + 2.*r.*r + 4.*r.*s + 2.*s.*s;
    phi(:,2) =    - 1.*r        + 2.*r.*r                    ;
    phi(:,3) =           - 1.*s                     + 2.*s.*s;
    phi(:,4) =      4.*r        - 4.*r.*r - 4.*r.*s          ;
    phi(:,5) =                              4.*r.*s          ;
    phi(:,6) =             4.*s           - 4.*r.*s - 4.*s.*s;
  
    p_x = zeros(rule,n);
    p_x(:,1) = ( -3. + 4.*r + 4.*s ).*rx + ( -3. + 4.*r + 4.*s ).*sx;
    p_x(:,2) = ( -1. + 4.*r        ).*rx                            ;
    p_x(:,3) =                             ( -1.        + 4.*s ).*sx;
    p_x(:,4) = (  4. - 8.*r - 4.*s ).*rx + (     - 4.*r        ).*sx;
    p_x(:,5) = (              4.*s ).*rx + (       4.*r        ).*sx;
    p_x(:,6) = (            - 4.*s ).*rx + (  4. - 4.*r - 8.*s ).*sx;
   
    p_y = zeros(rule,n);
    p_y(:,1) = ( -3. + 4.*r + 4.*s ).*ry + ( -3. + 4.*r + 4.*s ).*sy;
    p_y(:,2) = ( -1. + 4.*r        ).*ry                            ;
    p_y(:,3) =                             ( -1.        + 4.*s ).*sy;
    p_y(:,4) = (  4. - 8.*r - 4.*s ).*ry + (     - 4.*r        ).*sy;
    p_y(:,5) = (              4.*s ).*ry + (       4.*r        ).*sy;
    p_y(:,6) = (            - 4.*s ).*ry + (  4. - 4.*r - 8.*s ).*sy;
    
  elseif (n == 7)

    % Compute shape function and derivatives at Gauss points
    phi = zeros(rule,n);
    phi(:,1) = (1-r-s).*(2.*(1-r-s)-1) +  3.*(1.-r-s).*r.*s; 
    phi(:,2) = r.*(2.*r-1)             +  3.*(1.-r-s).*r.*s; 
    phi(:,3) = s.*(2.*s-1)             +  3.*(1.-r-s).*r.*s; 
    phi(:,4) = 4.*(1-r-s).*r           - 12.*(1.-r-s).*r.*s; 
    phi(:,5) = 4.*r.*s                 - 12.*(1.-r-s).*r.*s; 
    phi(:,6) = 4.*s.*(1-r-s)           - 12.*(1.-r-s).*r.*s; 
    phi(:,7) = 27.*(1-r-s).*r.*s;                   

    p_r = zeros(rule,n);
    p_r(:,1) = -3 + 4.*r + 7.*s - 6.*r.*s - 3.*(s.^2);
    p_r(:,2) = -1 + 4.*r + 3.*s - 6.*r.*s - 3.*(s.^2);
    p_r(:,3) =             3.*s - 6.*r.*s - 3.*(s.^2);
    p_r(:,4) =  4 - 8.*r -16.*s +24.*r.*s +12.*(s.^2);
    p_r(:,5) =           - 8.*s +24.*r.*s +12.*(s.^2);
    p_r(:,6) =           -16.*s +24.*r.*s +12.*(s.^2);
    p_r(:,7) =            27.*s -54.*r.*s -27.*(s.^2);

    p_s = zeros(rule,n);
    p_s(:,1) = -3 + 7.*r + 4.*s - 6.*r.*s - 3.*(r.^2);
    p_s(:,2) =      3.*r        - 6.*r.*s - 3.*(r.^2);
    p_s(:,3) = -1 + 3.*r + 4.*s - 6.*r.*s - 3.*(r.^2);
    p_s(:,4) =    -16.*r        +24.*r.*s +12.*(r.^2);
    p_s(:,5) =    - 8.*r        +24.*r.*s +12.*(r.^2);
    p_s(:,6) =  4 -16.*r - 8.*s +24.*r.*s +12.*(r.^2);
    p_s(:,7) =     27.*r        -54.*r.*s -27.*(r.^2);

    p_x = p_r.*rx + p_s.*sx;
    p_y = p_r.*ry + p_s.*sy;

  else
    fprintf('element not supported');
  end
