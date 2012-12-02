function [ r, g, b ] = angle_to_rgb ( angle )

%*****************************************************************************80
%
%% ANGLE_TO_RGB returns a color on the perimeter of the color hexagon.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ANGLE, the angle in the color hexagon.  The sextants are
%    defined by the following points:
%        0 degrees, 1, 0, 0, red;
%       60 degrees, 1, 1, 0, yellow;
%      120 degrees, 0, 1, 0, green;
%      180 degrees, 0, 1, 1, cyan;
%      240 degrees, 0, 0, 1, blue;
%      300 degrees, 1, 0, 1, magenta.
%
%    Output, real R, G, B, RGB specifications for the color that lies
%    at the given angle, on the perimeter of the color hexagon.  One
%    value will be 1, and one value will be 0.
%
  degrees_to_radians = pi / 180.0;

  angle = mod ( angle, 360.0 );

  if ( angle < 0.0 )
    angle = angle + 360.0;
  end

  if ( angle <= 60.0 )

    angle2 = degrees_to_radians * 3.0 * angle / 4.0;
    r = 1.0;
    g = tan ( angle2 );
    b = 0.0;

  elseif ( angle <= 120.0 )

    angle2 = degrees_to_radians * 3.0 * angle / 4.0;
    r = cos ( angle2 ) / sin ( angle2 );
    g = 1.0;
    b = 0.0;

  elseif ( angle <= 180.0 )

    angle2 = degrees_to_radians * 3.0 * ( angle - 120.0 ) / 4.0;
    r = 0.0;
    g = 1.0;
    b = tan ( angle2 );

  elseif ( angle <= 240.0 )

    angle2 = degrees_to_radians * 3.0 * ( angle - 120.0 ) / 4.0;
    r = 0.0;
    g = cos ( angle2 ) / sin ( angle2 );
    b = 1.0;

  elseif ( angle <= 300.0 )

    angle2 = degrees_to_radians * 3.0 * ( angle - 240.0 ) / 4.0;
    r = tan ( angle2 );
    g = 0.0;
    b = 1.0;

  elseif ( angle <= 360.0 )

    angle2 = degrees_to_radians * 3.0 * ( angle - 240.0 ) / 4.0;
    r = 1.0;
    g = 0.0;
    b = cos ( angle2 ) / sin ( angle2 );

  end

  return
end
