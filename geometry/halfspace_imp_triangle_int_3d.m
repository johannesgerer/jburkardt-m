function [ num_int, pint ] = halfspace_imp_triangle_int_3d ( a, b, c, d, t )

%*****************************************************************************80
%
%% HALFSPACE_IMP_TRIANGLE_INT_3D: intersection ( implicit halfspace, triangle ) in 3D.
%
%  Discussion:
%
%    The implicit form of a half-space in 3D may be described as the set
%    of points (X,Y,Z) on or "above" an implicit plane:
%
%      0 <= A * X + B * Y + C * Z + D
%
%    The triangle is specified by listing its three vertices.
%
%    The intersection may be described by the number of vertices of the
%    triangle that are included in the halfspace, and by the location of
%    points between vertices that separate a side of the triangle into
%    an included part and an unincluded part.
%
%    0 vertices, 0 separators    (no intersection)
%    1 vertex, 0 separators      (point intersection)
%    2 vertices, 0 separators    (line intersection)
%    3 vertices, 0 separators    (triangle intersection)
%
%    1 vertex, 2 separators,     (intersection is a triangle)
%    2 vertices, 2 separators,   (intersection is a quadrilateral).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, D, the parameters that define the
%    implicit plane, which in turn define the implicit halfspace.
%
%    Input, real T(3,3), the vertices of the triangle.
%
%    Output, integer NUM_INT, the number of intersection points returned,
%    which will always be between 0 and 4.
%
%    Output, real PINT(3,4), the coordinates of the NUM_INT
%    intersection points.  The points will lie in sequence on the triangle.
%    Some points will be vertices, and some may be separators.
%

%
%  Compute the signed distances between the vertices and the plane.
%
  dist1 = a * t(1,1) + b * t(2,1) + c * t(3,1) + d;
  dist2 = a * t(1,2) + b * t(2,2) + c * t(3,2) + d;
  dist3 = a * t(1,3) + b * t(2,2) + c * t(3,3) + d;
%
%  Now we can find the intersections.
%
  [ num_int, pint ] = halfspace_triangle_int_3d ( t, dist1, dist2, dist3 );

  return
end
