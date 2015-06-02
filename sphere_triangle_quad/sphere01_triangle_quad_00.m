function [ result, seed ] = sphere01_triangle_quad_00 ( n, v1, v2, v3, f, ...
  seed )

%*****************************************************************************80
%
%% SPHERE01_TRIANGLE_QUAD_00: quadrature over a triangle on the unit sphere.
%
%  Discussion:
%
%    This is a Monte Carlo approach.
%
%    The integral is approximated by averaging the values at N random points,
%    multiplied by the area.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of sample points.
%
%    Input, real V1(3), V2(3), V3(3), the XYZ coordinates of
%    the vertices of the triangle.
%
%    Input, function v = f ( x ), evaluates the integrand at X.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real RESULT, the approximate integral.
%
  area = sphere01_triangle_vertices_to_area ( v1, v2, v3  );

  [ vc, seed ] = sphere01_triangle_sample ( n, v1, v2, v3, seed );

  quad = 0.0;
  for j = 1 : n
    quad = quad + f ( vc(1:3,j) );
  end

  result = quad * area / n;

  return
end
