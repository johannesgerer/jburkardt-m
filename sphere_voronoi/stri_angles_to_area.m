function area = stri_angles_to_area ( r, a, b, c )

%*****************************************************************************80
%
%% STRI_ANGLES_TO_AREA computes the area of a spherical triangle.
%
%  Discussion:
%
%    A sphere centered at 0 in 3D satisfies the equation:
%
%      X*X + Y*Y + Z*Z = R*R
%
%    A spherical triangle is specified by three points on the surface
%    of the sphere.
%
%    The area formula is known as Girard's formula.
%
%    The area of a spherical triangle is:
%
%      AREA = ( A + B + C - PI ) * R*R
%
%    where A, B and C are the (surface) angles of the triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the sphere.
%
%    Input, real A, B, C, the angles of the triangle.
%
%    Output, real AREA, the area of the spherical triangle.
%

%
%  Apply Girard's formula.
%
  area = r * r * ( a + b + c - pi );

  return
end
