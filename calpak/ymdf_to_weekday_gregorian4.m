function w = ymdf_to_weekday_gregorian4 ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_WEEKDAY_GREGORIAN4 returns the weekday of a Gregorian YMDF date.
%
%  Discussion:
%
%    This routine uses "Zeller's congruence"
%
%    W = 1 + ( [ 2.6*M-0.2 ] + K + Y + [ Y/4 ] + [ C/4 ] - 2 * C ) mod 7
%
%    where
%
%    M = month, but counting so that March = 1, April = 2, ..., Feb = 12.
%    K = the day of the month;
%    Y = the century year (that is, the last two digits of the year);
%    C = the century (the year divided by 100)
%    W = the day of the week, with Sunday = 1,
%    [X] = integer part of X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, integer W, is the week day number of the date, with
%    1 for Sunday, through 7 for Saturday.
%
  [ y, m, d, ierror ] = ymd_check_gregorian ( y, m, d );

  if ( ierror ~= 0 )
    w = 0;
    return
  end

  if ( m <= 2 )
    a = m + 10;
  else
    a = m - 2;
  end
%
%  What do you want to happen when Y is negative?
%
  c = i4_modp ( y, 100 );
  e = floor ( ( y - c ) / 100 );

  v = floor ( ( 13 * a - 1 ) / 5 );
  x = floor ( c / 4 );
  u = floor ( e / 4 );
  z = v + x + u + d + c - 2 * e;

  w = i4_modp ( z, 7 ) + 1;

  return
end