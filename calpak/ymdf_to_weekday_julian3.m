function w = ymdf_to_weekday_julian3 ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_WEEKDAY_JULIAN3 returns the week day of a Julian YMD date.
%
%  Discussion:
%
%    The algorithm is also valid for BC years.
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
%    Algorithm C,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, page 309.
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, integer W, the day of the week of the date.
%    The days are numbered from Sunday through Saturday, 1 through 7.
%
  if ( y < 0 )
    y2 = 1 - y;
  else
    y2 = y;
  end

  m_prime = mod ( 9 + m, 12 );
  y_prime = y2 - floor ( m_prime / 10 );

  while ( y_prime < 0 )
    y_prime = y_prime + 28;
  end

  w = 1 + mod ( d + floor ( ( 13 * m_prime + 2 ) / 5 ) + y_prime ...
    + floor ( y_prime / 4 ), 7 );

  return
end