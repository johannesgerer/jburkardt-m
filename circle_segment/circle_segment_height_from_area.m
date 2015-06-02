function h = circle_segment_height_from_area ( r, area )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_HEIGHT_FROM_AREA: height of a circle segment from area.
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
%    This function is given the radius R and area of the segment, and
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
%    Input, real AREA, the area of the circle segment.
%    0 <= AREA <= 2.0 * PI * R^2.
%
%    Output, real H, the height of the circle segment.
%
  if ( area < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CIRCLE_SEGMENT_HEIGHT_FROM_AREA - Fatal error!\n' );
    fprintf ( 1, '  AREA < 0.0.\n' );
    error ( 'CIRCLE_SEGMENT_HEIGHT_FROM_AREA - Fatal error!' );
  end

  area_circle = 2.0 * pi * r^2;

  if ( area == 0.0 )
    h = 0.0;
    return
  end

  if ( area == area_circle )
    h = 2.0 * r;
    return
  end

  if ( area_circle < area )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CIRCLE_SEGMENT_HEIGHT_FROM_AREA - Fatal error!\n' );
    fprintf ( 1, '  2.0 * pi * r^2 < AREA.\n' );
    error ( 'CIRCLE_SEGMENT_HEIGHT_FROM_AREA - Fatal error!' );
  end

  if ( r <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CIRCLE_SEGMENT_HEIGHT_FROM_AREA - Fatal error!\n' );
    fprintf ( 1, '  R <= 0.0.\n' );
    error ( 'CIRCLE_SEGMENT_HEIGHT_FROM_AREA - Fatal error!' );
  end

  h1 = 0.0;
  a1 = circle_segment_area_from_height ( r, h1 );
  h2 = 2.0 * r;
  a2 = circle_segment_area_from_height ( r, h2 );

  it = 0;

  while ( it < 30 )

    h = 0.5 * ( h1 + h2 );
    a = circle_segment_area_from_height ( r, h );
    it = it + 1;

    if ( abs ( a - area ) < sqrt ( eps ) * area )
      break
    end

    if ( a < area )
      h1 = h;
      a1 = a;
    else
      h2 = h;
      a2 = a;
    end

  end

  return
end
