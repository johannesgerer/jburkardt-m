function w = ymdf_to_weekday_gregorian2 ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_WEEKDAY_GREGORIAN2 returns the weekday of a Gregorian YMDF date.
%
%  Discussion:
%
%    This routine computes the day of the week from the date in
%    the Gregorian calendar.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Richards,
%    Algorithm B,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, page 308.
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, integer W, the day of the week of the date.
%    The days are numbered from Sunday through Saturday, 1 through 7.
%

%
%  Check the input.
%
  [ y, m, d, ierror ] = ymd_check_gregorian ( y, m, d );

  if ( ierror ~= 0 )
    w = 0;
    return
  end

  m_prime = mod ( 9 + m, 12 );
  q = floor ( m_prime / 10 );
  z = floor ( ( 13 * m_prime + 2 ) / 5 );
  t = 28 * m_prime + z + d - 365 * q + 59;

  c = i4_wrap ( t, 1, 7 );

  y_prime = y - q;
  v = ( floor ( y / 4 ) - floor ( y_prime / 4 ) ) ...
    - ( floor ( y / 100 ) - floor ( y_prime / 100 ) ) ...
    + ( floor ( y / 400 ) - floor ( y_prime / 400 ) );
  p = y + floor ( y / 4 ) - floor ( y / 100 ) + floor ( y / 400 ) - 1 - v;
  n = 7 - i4_modp ( p, 7 );
  w = 1 + i4_modp ( 7 + c - n, 7 );

  return
end
