function w = circle_segment_width_from_height ( r, h )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_WIDTH_FROM_HEIGHT computes the width of a circle segment.
%
%  Discussion:
%
%    Begin with a circle of radius R.  Choose two points P1 and P2 on the
%    circle, and draw the chord P1:P2.  This chord divides the circle
%    into two pieces, each of which is called a circle segment.
%    Consider one of the pieces.  The "angle" of this segment is the angle 
%    P1:C:P2, where C is the center of the circle.  Let Q be the point on 
%    the chord P1:P2 which is closest to C.  The "height" of the segment
%    is the distance from Q to the perimeter of the circle.  The "width"
%    of the circle segment is the length of P1:P2.
%
%    This function is given the radius R and height H of the segment, and
%    determines the corresponding width W.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 May 2013
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
%    Input, real H, the height of the circle segment.
%    0 <= H <= 2 * R.
%
%    Output, real W, the width of the circle segment.
%
  w = 2.0 * sqrt ( h * ( 2.0 * r - h ) ); 

  return
end
