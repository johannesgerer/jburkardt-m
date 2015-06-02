function [ y, m, ierror ] = ym_check_islamic ( y, m )

%*****************************************************************************80
%
%% YM_CHECK_ISLAMIC checks an Islamic YM date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, the YM date.
%
%    Output, integer IERROR, is 0 if no error was found in the date
%    and 1 otherwise.
%

%
%  Check the year.
%
  [ y, ierror ] = y_check_islamic ( y );

  if ( ierror ~= 0 )
    return
  end
%
%  Make sure the month isn't too small or too big.
%
  [ y, m ] = month_borrow_islamic ( y, m );

  [ y, m ] = month_carry_islamic ( y, m );

  return
end
