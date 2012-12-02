function jed = ymdf_to_jed_gregorian ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_GREGORIAN converts a Gregorian YMDF date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 December 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Richards,
%    Algorithm E,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, pages 323-324.
%
%  Parameters:
%
%    Input, integer Y, integer M, integer D, real F, the YMDF date.
%
%    Output, real JED, the corresponding JED.
%

%
%  Check the date.
%
  [ y, m, d, ierror ] = ymd_check_gregorian ( y, m, d );

  if ( ierror ~= 0 )
    jed = -1.0;
    return
  end
%
%  Account for the missing year 0 by moving negative years up one.
%
  y2 = y_common_to_astronomical ( y );
%
%  Convert the calendar date to a computational date.
%
%  This frap-dapping formula fails for 1 March 1900!
%
  if ( m == 3 && d == 1 && ~year_is_leap_gregorian ( y2 ) )
    m = m - 1;
    d = 29;
  end

  y_prime = y2 + 4716 - floor ( ( 14 - m ) / 12 );
  m_prime = mod ( m + 9, 12 );
  d_prime = d - 1;
%
%  Convert the computational date to a JED.
%
  j1 = floor ( ( 1461 * y_prime ) / 4 );

  j2 = floor ( ( 153 * m_prime + 2 ) / 5 );

  g = floor ( 3 * floor ( ( y_prime + 184 ) / 100 ) / 4 ) - 38;

  jed = j1 + j2 + d_prime - 1401 - g - 0.5;
  jed = jed + f;

  return
end
