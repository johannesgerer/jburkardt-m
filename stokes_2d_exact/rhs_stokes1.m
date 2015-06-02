function [ f, g, h ] = rhs_stokes1 ( n, x, y )

%*****************************************************************************80
%
%% RHS_STOKES1 returns the right hand sides of the exact Stokes solution #1.
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

    f(i) = + 2.0 ...
          * ( 12.0 * x(i) ^ 2 - 12.0 * x(i) + 2.0 ) ...
          * ( 2.0 * y(i) ^ 3 - 3.0 * y(i) ^ 2 + y(i) ) ...
          + 2.0 ...
          * ( x(i) ^ 4 - 2.0 * x(i) ^ 3 + x(i) ^ 2 ) ...
          * ( 12.0 * y(i) - 6.0 );

    g(i) = - 2.0 ...
          * ( 12.0 * x(i) - 6.0 ) ...
          * ( y(i) ^ 4 - 2.0 * y(i) ^ 3 + y(i) ^ 2 ) ...
          - 2.0 ...
          * ( 2.0 * x(i) ^ 3 - 3.0 * x(i) ^ 2 + x(i) ) ...
          * ( 12.0 * y(i) ^ 2 - 12.0 * y(i) + 2.0 );

    h(i) = 0.0;

  end

  return
end
