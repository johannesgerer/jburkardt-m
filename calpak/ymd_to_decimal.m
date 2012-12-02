function yf = ymd_to_decimal ( y, m, d )

%*****************************************************************************80
%
%% YMD_TO_DECIMAL converts a Y/M/D date to a Decimal Y.F date.
%
%  Discussion:
%
%    The day is assumed to be at noon.  In other words, 1983 January 1st has
%    a decimal value of 1983 + 0.5 / 365.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, the YMD date.
%
%    Output, real YMD, the Decimal date.
%

%
%  How many days between January 1st and day D?
%
  day_min = 1;
  days = ymd_dif_common ( y, m, day_min, y, m, d );
%
%  How many days in this year total?
%
  day_max = year_length_common ( y );
%
%  The decimal part of the year is ( D + 0.5 ) / DMAX.
%
  f = ( days + 0.5 ) / day_max;

  yf = y + f;

  return
end
