function s = y_to_s_bahai ( y )

%*****************************************************************************80
%
%% Y_TO_S_BAHAI writes a Bahai year into a string.
%
%  Format:
%
%    Bahai YearNumber
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2012
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
  s = sprintf ( 'Bahai %d', y );

  return
end
