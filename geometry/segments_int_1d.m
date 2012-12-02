function [ dist, r1, r2 ] = segments_int_1d ( p1, p2, q1, q2 )

%*****************************************************************************80
%
%% SEGMENTS_INT_1D computes the intersection of two line segments in 1D.
%
%  Discussion:
%
%    A line segment is the finite portion of a line that lies between
%    two points.
%
%    In 1D, two line segments "intersect" if they overlap.
%
%    Using a real number DIST to report overlap is preferable to 
%    returning a TRUE/FALSE flag, since DIST is better able to 
%    handle cases where the segments "almost" interlap.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 July 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1, P2, the endpoints of the first segment.
%
%    Input, real Q1, Q2, the endpoints of the second segment.
%
%    Output, real DIST, the "distance" between the segments.
%    < 0, the segments overlap, and the overlap is DIST units long;
%    = 0, the segments overlap at a single point;
%    > 0, the segments do not overlap.  The distance between the nearest
%    points is DIST units.
%
%    Output, real R1, R2, the endpoints of the intersection
%    segment.  
%    If DIST < 0, then the interval [R1,R2] is the common intersection
%    of the two segments.
%    If DIST = 0, then R1 = R2 is the single common point of the two segments.
%    If DIST > 0, then (R1,R2) is an open interval separating the two
%    segments, which do not overlap at all.
%
  r1 = max ( min ( p1, p2 ), min ( q1, q2 ) );

  r2 = min ( max ( p1, p2 ), max ( q1, q2 ) );

  dist = r1 - r2;

  return
end
