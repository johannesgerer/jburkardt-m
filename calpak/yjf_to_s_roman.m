function s = yjf_to_s_roman ( y, j, f )

%*****************************************************************************80
%
%% YJF_TO_S_ROMAN writes a Roman YJF date into a string.
%
%  Format:
%
%    AUC YYYY/JJJ.FF
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2013
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
  s = sprintf ( 'AUC %d/%f', y, j + f );

  return
end
