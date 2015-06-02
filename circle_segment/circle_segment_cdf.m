function cdf = circle_segment_cdf ( r, h, h2 )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_CDF computes a CDF related to a circle segment.
%
%  Discussion:
%
%    Begin with a circle of radius R.  Choose two points P1 and P2 on the
%    circle, and draw the chord P1:P2.  This chord divides the circle
%    into two pieces, each of which is called a circle segment.
%    Consider one of the pieces.  The "angle" of this segment is the angle 
%    P1:C:P2, where C is the center of the circle.  Let Q be the point on 
%    the chord P1:P2 which is closest to C.  The "height" of the segment
%    is the distance from Q to the perimeter of the circle.
%
%    Now, suppose we want to assign a cumulative density function or CDF
%    based on a variable H2 which measures the height of the circle segment
%    formed by an arbitrary point in the circle segment.  CDF(H2) will
%    measure the probability that a point drawn uniformly at random from
%    the circle segment defines a (smaller) circle segment of height H2.
%
%    If we can define this CDF, then we will be able to sample uniformly
%    from the circle segment, since our "Y" value can be determined from H2,
%    and our X value is chosen uniformly over the horizontal chord 
%    through (0,Y).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the circle.
%    0 < R.
%
%    Input, real H, the "height" of the circle segment.
%    0 <= H <= 2 * R.
%
%    Input, real H2, the "height" of the new circle segment defined by
%    a given point in the circle segment.  0 <= H2 <= H.
%
%    Output, real CDF, the cumulative density function for H2, the probability
%    that a point chosen at random in the circle segment would define a
%    smaller circle segment of height H2 or less.
%
  if ( h2 <= 0.0 )
    cdf = 0.0;
  elseif ( h <= h2 )
    cdf = 1.0;
  else
    a  = circle_segment_area_from_height ( r, h  );
    a2 = circle_segment_area_from_height ( r, h2 );
    cdf = a2 / a;
  end

  return
end

