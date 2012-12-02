function [ y, m, d, f ] = jed_to_ymdf_zoroastrian ( jed )

%*****************************************************************************80
%
%% JED_TO_YMDF_ZOROASTRIAN converts a JED to a Zoroastrian YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2012
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
  jed_epoch = epoch_to_jed_zoroastrian ( );

  j = floor ( jed - jed_epoch );
  f = ( jed - jed_epoch ) - j;

  d = 1 + j;
  m = 1;
  y = 1;

  years = floor ( ( d - 1 ) / 365 );
  y = y + years;
  d = d - years * 365;

  months = floor ( ( d - 1 ) / 30 );
  m = m + months;
  d = d - months * 30;

  return
end
