function jed = ymdf_to_jed_islamic_a2 ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_ISLAMIC_A2 converts an Islamic A YMDF date to a JED.
%
%  Discussion:
%
%    The algorithm has the beauty of being comprehensible%
%
%    Count the days up to the day before the start of the calendar,
%    plus the days in the current month, the 29 days guaranteed
%    in the previous months of this year, the (months/2) 30th days,
%    the 354 days in each of the previous years, plus the total number
%    of leap days in the preceding years.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Reingold, Nachum Dershowitz,
%    Calendrical Calculations I,
%    Software - Practice and Experience,
%    Volume 20, Number 9, September 1990, pages 899-928.
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, real JED, the corresponding Julian Ephemeris Date.
%

%
%  Check the date.
%
  [ y, m, d, ierror ] = ymd_check_islamic ( y, m, d );

  if ( ierror ~= 0 )
    jed = -1.0;
    return
  end

  jed_epoch = epoch_to_jed_islamic_a ( );

  jed = jed_epoch - 1 + d + 29 * ( m - 1 ) + floor ( m / 2 ) ...
    + 354 * ( y - 1 ) + floor ( ( 11 * y + 3 ) / 30 ) + f;

  return
end
