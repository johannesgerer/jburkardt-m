function s = y_to_s_alexandrian ( y )

%*****************************************************************************80
%
%% Y_TO_S_ALEXANDRIAN writes an Alexandrian year into a string.
%
%  Format:
%
%    AX YearNumber
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
  s = sprintf ( "AX %d", y );

  return
end
