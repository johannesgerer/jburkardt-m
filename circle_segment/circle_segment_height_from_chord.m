function h = circle_segment_height_from_chord ( r, c, p1, p2 )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_HEIGHT_FROM_CHORD: height of a circle segment from chord.
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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 May 2013
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
%    Input, real C(2,1), the coordinates of the circle center.
%
%    Input, real P1(2,1), P2(2,1), the coordinates of the chord endpoints.
%
%    Output, real H, the height of the circle segment.
%
  theta = circle_segment_angle_from_chord ( r, c, p1, p2 );

  h = circle_segment_height_from_angle ( r, theta );

  return
end
