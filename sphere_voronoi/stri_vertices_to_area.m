function area = stri_vertices_to_area ( r, v1, v2, v3 )

%*****************************************************************************80
%
%% STRI_VERTICES_TO_AREA computes the area of a spherical triangle.
%
%  Discussion:
%
%    A sphere centered at 0 in 3D satisfies the equation:
%
%      X * X + Y * Y + Z * Z = R * R
%
%    A spherical triangle is specified by three points on the surface
%    of the sphere.
%
%    The area formula is known as Girard's formula.
%
%    The area of a spherical triangle is:
%
%      AREA = ( A + B + C - PI ) * R * R
%
%    where A, B and C are the (surface) angles of the triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the sphere.
%
%    Input, real V1(3), V2(3), V3(3), the vertices of the triangle.
%
%    Output, real AREA, the area of the spherical triangle.
%

%
%  Compute the lengths of the sides of the spherical triangle.
%
  [ as, bs, cs ] = stri_vertices_to_sides ( r, v1, v2, v3 );
%
%  Get the spherical angles.
%
  [ a, b, c ] = stri_sides_to_angles ( r, as, bs, cs );
%
%  Get the area.
%
  area = stri_angles_to_area ( r, a, b, c );

  return
end
