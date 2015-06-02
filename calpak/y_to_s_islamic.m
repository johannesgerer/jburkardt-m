function s = y_to_s_islamic ( y )

%*****************************************************************************80
%
%% Y_TO_S_ISLAMIC writes an Islamic year into a string.
%
%  Format:
%
%    YearNumber AH
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
  s = sprintf ( 'AH %d', y );

  return
end
