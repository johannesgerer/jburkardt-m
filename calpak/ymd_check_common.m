function [ y, m, d, ierror ] = ymd_check_common ( y, m, d )

%*****************************************************************************80
%
%% YMD_CHECK_COMMON checks a Common YMD date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, D, the YMD date.
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
%
%  Make sure the day isn't too small or too big.
%
  [ y, m, d ] = day_borrow_common ( y, m, d );

  [ y, m, d ] = day_carry_common ( y, m, d );

  return
end
