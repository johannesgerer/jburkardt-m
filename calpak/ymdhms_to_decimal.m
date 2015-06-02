function yf = ymdhms_to_decimal ( y, m, d, h, n, s )

%*****************************************************************************80
%
%% YMDHMS_TO_DECIMAL converts a Y/M/D/H/Mn/S date to a Decimal Y.F date.
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
%    Input, integer Y, M, D, H, N, S, the YMDHMS date.
%
%    Output, real YF, the Decimal date.
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
%  The decimal part of the year is ( D + H/24 + N/24*60 + S/24*60*60 ) / DMAX.
%
  f =       s      / 60.0;
  f = ( f + n    ) / 60.0;
  f = ( f + h    ) / 24.0;
  f = ( f + days ) / day_max;

  yf = y + f;

  return
end
