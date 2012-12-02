function [ result, seed ] = sphere01_quad_mc ( f, h, seed, n )

%*****************************************************************************80
%
%% SPHERE01_QUAD_MC uses the Monte Carlo rule for sphere quadrature.
%
%  Discussion:
%
%    A number of points N are chosen at random on the sphere, with N
%    being determined so that, if the points were laid out on a regular
%    grid, the average spacing would be no more than H.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, function v = F ( n, x ), evaluates the integrand.
%
%    Input, real H, the maximum length of a side of the spherical
%    quadrilaterals.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Input, integer N, the number of points to use.
%
%    Output, real RESULT, the approximate integral.
%
  sphere_area = 4.0 * pi;

  [ x, seed ] = sphere01_sample_3d ( n, seed );

  v = f ( n, x )

  result = sphere_area * sum ( v(1:n) ) / n;

  return
end
