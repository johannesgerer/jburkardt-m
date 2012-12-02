function jed = ymdf_to_jed_julian ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_JULIAN converts a Julian YMDF date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 December 2008
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
%    Output, real JED, the Julian Ephemeris Date.
%

%
%  Check the date.
%
  [ y, m, d, f, ierror ] = ymdf_check_julian ( y, m, d, f );

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
  y_prime = y2 + 4716 - floor ( ( 14 - m ) / 12 );
  m_prime = mod ( m + 9, 12 );
  d_prime = d - 1;
%
%  Convert the computational date to a JED.
%
  j1 = floor ( ( 1461 * y_prime ) / 4 );

  j2 = floor ( ( 153 * m_prime + 2 ) / 5 );

  jed = j1 + j2 + d_prime - 1401 - 0.5;
  jed = jed + f;

  return
end
