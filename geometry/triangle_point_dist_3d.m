function dist = triangle_point_dist_3d ( t, p )

%*****************************************************************************80
%
%% TRIANGLE_POINT_DIST_3D: distance ( triangle, point ) in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(3,3), the triangle vertices.
%
%    Input, real P(3,1), the point which is to be checked.
%
%    Output, real DIST, the distance from the point to the
%    triangle.  DIST is zero if the point lies exactly on the triangle.
%

%
%  Compute the distances from the point to each of the sides.
%
  dist2 = segment_point_dist_3d ( t(1:3,1), t(1:3,2), p );

  dist = dist2;

  dist2 = segment_point_dist_3d ( t(1:3,2), t(1:3,3), p );

  dist = min ( dist, dist2 );

  dist2 = segment_point_dist_3d ( t(1:3,3), t(1:3,1), p );

  dist = min ( dist, dist2 );

  return
end
