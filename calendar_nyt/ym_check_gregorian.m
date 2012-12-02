function [ y, m, ierror ] = ym_check_gregorian ( y, m )

%*****************************************************************************80
%
%% YM_CHECK_GREGORIAN checks a Gregorian YM date.
%
%  Discussion:
%
%    If the month is less than 1, then the month is incremented
%    by 12, and the year decremented by 1, repeatedly, until
%    the month is greater than or equal to 1.
%
%    If the month is greater than 12, then the month is decremented
%    by 12, and the year incremented by 1, repeatedly, until the
%    month is less than or equal to 12.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 December 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, integer M, the YM date.
%
%    Output, integer Y, integer M, the YM date.
%
%    Output, integer IERROR, is 0 if no error was found in the date,
%    and 1 otherwise.
%

%
%  Check the year.
%
  ierror = y_check_gregorian ( y );

  if ( ierror ~= 0 )
    return
  end
%
%  Make sure the month isn't too small or too big.
%
  [ y, m ] = month_borrow_gregorian ( y, m );

  [ y, m ] = month_carry_gregorian ( y, m );

  return
end
