function [x_g,w_g,phi,p_x,p_y] = twod_shapeiso(x_local,r,s,w)
%-----------------------------------------------------------------------
%  twod_shapeiso.m - computes test functions and derivatives on an
%                    element given element coordinates and Gauss points.
%                    
%                    ! Note: specifically set up for isoparametric
%                    ! elements.  Use `twod_shape' for linear elements.
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    [x_g,w_g,phi,p_x,p_y] = twod_shapeiso(x_local,r,w)
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
%                 p_xx
%                        Second spatial derivatives of phi
%                        (only applicable with 2nd order or higher)
%                        (currently not implemented)
%-----------------------------------------------------------------------
  x      = x_local;
  [n,t1] = size(x);  % t1 had better be 2
  rule   = length(r);
   
  if (n == 6)
    % Transform coordinates for quadratic element
    c0 =    x(1,:);
    c1 =-3.*x(1,:) -    x(2,:) + 4.*x(4,:);
    c2 =-3.*x(1,:) -    x(3,:) + 4.*x(6,:);
    c3 = 2.*x(1,:) + 2.*x(2,:) - 4.*x(4,:);
    c4 = 4.*x(1,:) - 4.*x(4,:) + 4.*x(5,:) - 4.*x(6,:);
    c5 = 2.*x(1,:) + 2.*x(3,:) - 4.*x(6,:);
     
    x_g(:,1) = c0(1) + c1(1)*r + c2(1)*s + c3(1)*r.*r +...
               c4(1)*r.*s + c5(1)*s.*s;
    xr  = c1(1) + 2.*c3(1)*r + c4(1)*s;
    xs  = c2(1) + c4(1)*r + 2.*c5(1)*s;
     
    x_g(:,2) = c0(2) + c1(2)*r + c2(2)*s + c3(2)*r.*r +...
               c4(2)*r.*s + c5(2)*s.*s;
    yr  = c1(2) + 2.*c3(2)*r + c4(2)*s;
    ys  = c2(2) + c4(2)*r + 2.*c5(2)*s;
     
    w_g = (xr.*ys-yr.*xs).*w;

    % Compute the Jacobian of the (r,s) -> (x,y) transformation
    jac = 1./( xr.*ys - yr.*xs );
    rx  = ys.*jac;
    sx  =-yr.*jac;
    ry  =-xs.*jac;
    sy  = xr.*jac;

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
  else
    fprintf('element not supported');
  end
