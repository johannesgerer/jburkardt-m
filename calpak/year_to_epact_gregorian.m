function e = year_to_epact_gregorian ( y )

%*****************************************************************************80
%
%% YEAR_TO_EPACT_GREGORIAN returns the epact of a Gregorian year.
%
%  Discussion:
%
%    The epact of a year is the age in days of the notional moon on
%    the first day of the year.  If the year begins with a new moon,
%    the epact is zero.  If the new moon occurred the day before,
%    the epact is 1.  There is a unique epact for every golden number.
%
%    The Gregorian epact calculation is an adjustment to the Julian
%    calculation that takes into account the shift of the calendar
%    to restore the vernal equinox to March 21, and the adjustment to
%    the average length of the year.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Richards,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999.
%
%  Parameters:
%
%    Input, integer Y, the year.  The year 0 is illegal input.
%
%    Output, integer E, the epact, between 0 and 28.
%
  if ( y == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YEAR_TO_EPACT_GREGORIAN - Fatal error!\n' );
    fprintf ( 1, '  Illegal input Y = 0.\n' );
    error ( 'YEAR_TO_EPACT_GREGORIAN - Fatal error!' );
  end

  y2 = y_common_to_astronomical ( y );

  g = year_to_golden_number ( y );

  h = floor ( y2 / 100 );

  q = h - floor ( h / 4 );

  e = mod ( 57 + 11 * g - q + floor ( ( h - floor ( ( h - 17 ) / 25 ) ) / 3 ), 30 );

  if ( e == 24 || ( e == 25 && 12 <= g ) )
    e = e + 1;
  end

  return
end
