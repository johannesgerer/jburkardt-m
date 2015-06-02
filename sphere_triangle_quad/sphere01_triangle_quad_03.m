function result = sphere01_triangle_quad_03 ( v1, v2, v3, f )

%*****************************************************************************80
%
%% SPHERE01_TRIANGLE_QUAD_03: quadrature over a triangle on the unit sphere.
%
%  Discussion:
%
%    The integral is approximated by the average of the midside values,
%    multiplied by the area.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real V1(3), V2(3), V3(3), the XYZ coordinates of
%    the vertices of the triangle.
%
%    Input, function v = F ( x ), evaluates the integrand at X.
%
%    Output, real RESULT, the approximate integral.
%
  area = sphere01_triangle_vertices_to_area ( v1, v2, v3 );

  [ v4, v5, v6 ] = sphere01_triangle_vertices_to_midpoints ( v1, v2, v3 );

  quad = ( f ( v4 ) + f ( v5 ) + f ( v6 ) ) / 3.0;

  result = quad * area;

  return
end