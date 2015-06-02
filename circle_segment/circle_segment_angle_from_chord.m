function theta = circle_segment_angle_from_chord ( r, c, p1, p2 )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_ANGLE_FROM_CHORD computes the angle of a circle segment.
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
%    Output, real THETA, the angle of the circle segment.
%    0 <= THETA < 2 * PI.
%

%
%  Destroy all row vectors!
%
  c = c(:);
  p1 = p1(:);
  p2 = p2(:);
%
%  Compute the radial vectors V1 and V2.
%
  v1(1:2,1) = p1(1:2,1) - c(1:2,1);
  v2(1:2,1) = p2(1:2,1) - c(1:2,1);
%
%  The arc cosine will only give us an answer between 0 and PI.
%
  theta = atan2 ( v2(2), v2(1) ) - atan2 ( v1(2), v1(1) );
%
%  Force 0 <= THETA < 2 * PI.
%
  while ( theta < 0.0 )
    theta = theta + 2.0 * pi;
  end

  while ( 2.0 * pi <= theta )
    theta = theta - 2.0 * pi;
  end

  return
end
