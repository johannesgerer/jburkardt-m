function angle = i4_to_angle ( i )

%*****************************************************************************80
%
%% I4_TO_ANGLE maps integers to points on a circle.
%
%  Discussion:
%
%    The angles are intended to be used to select colors on a color
%    hexagon whose 6 vertices are red, yellow, green, cyan, blue,
%    magenta.
%
%  Example:
%
%     I   X      ANGLE
%
%     0   0/3      0
%     1   1/3    120
%     2   2/3    240
%
%     3   1/6     60
%     4   3/6    180
%     5   5/6    300
%
%     6   1/12    30
%     7   3/12    90
%     8   5/12   150
%     9   7/12   210
%    10   9/12   270
%    11  11/12   330
%
%    12   1/24    15
%    13   3/24    45
%    14   5/24    75
%    etc
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the index of the desired color.
%
%    Output, real ANGLE, an angle, measured in degrees, 
%    between 0 and 360.
%
  if ( 0 <= abs ( i ) & abs ( i ) <= 2 )

    angle = 120.0 * abs ( i );

  else

    i1 = i4_log_2 ( floor ( abs ( i ) / 3 ) );
    i2 = abs ( i ) + 1 - 3 * 2^i1;
    i3 = 2 * ( i2 - 1 ) + 1;
    i4 = 3 * 2^( i1 + 1 );

    angle = 360.0 * i3 / i4;

  end

  return
end
