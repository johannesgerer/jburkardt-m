function e = year_to_epact_julian ( y )

%*****************************************************************************80
%
%% YEAR_TO_EPACT_JULIAN returns the epact of a Julian year.
%
%  Discussion:
%
%    The epact of a year is the age in days of the notional moon on
%    the first day of the year.  If the year begins with a new moon,
%    the epact is zero.  If the new moon occurred the day before,
%    the epact is 1.  There is a unique epact for every golden number.
%
%    Bear in mind that the notional moon is not the one in the sky,
%    but a theoretical one that satisfactorily approximates the behavior
%    of the real one, but which is tame enough to be described by a formula.
%
%  Example:
%
%    Year  Golden Number  Epact
%
%      1 BC     1           8
%      1 AD     2          19
%      2 AD     3           0
%      3 AD     4          11
%      4 AD     5          22
%      5 AD     6           3
%      6 AD     7          14
%      7 AD     8          25
%      8 AD     9           6
%      9 AD    10          17
%     10 AD    11          28
%     11 AD    12           9
%     12 AD    13          20
%     13 AD    14           1
%     14 AD    15          12
%     15 AD    16          23
%     16 AD    17           4
%     17 AD    18          15
%     18 AD    19          26
%     19 AD     1           8
%     20 AD     2          19
%   1066 AD     3           0
%   1900 AD     1           8
%   1919 AD     1           8
%   1938 AD     1           8
%   1957 AD     1           8
%   1976 AD     1           8
%   1995 AD     1           8
%   2014 AD     1           8
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 June 2012
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
    fprintf ( 1, 'YEAR_TO_EPACT_JULIAN - Fatal error!\n' );
    fprintf ( 1, '  Illegal input Y = 0.\n' );
    error ( 'YEAR_TO_EPACT_JULIAN - Fatal error!' );
  end

  g = year_to_golden_number ( y );

  e = i4_wrap ( 11 * g - 3, 0, 29 );

  return
end
