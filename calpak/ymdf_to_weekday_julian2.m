function w = ymdf_to_weekday_julian2 ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_WEEKDAY_JULIAN2 returns the weekday of a Julian YMDF date.
%
%  Discussion:
%
%    This routine computes the day of the week from the date in
%    the Julian calendar, that is, the calendar in force before the
%    Gregorian calendar, in which every fourth year was a leap year.
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
%  Reference:
%
%    Edward Richards,
%    Algorithm A,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, pages 307-308.
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, integer W, the day of the week of the date.
%    The days are numbered from Sunday through Saturday, 1 through 7.
%
  m_prime = mod ( 9 + m, 12 );
  q = floor ( m_prime / 10 );
  z = floor ( ( 13 * m_prime + 2 ) / 5 );
  t = 28 * m_prime + z + d - 365 * q + 59;

  c = i4_wrap ( t, 1, 7 );

  y_prime = y - q;
  v = floor ( y / 4 ) - floor ( y_prime / 4 );
  p = y + floor ( y / 4 ) + 4 - v;
  n = 7 - mod ( p, 7 );

  w = i4_wrap ( c + 1 - n, 1, 7 );

  return
end