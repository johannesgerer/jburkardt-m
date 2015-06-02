function s = ymd_to_s_julian ( y, m, d )

%*****************************************************************************80
%
%% YMD_TO_S_JULIAN writes a Julian YMD date into a string.
%
%  Format:
%
%    AD YYYY/MM/DD
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, the YMD date.
%
%    Output, string S, a representation of the date.
%
  if ( y < 0 )
    s = sprintf ( 'BC %d/%02d/%02d', -y, m, d );
  else
    s = sprintf ( 'AD %d/%02d/%02d', y, m, d );
  end

  return
end
