function jed = ymdf_to_jed_zoroastrian ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_ZOROASTRIAN converts a Zoroastrian YMDF date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2013
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
  jed_epoch = epoch_to_jed_zoroastrian ( );

  jed = jed_epoch + ( d - 1 ) + 30 * ( m - 1 ) + 365 * ( y - 1 ) + f;

  return
end
