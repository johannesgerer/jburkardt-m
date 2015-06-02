function [ f, g, h ] = rhs_stokes2 ( n, x, y )

%*****************************************************************************80
%
%% RHS_STOKES2 returns the right hand sides of the exact Stokes solution #2.
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
%    Output, real F(N), G(N), H(N), the right hand sides in the U,
%    V and P equations.
%
  f = zeros ( n, 1 );
  g = zeros ( n, 1 );
  h = zeros ( n, 1 );

  for i = 1 : n

    u =   2.0 ...
          * sin ( 2.0 * pi * x(i) ) ...
          * cos ( 2.0 * pi * y(i) );

    ux =   4.0 * pi ...
          * cos ( 2.0 * pi * x(i) ) ...
          * cos ( 2.0 * pi * y(i) );

    uxx = - 8.0 * pi ^ 2 ...
          * sin ( 2.0 * pi * x(i) ) ...
          * cos ( 2.0 * pi * y(i) );

    uy = - 4.0 * pi ...
          * sin ( 2.0 * pi * x(i) ) ...
          * sin ( 2.0 * pi * y(i) );

    uyy = - 8.0 * pi ^ 2 ...
          * sin ( 2.0 * pi * x(i) ) ...
          * cos ( 2.0 * pi * y(i) );

    v = - 2.0 ...
          * cos ( 2.0 * pi * x(i) ) ...
          * sin ( 2.0 * pi * y(i) );

    vx =   4.0 * pi ...
          * sin ( 2.0 * pi * x(i) ) ...
          * sin ( 2.0 * pi * y(i) );

    vxx =   8.0 * pi ^ 2 ...
          * cos ( 2.0 * pi * x(i) ) ...
          * sin ( 2.0 * pi * y(i) );

    vy = - 4.0 * pi ...
          * cos ( 2.0 * pi * x(i) ) ...
          * cos ( 2.0 * pi * y(i) );

    vyy =   8.0 * pi ^ 2 ...
          * cos ( 2.0 * pi * x(i) ) ...
          * sin ( 2.0 * pi * y(i) );

    p = x(i) ^ 2 + y(i) ^ 2;

    px = 2.0 * x(i);
    py = 2.0 * y(i);

    f(i) = px - ( uxx + uyy );
    g(i) = py - ( vxx + vyy );
    h(i) = ux + vy;

  end

  return
end
