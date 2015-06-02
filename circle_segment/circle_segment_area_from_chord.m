function area = circle_segment_area_from_chord ( r, c, p1, p2 )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_AREA_FROM_CHORD computes the area of a circle segment.
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
%    18 May 2013
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
%    Input, real C(2,1), the center of the circle.
%
%    Input, real P1(2,1), P2(2,1), the ends of the chord.
%
%    Output, real AREA, the area of the circle segment.
%
  theta = circle_segment_angle_from_chord ( r, c, p1, p2 );

  area = r * r * ( theta - sin ( theta ) ) / 2.0;

  return
end
