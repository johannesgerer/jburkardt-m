function h = circle_segment_height_from_angle ( r, theta )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_HEIGHT_FROM_ANGLE: height of a circle segment from angle.
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
%    This function is given the radius R and angle of the segment, and
%    determines the corresponding height.
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
%    Input, real THETA, the angle of the circle segment.
%    0 <= THETA <= 2.0 * PI.
%
%    Output, real H, the height of the circle segment.
%
  if ( theta < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CIRCLE_SEGMENT_HEIGHT_FROM_ANGLE - Fatal error!\n' );
    fprintf ( 1, '  THETA < 0.0.\n' );
    error ( 'CIRCLE_SEGMENT_HEIGHT_FROM_ANGLE - Fatal error!' );
  end

  if ( theta == 0.0 )
    h = 0.0;
    return
  end

  if ( theta == 2.0 * pi )
    h = 2.0 * r;
    return
  end

  if ( 2.0 * pi < theta )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CIRCLE_SEGMENT_HEIGHT_FROM_ANGLE - Fatal error!\n' );
    fprintf ( 1, '  2.0 * pi < THETA.\n' );
    error ( 'CIRCLE_SEGMENT_HEIGHT_FROM_ANGLE - Fatal error!' );
  end

  if ( r <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CIRCLE_SEGMENT_HEIGHT_FROM_ANGLE - Fatal error!\n' );
    fprintf ( 1, '  R <= 0.0.\n' );
    error ( 'CIRCLE_SEGMENT_HEIGHT_FROM_ANGLE - Fatal error!' );
  end

  if ( theta <= pi )
    h = r * ( 1.0 - cos (              theta   / 2.0 ) );
  else
    h = r * ( 1.0 + cos ( ( 2.0 * pi - theta ) / 2.0 ) );
  end

  return
end
