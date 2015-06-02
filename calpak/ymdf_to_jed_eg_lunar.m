function jed = ymdf_to_jed_eg_lunar ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_EG_LUNAR converts an Egyptian Lunar YMDF date to a JED.
%
%  Discussion:
%
%    Count
%      the days up to the day before the start of the calendar,
%      the days in the current month,
%      the 29 days guaranteed in the previous months of this year,
%      the (months/2) 30th days in the previous months of this year,
%      the 354 days guaranteed in each of the previous years,
%      the extra leap days in the preceding years,
%      the extra 30 days in the leap months in the preceding years.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, real JED, the corresponding Julian Ephemeris Date.
%
  jed_epoch = epoch_to_jed_eg_lunar ( );

  i1 = floor ( ( m - 1 ) / 2 );
  i2 = floor ( ( y - 1 ) / 5 );
  i3 = floor ( ( y - 1 ) / 25 );
  i4 = floor ( i3 * 9 + ( mod ( ( y - 1 ), 25 ) + 2 ) / 3 );

  jed = jed_epoch - 1 + d ...
    + 29 * ( m - 1 ) + i1 ...
    + 354 * ( y - 1 ) + i2 ...
    + 30 * i4 + f;

  return
end
