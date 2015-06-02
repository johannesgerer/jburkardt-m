function [ y, m, ierror ] = ym_check_common ( y, m )

%*****************************************************************************80
%
%% YM_CHECK_COMMON checks a Common YM date.
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
%    15 June 2012
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
  [ y, ierror ] = y_check_common ( y );

  if ( ierror ~= 0 )
    return
  end
%
%  Make sure the month isn't too small or too big.
%
  [ y, m ] = month_borrow_common ( y, m );

  [ y, m ] = month_carry_common ( y, m );

  return
end
