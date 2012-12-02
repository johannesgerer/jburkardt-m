function [x_g,w_g,phi,p_x,p_y,p_z] = threed_shapeiso(x_local,r,s,t,w)
%-----------------------------------------------------------------------
%  threed_shapeiso.m - computes test functions and derivatives on an
%                      element given element coordinates and Gauss points.
%                      Isoparametric coordinates are used (curved elements)
%
%  Copyright (c) 2002, Jeff Borggaard, Virginia Tech
%  Version: 1.0a
%
%  Usage:    [x_g,w_g,phi,p_x,p_y,p_z] = threed_shapeiso(x_local,r,s,t,w)
%
%  Variables:     x_local
%                        Coordinates of the element nodes
%                 (r,s,t)
%                        Coordinates of Gauss points in unit tetrahedron
%                 w
%                        Gauss weights associated with (r,s,t)
%
%                 x_g
%                        Coordinates of Gauss points in the element
%                 w_g
%                        Gauss weights scaled by the element Jacobian
%                 phi
%                        Value of element shape functions at x_g
%                 p_x
%                 p_y
%                 p_z
%                        First spatial derivatives of phi
%                 p_xx, etc.
%                        Second spatial derivatives of phi
%                        (only applicable with 2nd order or higher)
%                        (currently not implemented)
%-----------------------------------------------------------------------
  x      = x_local;
  [n,t1] = size(x);  % t1 had better be 3
  rule   = length(r);

  if (n == 10)
    % The following assumes isoparametric elements
    c0 =   x( 1,:);                                      % 1
    c1 =-3*x( 1,:) -   x( 2,:) + 4*x( 5,:)            ;  % r
    c2 =-3*x( 1,:) -   x( 3,:) + 4*x( 7,:)            ;  % s
    c3 =-3*x( 1,:) -   x( 4,:) + 4*x(10,:)            ;  % t
    c4 = 2*x( 1,:) + 2*x( 2,:) - 4*x( 5,:)            ;  % r^2
    c5 = 2*x( 1,:) + 2*x( 3,:) - 4*x( 7,:)            ;  % s^2
    c6 = 2*x( 1,:) + 2*x( 4,:) - 4*x(10,:)            ;  % t^2
    c7 = 4*x( 1,:) - 4*x( 5,:) + 4*x( 6,:) - 4*x( 7,:); % rs
    c8 = 4*x( 1,:) - 4*x( 5,:) + 4*x( 8,:) - 4*x(10,:); % rt
    c9 = 4*x( 1,:) - 4*x( 7,:) + 4*x( 9,:) - 4*x(10,:); % st

    x_g(:,1) = c0(1) + c1(1)*r + c2(1)*s + c3(1)*t + c4(1)*r.^2 ...
             + c5(1)*s.^2 + c6(1)*t.^2 + c7(1)*r.*s + c8(1)*r.*t ...
             + c9(1)*s.*t; 
    xr = c1(1) + 2*c4(1)*r + c7(1)*s + c8(1)*t;
    xs = c2(1) + 2*c5(1)*s + c7(1)*r + c9(1)*t;
    xt = c3(1) + 2*c6(1)*t + c8(1)*r + c9(1)*s;

    x_g(:,2) = c0(2) + c1(2)*r + c2(2)*s + c3(2)*t + c4(2)*r.^2 ...
             + c5(2)*s.^2 + c6(2)*t.^2 + c7(2)*r.*s + c8(2)*r.*t ...
             + c9(2)*s.*t; 
    yr = c1(2) + 2*c4(2)*r + c7(2)*s + c8(2)*t;
    ys = c2(2) + 2*c5(2)*s + c7(2)*r + c9(2)*t;
    yt = c3(2) + 2*c6(2)*t + c8(2)*r + c9(2)*s;

    x_g(:,3) = c0(3) + c1(3)*r + c2(3)*s + c3(3)*t + c4(3)*r.^2 ...
             + c5(3)*s.^2 + c6(3)*t.^2 + c7(3)*r.*s + c8(3)*r.*t ...
             + c9(3)*s.*t; 
    zr = c1(3) + 2*c4(3)*r + c7(3)*s + c8(3)*t;
    zs = c2(3) + 2*c5(3)*s + c7(3)*r + c9(3)*t;
    zt = c3(3) + 2*c6(3)*t + c8(3)*r + c9(3)*s;

    % Compute the Jacobian of the (r,s,t) -> (x,y,z) transformation
    jac = ( xr.*ys.*zt + xs.*yt.*zr + xt.*yr.*zs ...
           -xr.*yt.*zs - xs.*yr.*zt - xt.*ys.*zr );

    w_g = jac.*w;

    % Invert derivatives of the mapping
    rx = ( ys.*zt-yt.*zs )./jac;
    ry = ( xt.*zs-xs.*zt )./jac;
    rz = ( xs.*yt-xt.*ys )./jac;

    sx = ( yt.*zr-yr.*zt )./jac;
    sy = ( xr.*zt-xt.*zr )./jac;
    sz = ( xt.*yr-xr.*yt )./jac;

    tx = ( yr.*zs-ys.*zr )./jac;
    ty = ( xs.*zr-xr.*zs )./jac;
    tz = ( xr.*ys-xs.*yr )./jac;

    % Compute shape function and derivatives at Gauss points
    u  = 1 - r  - s  - t ;
    ux =   - rx - sx - tx;
    uy =   - ry - sy - ty;
    uz =   - rz - sz - tz;
    
    phi = zeros(rule,n);
    phi(:,1)  = u - 2*r.*u - 2*s.*u - 2*t.*u;
    phi(:,2)  = r - 2*r.*u - 2*r.*s - 2*r.*t;
    phi(:,3)  = s - 2*r.*s - 2*s.*u - 2*s.*t;
    phi(:,4)  = t - 2*r.*t - 2*s.*t - 2*t.*u;
    phi(:,5)  = 4*r.*u;
    phi(:,6)  = 4*r.*s;
    phi(:,7)  = 4*s.*u;
    phi(:,8)  = 4*r.*t;
    phi(:,9)  = 4*s.*t;
    phi(:,10) = 4*t.*u;
   
    p_x = zeros(rule,n);
    p_x(:,1)  = ux - 2*rx.*u - 2*r.*ux - 2*sx.*u ...
                   - 2*s.*ux - 2*tx.*u - 2*t.*ux    ;
    p_x(:,2)  = rx - 2*rx.*u - 2*r.*ux - 2*rx.*s ...
                   - 2*r.*sx - 2*rx.*t - 2*r.*tx    ;
    p_x(:,3)  = sx - 2*rx.*s - 2*r.*sx - 2*sx.*u ...
                   - 2*s.*ux - 2*sx.*t - 2*s.*tx    ;
    p_x(:,4)  = tx - 2*rx.*t - 2*r.*tx - 2*sx.*t ...
                   - 2*s.*tx - 2*tx.*u - 2*t.*ux    ;
    p_x(:,5)  = 4*rx.*u + 4*r.*ux;
    p_x(:,6)  = 4*rx.*s + 4*r.*sx;
    p_x(:,7)  = 4*sx.*u + 4*s.*ux;
    p_x(:,8)  = 4*rx.*t + 4*r.*tx;
    p_x(:,9)  = 4*sx.*t + 4*s.*tx;
    p_x(:,10) = 4*tx.*u + 4*t.*ux;
   
    p_y = zeros(rule,n);
    p_y(:,1)  = uy - 2*ry.*u - 2*r.*uy - 2*sy.*u ...
                   - 2*s.*uy - 2*ty.*u - 2*t.*uy    ;
    p_y(:,2)  = ry - 2*ry.*u - 2*r.*uy - 2*ry.*s ...
                   - 2*r.*sy - 2*ry.*t - 2*r.*ty    ;
    p_y(:,3)  = sy - 2*ry.*s - 2*r.*sy - 2*sy.*u ...
                   - 2*s.*uy - 2*sy.*t - 2*s.*ty    ;
    p_y(:,4)  = ty - 2*ry.*t - 2*r.*ty - 2*sy.*t ...
                   - 2*s.*ty - 2*ty.*u - 2*t.*uy    ;
    p_y(:,5)  = 4*ry.*u + 4*r.*uy;
    p_y(:,6)  = 4*ry.*s + 4*r.*sy;
    p_y(:,7)  = 4*sy.*u + 4*s.*uy;
    p_y(:,8)  = 4*ry.*t + 4*r.*ty;
    p_y(:,9)  = 4*sy.*t + 4*s.*ty;
    p_y(:,10) = 4*ty.*u + 4*t.*uy;
   
    p_z = zeros(rule,n);
    p_z(:,1)  = uz - 2*rz.*u - 2*r.*uz - 2*sz.*u ...
                   - 2*s.*uz - 2*tz.*u - 2*t.*uz    ;
    p_z(:,2)  = rz - 2*rz.*u - 2*r.*uz - 2*rz.*s ...
                   - 2*r.*sz - 2*rz.*t - 2*r.*tz    ;
    p_z(:,3)  = sz - 2*rz.*s - 2*r.*sz - 2*sz.*u ...
                   - 2*s.*uz - 2*sz.*t - 2*s.*tz    ;
    p_z(:,4)  = tz - 2*rz.*t - 2*r.*tz - 2*sz.*t ...
                   - 2*s.*tz - 2*tz.*u - 2*t.*uz    ;
    p_z(:,5)  = 4*rz.*u + 4*r.*uz;
    p_z(:,6)  = 4*rz.*s + 4*r.*sz;
    p_z(:,7)  = 4*sz.*u + 4*s.*uz;
    p_z(:,8)  = 4*rz.*t + 4*r.*tz;
    p_z(:,9)  = 4*sz.*t + 4*s.*tz;
    p_z(:,10) = 4*tz.*u + 4*t.*uz;

  else
    error('Only quadratic isoparametric elements are supported\n')
  end
   
