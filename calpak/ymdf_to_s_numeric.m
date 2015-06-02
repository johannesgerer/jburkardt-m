function s = ymdf_to_s_numeric ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_S_NUMERIC writes a YMDF date into a string.
%
%  Format:
%
%       YYYY/MM/DD.FF
%    or
%      -YYYY/MM/DD.FF
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMD date.
%
%    Output, string S, a representation of the date.
%
  s = sprintf ( '%d/%02d/%05.2f', y, m, d + f );

  return
end
