function [ ur, vr, pr ] = resid_stokes1 ( n, x, y )

%*****************************************************************************80
%
%% RESID_STOKES1 returns residuals of the exact Stokes solution #1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Junping Wang, Yanqiu Wang, Xiu Ye,
%    A robust numerical method for Stokes equations based on divergence-free
%    H(div) finite element methods,
%    SIAM Journal on Scientific Computing,
%    Volume 31, Number 4, 2009, pages 2784-2802.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), Y(N), the coordinates of the points.
%
%    Output, real UR(N), VR(N), PR(N), the residuals in the U,
%    V and P equations.
%
  ur = zeros ( n, 1 );
  vr = zeros ( n, 1 );
  pr = zeros ( n, 1 );
%
%  Get the right hand sides.
%
  [ f, g, h ] = rhs_stokes1 ( n, x, y );
%
%  Form the functions and derivatives.
%
  for i = 1 : n

    u = - 2.0 ...
          * x(i) ^ 2 * ( x(i) - 1.0 ) ^ 2  ...
          * y(i) * ( y(i) - 1.0 ) * ( 2.0 * y(i) - 1.0 );

    ux = - 2.0  ...
          * ( 4.0 * x(i) ^ 3 - 6.0 * x(i) ^ 2  ...
          + 2.0 * x(i) ) ...
          * y(i) * ( y(i) - 1.0 ) * ( 2.0 * y(i) - 1.0 );

    uxx = - 2.0  ...
          * ( 12.0 * x(i) ^ 2 - 12.0 * x(i) + 2.0 ) ...
          * ( 2.0 * y(i) ^ 3 - 3.0 * y(i) ^ 2 + y(i) );

    uy = - 2.0  ...
          * x(i) ^ 2 * ( x(i) - 1.0 ) ^ 2  ...
          * ( 6.0 * y(i) ^ 2 - 3.0 * y(i) + 1.0 );

    uyy = - 2.0  ...
          * ( x(i) ^ 4 - 2.0 * x(i) ^ 3 + x(i) ^ 2 ) ...
          * ( 12.0 * y(i) - 6.0 );

    v =   2.0  ...
          * x(i) * ( x(i) - 1.0 ) * ( 2.0 * x(i) - 1.0 ) ...
          * y(i) ^ 2 * ( y(i) - 1.0 ) ^ 2;

    vx =   2.0  ...
          * ( 6.0 * x(i) ^ 2 - 6.0 * x(i) + 1.0 ) ...
          * y(i) ^ 2 * ( y(i) - 1.0 ) ^ 2;

    vxx =   2.0  ...
          * ( 12.0 * x(i) - 6.0 ) ...
          * y(i) ^ 2 * ( y(i) - 1.0 ) ^ 2;

    vy =   2.0  ...
          * x(i) * ( x(i) - 1.0 ) * ( 2.0 * x(i) - 1.0 ) ...
          * ( 4.0 * y(i) ^ 3 - 6.0 * y(i) ^ 2  ...
          + 2.0 * y(i) );

    vyy =   2.0  ...
          * x(i) * ( x(i) - 1.0 ) * ( 2.0 * x(i) - 1.0 ) ...
          * ( 12.0 * y(i) ^ 2 - 12.0 * y(i) + 2.0 );

    p = 0.0;
    px = 0.0;
    py = 0.0;

    ur(i) = px - ( uxx + uyy ) - f(i);
    vr(i) = py - ( vxx + vyy ) - g(i);
    pr(i) = ux + vy - h(i);

  end

  return
end
