function mjd = jed_to_mjd ( jed )

%*****************************************************************************80
%
%% JED_TO_MJD converts a JED to a modified JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, real MJD, the modified Julian Ephemeris Date.
%
  jed_epoch = epoch_to_jed_mjd ( );

  mjd = jed - jed_epoch;

  return
end
