function s = y_to_s_ethiopian ( y )

%*****************************************************************************80
%
%% Y_TO_S_ETHIOPIAN writes an Ethiopian year into a string.
%
%  Format:
%
%    Ethiopian YearNumber
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
  s = sprintf ( 'Ethiopian %d', y );

  return
end