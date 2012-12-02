function s = y_to_s ( y )

%*****************************************************************************80
%
%% Y_TO_S writes a year into a string.
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
  s = sprintf ( "%d", y );

  return
end