function theta = circle_segment_angle_from_chord_angles ( omega1, omega2 )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_ANGLE_FROM_CHORD_ANGLES computes the angle of a circle segment.
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
%    17 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real OMEGA1, OMEGA2, the angles of the points P1 and P2.
%    OMEGA1 <= OMEGA2.
%
%    Output, real THETA, the angle of the circle segment.
%    Essentially, THETA = OMEGA2 - OMEGA1.
%
  while ( omega2 < omega1 )
    omega2 = omega2 + 2.0 * pi;
  end

  theta = omega2 - omega1;

  return
end
