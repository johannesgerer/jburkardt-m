function [ x, seed ] = hypersphere_01_surface_uniform ( m, n, seed )

%*****************************************************************************80
%
%% HYPERSPHERE_01_SURFACE_UNIFORM: uniform unit hypersphere surface samples.
%
%  Discussion:
%
%    The sphere has center 0 and radius 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    George Marsaglia,
%    Choosing a point from the surface of a sphere,
%    Annals of Mathematical Statistics,
%    Volume 43, Number 2, April 1972, pages 645-646.
%
%  Parameters:
%
%    Input, integer M, the dimension of the space.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(M,N), the points.
%
  [ x, seed ] = r8mat_normal_01 ( m, n, seed );
  v(1,1:n) = sqrt ( sum ( x.^2, 1 ) );
  vv = repmat ( v, m, 1 );
  x = x ./ vv;

  return
end
