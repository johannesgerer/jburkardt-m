function bessel = jed_to_yearcount_bessel ( jed )

%*****************************************************************************80
%
%% JED_TO_YEARCOUNT_BESSEL converts a JED to Bessel year count.
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
%    Output, real BESSEL, the Bessel year.
%
  year_length = 365.242198781;

  jed_epoch = epoch_to_jed_bessel ( );
  bessel = 1900.0 + ( jed - jed_epoch ) / year_length;

  return
end
