function s = yjf_to_s_republican ( y, j, f )

%*****************************************************************************80
%
%% YJF_TO_S_REPUBLICAN writes a Republican YJF date into a string.
%
%  Format:
%
%    ER YYYY/JJJ.FF
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
  s = sprintf ( 'ER %d/%f', y, j + f );

  return
end