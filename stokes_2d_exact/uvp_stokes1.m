function [ u, v, p ] = uvp_stokes1 (  n, x, y )

%*****************************************************************************80
%
%% UVP_STOKES1 evaluates the exact Stokes solution #1.
%
%  Discussion:
%
%    The solution is defined over the unit square [0,1]x[0,1].
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
%    Output, real U(N), V(N), P(N), the velocity components and
%    pressure at each of the points.
%
  u = zeros ( n, 1 );
  v = zeros ( n, 1 );
  p = zeros ( n, 1 );

  for i = 1 : n

    u(i) = - 2.0 ...
          * x(i) ^ 2 * ( x(i) - 1.0 ) ^ 2 ...
          * y(i) * ( y(i) - 1.0 ) * ( 2.0 * y(i) - 1.0 );

    v(i) =   2.0 ...
          * x(i) * ( x(i) - 1.0 ) * ( 2.0 * x(i) - 1.0 ) ...
          * y(i) ^ 2 * ( y(i) - 1.0 ) ^ 2;

    p(i) = 0.0;

  end

  return
end
