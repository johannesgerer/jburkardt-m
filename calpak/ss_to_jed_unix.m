function jed = ss_to_jed_unix ( s )

%*****************************************************************************80
%
%% SS_TO_JED_UNIX converts a UNIX SS date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 June 2001
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real S, the UNIX date.
%
%    Output, real JED, the corresponding Julian Ephemeris Date.
%
  jed_epoch = epoch_to_jed_unix ( );

  d = s / ( 24.0 * 60.0 * 60.0 );

  jed = jed_epoch + d;

  return
end

