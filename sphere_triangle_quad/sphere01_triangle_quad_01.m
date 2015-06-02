function result = sphere01_triangle_quad_01 ( v1, v2, v3, f )

%*****************************************************************************80
%
%% SPHERE01_TRIANGLE_QUAD_01: quadrature over a triangle on the unit sphere.
%
%  Discussion:
%
%    The integral is approximated by the value at the centroid,
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

  vc = sphere01_triangle_vertices_to_centroid ( v1, v2, v3 );

  quad = f ( vc );
  result = quad * area;

  return
end