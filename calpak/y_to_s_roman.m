function s = y_to_s_roman ( y )

%*****************************************************************************80
%
%% Y_TO_S_ROMAN writes a Roman year into a string.
%
%  Format:
%
%    YearNumber AUC
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
%    Input, integer Y, the year.
%
%    Output, string S, a representation of the year.
%
  s = sprintf ( '%d AUC', y );

  return
end
