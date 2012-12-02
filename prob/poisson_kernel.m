function p = poisson_kernel ( r, n, c, x, y )

%*****************************************************************************80
%
%% POISSON_KERNEL evaluates the Poisson kernel.
%
%  Discussion:
%
%    P(X,Y) = ( R^2 - |X-C|^2 ) / ( R * A * |X-Y|^N )
%
%    where the N-dimensional ball has radius R and center C,
%    and A is the area of the unit sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the ball.
%
%    Input, integer N, the spatial dimension.
%
%    Input, real C(N), the center of the ball.
%
%    Input, real X(N), a point inside the ball.
%
%    Input, real Y(N), a point on the surface of the ball.
%
%    Output, real P, the Poisson kernel function P(X,Y).
%
  xc_diff_norm = r8vec_diff_norm ( n, x, c );
  xy_diff_norm = r8vec_diff_norm ( n, x, y );
  area = sphere_unit_area_nd ( n );

  t = ( r + xc_diff_norm ) * ( r - xc_diff_norm );
  b = r * area * ( xy_diff_norm ) ^ n;
  p = t / b;

  return
end
