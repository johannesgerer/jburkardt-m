function julian = jed_to_yearcount_julian ( jed )

%*****************************************************************************80
%
%% JED_TO_YEARCOUNT_JULIAN converts a JED to a Julian year count.
%
%  Discussion:
%
%    An average year in the Julian calendar is exactly 365.25 days long.
%    This calculation counts the number of average Julian years from
%    the beginning of the year 2000.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, real JULIAN, the Julian year.
%
  year_length = 365.25;

  jed_epoch = epoch_to_jed_y2k ( );

  julian = 2000.0 + ( jed - jed_epoch ) / year_length;

  return
end
