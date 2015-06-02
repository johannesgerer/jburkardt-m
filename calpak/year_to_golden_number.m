function g = year_to_golden_number ( y )

%*****************************************************************************80
%
%% YEAR_TO_GOLDEN_NUMBER returns the golden number of a Common year.
%
%  Discussion:
%
%    Nineteen solar years are very close to 235 lunations.  Calendars
%    that try to keep track of both the sun and moon often make use of
%    this fact, ascribed to the Greek astronomer Meton.
%
%    While trying to determine a formula for Easter, Dionysus Exiguus
%    symbolized the place of each year in its Metonic cycle by a
%    "golden number" between 1 and 19.  The numbering began with the
%    year 1 BC, assigned the golden number of 1.  The following year,
%    1 AD, got the golden number of 2, and after that it gets easier.
%
%    The same golden year calculation is done for years in the Julian
%    or Gregorian calendar.
%
%  Example:
%
%    Year  Golden Number
%
%      1 BC     1
%      1 AD     2
%      2 AD     3
%     18 AD    19
%     19 AD     1
%     20 AD     2
%   1066 AD     3
%   1900 AD     1
%   1919 AD     1
%   1938 AD     1
%   1957 AD     1
%   1976 AD     1
%   1995 AD     1
%   2014 AD     1
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
%  Parameters:
%
%    Input, integer Y, the year.
%
%    Output, integer G, the golden number, between 1 and 19.  This
%    records the position of the year in the 19 year Metonic cycle.
%
  if ( y == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YEAR_TO_GOLDEN_NUMBER - Fatal error!\n' );
    fprintf ( 1, '  Illegal input Y = 0.\n' );
    error ( 'YEAR_TO_GOLDEN_NUMBER - Fatal error!' );
  end
%
%  We assume that BC years come in as negative numbers, and that
%  the year before 1 AD is 1 BC.  So add 1 to any negative value
%  so that the arithmetic works.
%
  y2 = y_common_to_astronomical ( y );

  g = i4_wrap ( y2 + 1, 1, 19 );

  return
end