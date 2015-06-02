function s = yjf_to_s_julian ( y, j, f )

%*****************************************************************************80
%
%% YJF_TO_S_JULIAN writes a Julian YJF date into a string.
%
%  Format:
%
%    AD YYYY/JJJ.FF
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, J, real F, the YJF date.
%
%    Output, string S, the representation of the date.
%
  if ( y < 0 )
    s = sprintf ( 'BC %d/%06.2f', -y, j + f );
  else
    s = sprintf ( 'AD %d/%06.2f', y, j + f );
  end

  return
end