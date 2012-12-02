function p = hexagon_shape_2d ( angle )

%*****************************************************************************80
%
%% HEXAGON_SHAPE_2D returns points on the unit regular hexagon in 2D.
%
%  Diagram:
%
%      120_____60
%        /     \
%    180/       \0
%       \       /
%        \_____/
%      240     300
%
%  Discussion:
%
%    The unit regular hexagon has radius 1.  The radius is the distance from
%    the center to any vertex, and it is also the length of any side.
%    An example of a unit hexagon is the convex hull of the points:
%
%      (   1,              0 ),
%      (   0.5,   sqrt (3)/2 ),
%      ( - 0.5,   sqrt (3)/2 ),
%      ( - 1,              0 ),
%      ( - 0.5, - sqrt (3)/2 ),
%      (   0.5, - sqrt (3)/2 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ANGLE, the angle, in degrees, of the point.
%
%    Output, real P(2,1), the coordinates of the point.
%

%
%  Ensure that 0 <= ANGLE < 360.
%
  angle2 = r8_modp ( angle, 360.0 );
%
%  y = - sqrt(3) * x + sqrt(3)
%
  if ( 0.0 <= angle2 & angle2 <= 60.0 )

    p(1,1) = sqrt ( 3.0 ) / ( tan_deg ( angle2 ) + sqrt ( 3.0 ) );
    p(2,1) = tan_deg ( angle2 ) * p(1,1);
%
%  y = sqrt(3) / 2
%
  elseif ( angle2 <= 120.0 )

    p(2,1) = sqrt ( 3.0 ) / 2.0;
    p(1,1) = cot_deg ( angle2 ) * p(2,1);
%
%  y = sqrt(3) * x + sqrt(3)
%
  elseif ( angle2 <= 180.0 )

    p(1,1) = sqrt ( 3.0 ) / ( tan_deg ( angle2 ) - sqrt ( 3.0 ) );
    p(2,1) = tan_deg ( angle2 ) * p(1,1);
%
%  y = - sqrt(3) * x - sqrt(3)
%
  elseif ( angle2 <= 240.0 )

    p(1,1) = - sqrt ( 3.0 ) / ( tan_deg ( angle2 ) + sqrt ( 3.0 ) );
    p(2,1) = tan_deg ( angle2 ) * p(1,1);
%
%  y = - sqrt(3) / 2
%
  elseif ( angle2 <= 300.0 )

    p(2,1) = - sqrt ( 3.0 ) / 2.0;
    p(1,1) = cot_deg ( angle2 ) * p(2,1);
%
%  y = sqrt(3) * x - sqrt(3)
%
  elseif ( angle2 <= 360.0 )

    p(1,1) = - sqrt ( 3.0 ) / ( tan_deg ( angle2 ) - sqrt ( 3.0 ) );
    p(2,1) = tan_deg ( angle2 ) * p(1,1);

  end

  return
end
