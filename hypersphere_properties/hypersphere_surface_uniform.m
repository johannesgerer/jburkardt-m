function [ x, seed ] = hypersphere_uniform_sample ( m, n, r, c, seed )

%*****************************************************************************80
%
%% HYPERSPHERE_SURFACE_UNIFORM samples hypersphere surface.
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
%    Russell Cheng,
%    Random Variate Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley, 1998, pages 168.
%
%    George Marsaglia,
%    Choosing a point from the surface of a sphere,
%    Annals of Mathematical Statistics,
%    Volume 43, Number 2, April 1972, pages 645-646.
%
%    Reuven Rubinstein,
%    Monte Carlo Optimization, Simulation, and Sensitivity
%    of Queueing Networks,
%    Wiley, 1986, page 234.
%
%  Parameters:
%
%    Input, integer M, the dimension of the space.
%
%    Input, integer N, the number of points.
%
%    Input, real R, the radius of the sphere.
%
%    Input, real C(M,1), the center of the sphere.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(M,N), the points.
%
  [ x, seed ] = r8mat_normal_01 ( m, n, seed );

  v(1,1:n) = sqrt ( sum ( x.^2, 1 ) );
  vv = repmat ( v, m, 1 );
  x = x ./ vv;
%
%  Scale by the sphere radius.
%
  x = r * x;
%
%  Shift to the sphere center.
%
  x = x + repmat ( c, 1, n );

  return
end
