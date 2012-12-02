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
