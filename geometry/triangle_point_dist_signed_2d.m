function dist_signed = triangle_point_dist_signed_2d ( t, p )

%*****************************************************************************80
%
%% TRIANGLE_POINT_DIST_SIGNED_2D: signed distance ( triangle, point ) in 2D.
%
%  Discussion:
%
%    If the signed distance is:
%    0, the point is on the boundary of the triangle;
%    negative, the point is in the triangle;
%    positive, the point is outside the triangle.
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
%    Input, real T(2,3), the triangle vertices.
%    These should be given in counter clockwise order.
%
%    Input, real P(2,1), the point which is to be checked.
%
%    Output, real DIST_SIGNED, the signed distance from the
%    point to the triangle.
%
  dim_num = 2;
%
%  Compute the signed line distances to the point.
%
  dis12 = line_exp_point_dist_signed_2d ( t(1:2,1), t(1:2,2), p );

  dis23 = line_exp_point_dist_signed_2d ( t(1:2,2), t(1:2,3), p );

  dis31 = line_exp_point_dist_signed_2d ( t(1:2,3), t(1:2,1), p );
%
%  If the point is inside the triangle, all the line distances are negative.
%  The largest (negative) line distance has the smallest magnitude,
%  and is the signed triangle distance.
%
  if ( dis12 <= 0.0 & dis23 <= 0.0 & dis31 <= 0.0 )

    dist_signed = max ( dis12, max ( dis23, dis31 ) );
%
%  If the point is outside the triangle, then we have to compute
%  the (positive) line segment distances and take the minimum.
%
  else

    dis12 = segment_point_dist_2d ( t(1:2,1), t(1:2,2), p );
    dis23 = segment_point_dist_2d ( t(1:2,2), t(1:2,3), p );
    dis31 = segment_point_dist_2d ( t(1:2,3), t(1:2,1), p );

    dist_signed = min ( dis12, min ( dis23, dis31 ) );

  end

  return
end
