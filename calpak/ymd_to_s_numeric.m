function s = ymd_to_s_numeric ( y, m, d )

%*****************************************************************************80
%
%% YMD_TO_S_NUMERIC writes a YMD date into a string.
%
%  Format:
%
%       YYYY/MM/DD
%    or
%      -YYYY/MM/DD
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 2013
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
  s = sprintf ( '%d/%02d/%02d', y, m, d );

  return
end
