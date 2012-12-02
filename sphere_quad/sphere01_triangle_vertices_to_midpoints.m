function [ m1, m2, m3 ] = sphere01_triangle_vertices_to_midpoints ( v1, v2, v3 )

%*****************************************************************************80
%
%% SPHERE01_TRIANGLE_VERTICES_TO_MIDPOINTS gets the midsides of a spherical triangle.
%
%  Discussion:
%
%    The points are assumed to lie on the unit sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real V1(3), V2(3), V3(3), the vertices of the triangle.
%
%    Output, real M1(3), M2(3), M3(3), the coordinates of
%    the midpoints of the sides of the spherical triangle.
%
  m1(1:3) = ( v1(1:3) + v2(1:3) ) / 2.0;
  m1(1:3) = m1(1:3) / norm ( m1 );

  m2(1:3) = ( v2(1:3) + v3(1:3) ) / 2.0;
  m2(1:3) = m2(1:3) / norm ( m2 );

  m3(1:3) = ( v3(1:3) + v1(1:3) ) / 2.0;
  m3(1:3) = m3(1:3) / norm ( m3 );

  return
end
