function yf = ym_to_decimal ( y, m )

%*****************************************************************************80
%
%% YM_TO_DECIMAL converts a Y/M date to a Decimal Y.F date.
%
%  Discussion:
%
%    Each month is take to be 1/12 of a year long, and the decimal value
%    is returned for the middle of the month.
%
%    1980 January  => 1980.04
%    1980 February => 1980.12
%    1980 March    => 1980.21
%    1980 December => 1980.96
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, the YM date.
%
%    Output, real YF, the Decimal date.
%
  yf = y + ( 2 * m - 1 ) / 24.0;

  return
end
