function [ w, f ] = jed_to_weekday ( jed )

%*****************************************************************************80
%
%% JED_TO_WEEKDAY computes the day of the week from a JED.
%
%  Discussion:
%
%    BC 4713/01/01 => JED = 0.0 was noon on a Monday.
%
%    jedmod = mod ( 0.0D+00, 7.0D+00 ) = 0.0D+00
%    j = mod ( nint ( 0 ), 7 ) = 0
%    f = ( 0.0D+00 + 0.5D+00 ) - real ( j ) = 0.5D+00
%    w = i4_wrap ( 0 + 2, 1, 7 ) = 2 = MONDAY
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 April 2010
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
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer W, the day of the week of the date.
%    The days are numbered from Sunday through Saturday, 1 through 7.
%
%    Output, real F, the fractional part of the day.
%
  jedmod = mod ( jed, 7.0 );

  j = mod ( floor ( jedmod ), 7 );

  f = ( jedmod + 0.5 ) - j;

  w = i4_wrap ( j + 2, 1, 7 );

  return
end
