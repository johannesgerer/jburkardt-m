function s = y_to_s_greek ( y )

%*****************************************************************************80
%
%% Y_TO_S_GREEK writes a Greek year into a string.
%
%  Format:
%
%    OL 87.1
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
  o = 1 + floor ( ( y - 1 ) / 4 );
  yy = i4_wrap ( y, 1, 4 );

  s = sprintf ( 'OL %d.%d', o, yy );

  return
end