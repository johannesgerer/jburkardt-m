function s = y_to_s_republican ( y, s )

%*****************************************************************************80
%
%% Y_TO_S_REPUBLICAN writes a Republican year into a string.
%
%  Format:
%
%    YearNumber ER
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year.
%
%    Output, string S, a representation of the year.
%
  s = sprintf ( '%d ER', y );

  return
end
