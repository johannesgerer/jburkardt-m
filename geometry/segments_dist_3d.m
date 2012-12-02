function dist = segments_dist_3d ( p1, p2, q1, q2 )

%*****************************************************************************80
%
%% SEGMENTS_DIST_3D computes the distance between two line segments in 3D.
%
%  Discussion:
%
%
%    NOTE: The special cases for identical and parallel lines have not been
%    worked out yet; those cases are exceptional, and so this code
%    is made available in a slightly unfinished form!
%
%
%    A line segment is the finite portion of a line that lies between
%    two points P1 and P2.
%
%    Given two line segments, consider the underlying lines on which
%    they lie.
%
%    A) If the lines are identical, then the distance between the line segments
%    is 0, if the segments overlap, or otherwise is attained by the
%    minimum of the distances between each endpoint and the opposing
%    line segment.
%
%    B) If the lines are parallel, then the distance is either the distance
%    between the lines, if the projection of one line segment onto
%    the other overlaps, or otherwise is attained by the
%    minimum of the distances between each endpoint and the opposing
%    line segment.
%
%    C) If the lines are not identical, and not parallel, then there are
%    unique points PN and QN which are the closest pair of points on the lines.
%    If PN is interior to [P1,P2] and QN is interior to [Q1,Q2],
%    then the distance between the two line segments is the distance
%    between PN and QN.  Otherwise, the nearest distance can be computed
%    by taking the minimum of the distance from each endpoing to the
%    opposing line segment.
%
%    Therefore, our computation first checks whether the lines are
%    identical, parallel, or other, and checks for the special case
%    where the minimum occurs in the interior.
%
%    If that case is ruled out, it computes and returns the minimum of:
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
%    Input, real P1(3,1), P2(3,1), the endpoints of the first
%    segment.
%
%    Input, real Q1(3,1), Q2(3,1), the endpoints of the second
%    segment.
%
%    Output, real DIST, the distance between the line segments.
%

%
%  The lines are identical.
%  THIS CASE NOT SET UP YET
%
% if ( lines_exp_equal_3d ( p1, p2, q1, q2 ) ) then
% end if
%
%  The lines are not identical, but parallel
%  THIS CASE NOT SET UP YET.
%
% if ( lines_exp_parallel_3d ( p1, p2, q1, q2 ) ) then
% end if
%
%  C: The lines are not identical, not parallel.
%

%
%  Let U = (P2-P1) and V = (Q2-Q1) be the direction vectors on
%  the two lines.
%
  u(1:3,1) = p2(1:3,1) - p1(1:3,1);
  v(1:3,1) = q2(1:3,1) - q1(1:3,1);
%
%  Let SN be the unknown coordinate of the nearest point PN on line 1,
%  so that PN = P(SN) = P1 + SN * (P2-P1).
%
%  Let TN be the unknown coordinate of the nearest point QN on line 2,
%  so that QN = Q(TN) = Q1 + TN * (Q2-Q1).
%
%  Let W0 = (P1-Q1).
%
  w0(1:3,1) = p1(1:3,1) - q1(1:3,1);
%
%  The vector direction WC = P(SN) - Q(TC) is unique (among directions)
%  perpendicular to both U and V, so
%
%    U dot WC = 0
%    V dot WC = 0
%
%  or, equivalently:
%
%    U dot ( P1 + SN * (P2 - P1) - Q1 - TN * (Q2 - Q1) ) = 0
%    V dot ( P1 + SN * (P2 - P1) - Q1 - TN * (Q2 - Q1) ) = 0
%
%  or, equivalently:
%
%    (u dot u ) * sn - (u dot v ) tc = -u * w0
%    (v dot u ) * sn - (v dot v ) tc = -v * w0
%
%  or, equivalently:
%
%   ( a  -b ) * ( sn ) = ( -d )
%   ( b  -c )   ( tc )   ( -e )
%
  a = u' * u;
  b = u' * v;
  c = v' * v;
  d = u' * w0;
  e = v' * w0;
%
%  Check the determinant.
%
  det = - a * c + b * b;

  if ( det == 0.0 )
    sn = 0.0;
    if ( abs ( b ) < abs ( c ) )
      tn = e / c;
    else
      tn = d / b;
    end
  else
    sn = ( c * d - b * e ) / det;
    tn = ( b * d - a * e ) / det;
  end
%
%  Now if both nearest points on the lines
%  also happen to lie inside their line segments,
%  then we have found the nearest points on the line segments.
%
  if ( 0.0 <= sn & sn <= 1.0 & 0.0 <= tn & tn <= 1.0 )
    pn(1:3,1) = p1(1:3,1) + sn * ( p2(1:3,1) - p1(1:3,1) );
    qn(1:3,1) = q1(1:3,1) + tn * ( q2(1:3,1) - q1(1:3,1) );
    dist = sqrt ( sum ( ( pn(1:3,1) - qn(1:3,1) ).^2 ) );
    return
  end
%
%  The nearest point did not occur in the interior.
%  Therefore it must be achieved at an endpoint.
%
  dist2 = segment_point_dist_3d ( q1, q2, p1 );
  dist = dist2;
  dist2 = segment_point_dist_3d ( q1, q2, p2 );
  dist = min ( dist, dist2 );
  dist2 = segment_point_dist_3d ( p1, p2, q1 );
  dist = min ( dist, dist2 );
  dist2 = segment_point_dist_3d ( p1, p2, q2 );
  dist = min ( dist, dist2 );

  return
end
