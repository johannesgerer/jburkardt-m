function s = ymdf_to_s_julian ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_S_JULIAN writes a Julian YMDF date into a string.
%
%  Format:
%
%    AD YYYY/MM/DD.FF
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
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, string S, a representation of the date.
%
  if ( y < 0 )
    s = sprintf ( 'BC %d/%02d/%05.2f', -y, m, d + f );
  else
    s = sprintf ( 'AD %d/%02d/%05.2f', y, m, d + f );
  end

  return
end
