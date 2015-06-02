function s = y_to_s_eg_civil ( y )

%*****************************************************************************80
%
%% Y_TO_S_EG_CIVIL writes an Egyptian Civil year into a string.
%
%  Format:
%
%    EN YearNumber
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Discussion:
%
%    "EN" stands for the Era of Nabonassar, a Babylonian king who
%    acceded in 747 BC, used by the astronomer Ptolemy to assign
%    an artificial starting year for the Egyptian calendar.
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
  s = sprintf ( 'EN %d', y );

  return
end