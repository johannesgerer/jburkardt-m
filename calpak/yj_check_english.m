function [ y, j, ierror ] = yj_check_english ( y, j )

%*****************************************************************************80
%
%% YJ_CHECK_ENGLISH checks an English YJ date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, J, the YJ date.
%
%    Output, integer IERROR, is 0 if no serious error was found in
%    the date, and 1 otherwise.
%

%
%  Check the year.
%
  [ y, ierror ] = y_check_english ( y );

  if ( ierror ~= 0 )
    return
  end
%
%  Make sure J is not too small or too big.
%
  [ y, j ] = j_borrow_english ( y, j );

  [ y, j ] = j_carry_english ( y, j );

  return
end
