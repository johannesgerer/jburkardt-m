function [ a, b, c ] = sphere_triangle_vertices_to_angles ( r, v1, v2, v3 )

%*****************************************************************************80
%
%% SPHERE_TRIANGLE_VERTICES_TO_ANGLES computes the angles of a spherical triangle.
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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2010
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
%    Output, real A, B, C, the angles of the spherical triangle.
%

%
%  Compute the lengths of the sides of the spherical triangle.
%
  [ as, bs, cs ] = sphere_triangle_vertices_to_sides ( r, v1, v2, v3 );
%
%  Get the spherical angles.
%
  [ a, b, c ] = sphere_triangle_sides_to_angles ( r, as, bs, cs );

  return
end
