function s = y_to_s_coptic ( y )

%*****************************************************************************80
%
%% Y_TO_S_COPTIC writes a Coptic year into a string.
%
%  Format:
%
%    Coptic YearNumber
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2013
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
  s = sprintf ( 'Coptic %d', y );

  return
end