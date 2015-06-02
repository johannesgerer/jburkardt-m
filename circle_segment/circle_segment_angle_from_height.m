function theta = circle_segment_angle_from_height ( r, h )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_ANGLE_FROM_HEIGHT computes the angle of a circle segment.
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
%    Input, real H, the "height" of the circle segment.
%    0 <= H <= 2 * R.
%
%    Output, real THETA, the angle of the circle segment.
%
  if ( h <= 0.0 )

    theta = 0.0;

  elseif ( h <= r )

%   theta = 2.0 * r8_acos ( ( r - h ) / r );
    theta = 2.0 * r8_asin ( sqrt ( r * r - ( r - h ) * ( r - h ) ) / r );

  elseif ( h <= 2.0 * r )

%   theta = 2.0 * r8_acos ( ( r - h ) / r );
    theta = 2.0 * r8_asin ( sqrt ( r * r - ( r - h ) * ( r - h ) ) / r );
    theta = 2.0 * pi - theta;

  else

    theta = 2.0 * pi;

  end

  return
end
