function d = circle_segment_centroid_from_height ( r, h )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_CENTROID_FROM_HEIGHT computes the centroid of a circle segment.
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
%    For this function, we assume that the center of the circle is at (0,0),
%    that the chord is horizontal, and that the circle segment is at the top.
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
%    Output, real D(2), the coordinates of the centroid.
%
  theta = circle_segment_angle_from_height ( r, h );

  d(1) = 0.0;
  d(2) = 4.0 * r * ( sin ( theta / 2.0 ) ) ^ 3 / 3.0 / ( theta - sin ( theta ) );

  return
end
