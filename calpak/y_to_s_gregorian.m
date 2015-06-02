function s = y_to_s_gregorian ( y )

%*****************************************************************************80
%
%% Y_TO_S_GREGORIAN writes a Gregorian year into a string.
%
%  Format:
%
%    YearNumber BC
%    YearNumber AD
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
  if ( y < 0 )
    s = sprintf ( 'BC %d', -y );
  elseif ( 0 < y )
    s = sprintf ( 'AD %d', y );
  end

  return
end
