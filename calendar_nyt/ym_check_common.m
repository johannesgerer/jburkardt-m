function [ y, m, value ] = ym_check_common ( y, m )

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
%    Output, integer VALUE, is 0 if no error was found in the date,
%    and 1 otherwise.
%

%
%  Check the year.
%
  value = y_check_common ( y );

  if ( value ~= 0 )
    return
  end
%
%  Make sure the month isn't too small or too big.
%
  [ y, m ] = month_borrow_common ( y, m );

  [ y, m ] = month_carry_common ( y, m );

  return
end
