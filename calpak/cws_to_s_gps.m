function s = cws_to_s_gps ( c, w, sec )

%*****************************************************************************80
%
%% CWS_TO_S_GPS writes a GPS CWS date into a string.
%
%  Format:
%
%    CC/WWWW/SSSSSS.SS GPS
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer C,  integer W, real SEC, the GPS cycle/week/second date.
%
%    Output, string S, a representation of the date.
%
  s = sprintf ( '%02d/%04d/%09.2f GPS', c, w, sec );

  return
end
