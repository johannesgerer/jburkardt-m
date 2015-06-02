function [ y, m, d, f ] = jed_to_ymdf_jelali ( jed )

%*****************************************************************************80
%
%% JED_TO_YMDF_JELALI converts a JED to a Jelali YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer Y, M, D, real F,
%    the YMDF date.
%
  jed_epoch = epoch_to_jed_jelali ( );

  j = floor ( jed - jed_epoch );
  f = ( jed - jed_epoch ) - j;

  d = 1 + j;
  m = 1;
  y = 1;
%
%  Account for the number of completed 4 year cycles of 1461 days.
%
  n = floor ( ( d - 1 ) / 1461 );
  y = y + 4 * n;
  d = d - n * 1461;
%
%  Account for the number of completed 365 day years.
%
  n = floor ( ( d - 1 ) / 365 );
  y = y + n;
  d = d - n * 365;
%
%  Account for the number of completed 30 day months.
%
  n = floor ( ( d - 1 ) / 30 );
  m = m + n;
  d = d - n * 30;

  return
end
