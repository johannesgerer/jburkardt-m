function [ flag, r ] = segments_int_2d ( p1, p2, q1, q2 )

%*****************************************************************************80
%
%% SEGMENTS_INT_2D computes the intersection of two line segments in 2D.
%
%  Discussion:
%
%    A line segment is the finite portion of a line that lies between
%    two points.
%
%    In 2D, two line segments might not intersect, even though the
%    lines, of which they are portions, intersect.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2), P2(2), the endpoints of the first
%    segment.
%
%    Input, real Q1(2), Q2(2), the endpoints of the second
%    segment.
%
%    Output, integer FLAG, records the results.
%    0, the line segments do not intersect.
%    1, the line segments intersect.
%
%    Output, real R(2), an intersection point, if there is one.
%
  dim_num = 2;
  tol = 0.001;
%
%  Find the intersection of the two lines of which
%  [P1,P2] and [Q1,Q2] are segments.
%
  [ ival, r ] = lines_exp_int_2d ( p1, p2, q1, q2 );

  if ( ival == 0 )
    flag = 0;
    return
  end
%
%  Is the point on the first segment?
%
  [ u, v ] = segment_contains_point_2d ( p1, p2, r );

  if ( u < 0.0 | 1.0 < u | tol < v )
    flag = 0;
    return
  end
%
%  Is the point on the second segment?
%
  [ u, v ] = segment_contains_point_2d ( q1, q2, r );

  if ( u < 0.0 | 1.0 < u | tol < v )
    flag = 0;
    return
  end

  flag = 1;

  return
end
