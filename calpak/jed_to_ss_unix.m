function s = jed_to_ss_unix ( jed )

%*****************************************************************************80
%
%% JED_TO_SS_UNIX converts a JED to a UNIX SS date.
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
%    Output, real S, the corresponding UNIX SS date.
%
  jed_epoch = epoch_to_jed_unix ( );

  d = jed - jed_epoch;

  s = d * 24.0 * 60.0 * 60.0;

  return
end
