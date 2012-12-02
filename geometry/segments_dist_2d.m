function dist = segments_dist_2d ( p1, p2, q1, q2 )

%*****************************************************************************80
%
%% SEGMENTS_DIST_2D computes the distance between two line segments in 2D.
%
%  Discussion:
%
%    A line segment is the finite portion of a line that lies between
%    two points.
%
%    If the lines through [P1,P2] and [Q1,Q2] intersect, and both
%    line segments include the point of intersection, then the distance
%    is zero and we are done.
%
%    Therefore, we compute the intersection of the two lines, and
%    find the coordinates of that intersection point on each line.
%    This will tell us if the zero distance case has occurred.
%
%    Otherwise, let PN and QN be points in [P1,P2] and [Q1,Q2] for which
%    the distance is minimal.  If the lines do not intersect, then it
%    cannot be the case that both PN and QN are strictly interior to their
%    line segments, aside from the exceptional singular case when
%    the line segments overlap or are parallel.  Even then, one of PN
%    and QN may be taken to be a segment endpoint.
%
%    Therefore, our second computation finds the minimum of:
%
%      Distance ( P1, [Q1,Q2] );
%      Distance ( P2, [Q1,Q2] );
%      Distance ( Q1, [P1,P2] );
%      Distance ( Q2, [P1,P2] );
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
%    Input, real P1(2,1), P2(2,1), the endpoints of the first
%    segment.
%
%    Input, real Q1(2,1), Q2(2,1), the endpoints of the second
%    segment.
%
%    Output, real DIST, the distance between the line segments.
%

%
%  Determine whether and where the underlying lines intersect.
%
  [ ival, r ] = lines_exp_int_2d ( p1, p2, q1, q2 );
%
%  If there is exactly one intersection point part of both lines,
%  check that it is part of both line segments.
%
  if ( ival == 1 )

    [ rps, rpt ] = segment_point_coords_2d ( p1, p2, r );
    [ rq2, rqt ] = segment_point_coords_2d ( q1, q2, r );

    if ( 0.0 <= rpt & rpt <= 1.0 & 0.0 <= rqt & rqt <= 1.0 )
      dist = 0.0;
      return
    end

  end
%
%  If there is no intersection, or the intersection point is
%  not part of both line segments, then an endpoint of one
%  line segment achieves the minimum distance.
%
  dist2 = segment_point_dist_2d ( q1, q2, p1 );
  dist = dist2;
  dist2 = segment_point_dist_2d ( q1, q2, p2 );
  dist = min ( dist, dist2 );
  dist2 = segment_point_dist_2d ( p1, p2, q1 );
  dist = min ( dist, dist2 );
  dist2 = segment_point_dist_2d ( p1, p2, q2 );
  dist = min ( dist, dist2 );

  return
end
