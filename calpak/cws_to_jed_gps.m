function jed = cws_to_jed_gps ( c, w, s )

%*****************************************************************************80
%
%% CWS_TO_JED_GPS converts a GPS CWS date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer C, integer W, real S, 
%    the GPS cycle/week/second date.
%
%    Output, real JED, the corresponding Julian Ephemeris Date.
%
  jed_epoch = epoch_to_jed_gps ( );

  d = ( 7 * ( 1024 * c + w ) ) + s / ( 24.0 * 60.0 * 60.0 );

  jed = jed_epoch + d;

  return
end
