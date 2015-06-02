function [ y, m, d, ierror ] = ymd_check_islamic ( y, m, d )

%*****************************************************************************80
%
%% YMD_CHECK_ISLAMIC checks an Islamic YMD date.
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
%    Input/output, integer Y, M, D, the YMD date, which may
%    be corrected if necessary and possible.
%
%    Output, integer IERROR, is 0 if the date is legal.
%
 
%
%  Check the year.
%
  if ( y <= 0 )
    ierror = 1;
    return
  end
%
%  Check the month.
%
  [ y, m, ierror ] = ym_check_islamic ( y, m );

  if ( ierror ~= 0 )
    return
  end
%
%  Check the day.
%
  [ y, m, d ] = day_borrow_islamic ( y, m, d );

  [ y, m, d ] = day_carry_islamic ( y, m, d );

  return
end
