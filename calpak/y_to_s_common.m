function s = y_to_s_common ( y )

%*****************************************************************************80
%
%% Y_TO_S_COMMON writes a Common year into a string.
%
%  Format:
%
%    YearNumber BCE
%    YearNumber CE
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
  if ( y < 0 )
    s = sprintf ( 'BCE %d', y );
  else
    s = sprintf ( 'CE %d', y );
  end

  return
end
