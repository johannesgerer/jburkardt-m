function [ x, y, ierror ] = parabola_ex ( x1, y1, x2, y2, x3, y3 )

%*****************************************************************************80
%
%% PARABOLA_EX finds the extremal point of a parabola determined by three points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X1, Y1, X2, Y2, X3, Y3, the coordinates of 
%    three points on the parabola.  X1, X2 and X3 must be distinct.
%
%    Output, real X, Y, the X coordinate of the extremal point
%    of the parabola, and the value of the parabola at that point.
%
%    Output, integer IERROR, error flag.
%    0, no error.
%    1, two of the X values are equal.
%    2, the data lies on a straight line; there is no finite extremal point.
%
  ierror = 0;

  if ( x1 == x2 | x2 == x3 | x3 == x1 )
    ierror = 1;
    return
  end

  if ( y1 == y2 & y2 == y3 & y3 == y1 )
    x = x1;
    y = y1;
    return
  end

  bot = ( x2 - x3 ) * y1 - ( x1 - x3 ) * y2 + ( x1 - x2 ) * y3;

  if ( bot == 0.0 )
    ierror = 2;
    return
  end

  x = 0.5 * (    x1 * x1 * ( y3 - y2 ) ...
               + x2 * x2 * ( y1 - y3 ) ...
               + x3 * x3 * ( y2 - y1 ) ) / bot;

  y = (     ( x - x2 ) * ( x - x3 ) * ( x2 - x3 ) * y1 ...
          - ( x - x1 ) * ( x - x3 ) * ( x1 - x3 ) * y2 ...
          + ( x - x1 ) * ( x - x2 ) * ( x1 - x2 ) * y3 ) / ...
          ( ( x1 - x2 ) * ( x2 - x3 ) * ( x1 - x3 ) );

  return
end
