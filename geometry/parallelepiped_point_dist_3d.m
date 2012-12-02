function dist = parallelepiped_point_dist_3d ( p1, p2, p3, p4, p )

%*****************************************************************************80
%
%% PARALLELEPIPED_POINT_DIST_3D: distance ( parallelepiped, point ) in 3D.
%
%  Discussion:
%
%    A parallelepiped is a "slanted box", that is, opposite
%    sides are parallel planes.
%
%  Diagram:
%
%               *------------------*
%              / .                / \
%             /   .              /   \
%            /     .            /     \
%          P4------------------*       \
%            \        .         \       \
%             \        .         \       \
%              \        .         \       \
%               \       P2.........\.......\
%                \     .            \     /
%                 \   .              \   /
%                  \ .                \ /
%                  P1-----------------P3
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
%    Input, real P1(3,1), P2(3,1), P3(3,1), P4(3,1),
%    half of the corners of the box, from which the other corners can be
%    deduced.  The corners should be chosen so that the first corner
%    is directly connected to the other three.  The locations of
%    corners 5, 6, 7 and 8 will be computed by the parallelogram
%    relation.
%
%    Input, real P(3,1), the point which is to be checked.
%
%    Output, real DIST, the distance from the point to the box.
%    DIST is zero if the point lies exactly on the box.
%

%
%  Fill in the other corners
%
  p5(1:3,1) = p2(1:3,1) + p3(1:3,1) - p1(1:3,1);
  p6(1:3,1) = p2(1:3,1) + p4(1:3,1) - p1(1:3,1);
  p7(1:3,1) = p3(1:3,1) + p4(1:3,1) - p1(1:3,1);
  p8(1:3,1) = p2(1:3,1) + p3(1:3,1) + p4(1:3,1) - 2.0 * p1(1:3,1);
%
%  Compute the distance from the point P to each of the six
%  parallelogram faces.
%
  dis = parallelogram_point_dist_3d ( p1, p2, p3, p );

  dist = dis;

  dis = parallelogram_point_dist_3d ( p1, p2, p4, p );

  dist = min ( dist, dis );

  dis = parallelogram_point_dist_3d ( p1, p3, p4, p );

  dist = min ( dist, dis );

  dis = parallelogram_point_dist_3d ( p8, p5, p6, p );

  dist = min ( dist, dis );

  dis = parallelogram_point_dist_3d ( p8, p5, p7, p );

  dist = min ( dist, dis );

  dis = parallelogram_point_dist_3d ( p8, p6, p7, p );

  dist = min ( dist, dis );

  return
end
