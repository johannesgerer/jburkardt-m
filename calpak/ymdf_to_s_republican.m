function s = ymdf_to_s_republican ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_S_REPUBLICAN writes a Republican YMDF date into a string.
%
%  Format:
%
%    ER YYYY/MM/DD.FF
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2013
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
  s = sprintf ( 'ER %d/%02d/%05.2f', y, m, d + f );

  return
end
