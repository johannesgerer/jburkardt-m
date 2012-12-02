function s = hms_to_s ( h, n, second )

%*****************************************************************************80
%
%% HMS_TO_S "prints" an HMS date into a string.
%
%  Format:
%
%    HH:MM:SS
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer H, N, SECOND, the HMS date.
%
%    Output, string S, contains a representation of the date.
%
  s = sprintf ( '%02d:%02d:%02d\n', h, n, second );

  return
end
