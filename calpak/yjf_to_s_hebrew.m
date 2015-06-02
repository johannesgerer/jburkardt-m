function s = yjf_to_s_hebrew ( y, j, f )

%*****************************************************************************80
%
%% YJF_TO_S_HEBREW writes a Hebrew YJF date into a string.
%
%  Format:
%
%    AM YYYY/JJJ.FF
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2013
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
  s = sprintf ( 'AM %d/%f', y, j + f );

  return
end
