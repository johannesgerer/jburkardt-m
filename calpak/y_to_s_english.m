function s = y_to_s_english ( y )

%*****************************************************************************80
%
%% Y_TO_S_ENGLISH writes an English year into a string.
%
%  Format:
%
%    YearNumber BC OS
%    YearNumber AD OS
%    YearNumber AD NS
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
  [ y, ierror ] = y_check_english ( y );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Y_TO_S_ENGLISH - Fatal error!\n' );
    fprintf ( 1, '  Illegal year.\n' );
    error ( 'Y_TO_S_ENGLISH - Fatal error!' );
  end

  if ( y < 0 )
    s = sprintf ( 'BC OS %d', - y );
  elseif ( y <= 1752 )
    s = sprintf ( 'AD OS %d', y );
  elseif ( 1752 < y )
    s = sprintf ( 'AD NS %d', y );
  end

  return
end
