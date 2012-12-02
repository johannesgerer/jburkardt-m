function jed = mjd_to_jed ( mjd )

%*****************************************************************************80
%
%% MJD_TO_JED converts a modified JED to a JED.
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
%    Input, real MJD, the modified Julian Ephemeris Date.
%
%    Output, real JED, the Julian Ephemeris Date.
%
  jed_epoch = epoch_to_jed_mjd ( );
  jed = mjd + jed_epoch;

  return
end
