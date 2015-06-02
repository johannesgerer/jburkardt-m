function s = y_to_s_hebrew ( y )

%*****************************************************************************80
%
%% Y_TO_S_HEBREW writes a Hebrew year into a string.
%
%  Format:
%
%    YearNumber AM
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 July 2012
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
  [ y, ierror ] = y_check_hebrew ( y );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Y_TO_S_HEBREW - Fatal error!\n' );
    fprintf ( 1, '  Illegal year Y = %d.\n', y );
    error ( 'Y_TO_S_HEBREW - Fatal error!' );
  end

  s = sprintf ( '%d AM', y );

  return
end
