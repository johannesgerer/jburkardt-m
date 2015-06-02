function s = y_to_s_persian ( y )

%*****************************************************************************80
%
%% Y_TO_S_PERSIAN writes a Persian year into a string.
%
%  Format:
%
%    AP YearNumber
%
%  Discussion:
%
%    "AP" stands for "anno Persico".
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
  s = sprintf ( 'AP %d', y );

  return
end
