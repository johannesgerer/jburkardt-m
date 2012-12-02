function [ num_int, pint ] = halfspace_normal_triangle_int_3d ( p, normal, t )

%*****************************************************************************80
%
%% HALFSPACE_NORMAL_TRIANGLE_INT_3D: intersection ( normal halfspace, triangle ) in 3D.
%
%  Discussion:
%
%    The normal form of a halfspace in 3D may be described as the set
%    of points (X,Y,Z) on or "above" a plane described in normal form:
%
%      P is a point on the plane,
%      NORMAL is the unit normal vector, pointing "out" of the
%      halfspace.
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
%    Input, real T(3,3), the vertices of the triangle.
%
%    Input, real P(3,1), a point on the bounding plane
%    that defines the halfspace.
%
%    Input, real NORMAL(3,1), the components of the normal vector
%    to the bounding plane that defines the halfspace.  By convention, the
%    normal vector points "outwards" from the halfspace.
%
%    Output, integer NUM_INT, the number of intersection points returned,
%    which will always be between 0 and 4.
%
%    Output, real PINT(3,4), the coordinates of the NUM_INT
%    intersection points.  The points will lie in sequence on the triangle.
%    Some points will be vertices, and some may be separators.
%
  dim_num = 3;
%
%  Compute the signed distances between the vertices and the plane.
%
  d = - normal(1:dim_num,1)' * p(1:dim_num,1);
%
%  Compute the signed distances between the vertices and the plane.
%
  dist1 = d + normal(1:dim_num,1)' * t(1:dim_num,1);
  dist2 = d + normal(1:dim_num,1)' * t(1:dim_num,2);
  dist3 = d + normal(1:dim_num,1)' * t(1:dim_num,3);
%
%  Now we can find the intersections.
%
  [ num_int, pint ] = halfspace_triangle_int_3d ( t, dist1, dist2, dist3 );

  return
end
