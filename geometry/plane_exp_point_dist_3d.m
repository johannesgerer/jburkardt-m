function dist = plane_exp_point_dist_3d ( p1, p2, p3, p )

%*****************************************************************************80
%
%% PLANE_EXP_POINT_DIST_3D: distance ( explicit plane, point ) in 3D.
%
%  Discussion:
%
%    The explicit form of a plane in 3D is
%
%      the plane through P1, P2 and P3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3), P2(3), P3(3), three points on the plane.
%
%    Input, real P(3), the coordinates of the point.
%
%    Output, real DIST, the distance from the point to the plane.
%
  [ a, b, c, d ] = plane_exp2imp_3d ( p1, p2, p3 );

  dist = plane_imp_point_dist_3d ( a, b, c, d, p );

  return
end
