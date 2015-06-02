function i = year_to_indiction_common ( y )

%*****************************************************************************80
%
%% YEAR_TO_INDICTION_COMMON returns the indiction number of a Common year.
%
%  Discussion:
%
%    The Roman empire had a taxation cycle that, at one time, comprised
%    15 years.  As is typical in calendrical matters, the actual length
%    of this cycle and the time that the cycle began varied from place
%    to place and time to time, and historians even disagree about the
%    indiction cycle given a specific place and time.  Nonetheless,
%    it is customary to retrospectively impose a uniform and regular
%    indiction cycle on the ancient world.  (The 15 year indiction cycle,
%    in fact, was factored into Scaliger's determination of an appropriate
%    starting point for the Julian Ephemeris Date.)
%
%  Example:
%
%    Year  Indiction Number
%
%      3 BC     1
%      2 BC     2
%      1 BC     3
%      1 AD     4
%     10 AD    13
%     11 AD    14
%     12 AD    15
%     13 AD     1
%     14 AD     2
%     15 AD     3
%     26 AD    14
%     27 AD    15
%     28 AD     1
%   1900 AD    13
%   2000 AD     8
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
%  Parameters:
%
%    Input, integer Y, the year.
%
%    Output, integer I, the indiction number, between 1 and 15.
%
  if ( y == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YEAR_TO_INDICTION_COMMON - Fatal error!\n' );
    fprintf ( 1, '  Illegal input Y = 0.\n' );
    error ( 'YEAR_TO_INDICTION_COMMON - Fatal error!' );
  end
%
%  We assume that BC years come in as negative numbers, and that
%  the year before 1 AD is 1 BC.  So add 1 to any negative value
%  so that the arithmetic works.
%
  y2 = y_common_to_astronomical ( y );

  i = i4_wrap ( y2 + 3, 1, 15 );

  return
end
