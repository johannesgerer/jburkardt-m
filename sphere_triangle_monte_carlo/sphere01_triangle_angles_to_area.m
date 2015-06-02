function area = sphere01_triangle_angles_to_area ( a, b, c )

%*****************************************************************************80
%
%% SPHERE01_TRIANGLE_ANGLES_TO_AREA computes the area of a spherical triangle.
%
%  Discussion:
%
%    A sphere centered at 0 in 3D satisfies the equation:
%
%      X*X + Y*Y + Z*Z = 1
%
%    A spherical triangle is specified by three points on the surface
%    of the sphere.
%
%    The area formula is known as Girard's formula.
%
%    The area of a spherical triangle on the unit sphere is:
%
%      AREA = ( A + B + C - PI )
%
%    where A, B and C are the (surface) angles of the triangle.
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
%    Input, real A, B, C, the angles of the triangle.
%
%    Output, real AREA, the area of the spherical triangle.
%

%
%  Apply Girard's formula.
%
  area = a + b + c - pi;

  return
end
