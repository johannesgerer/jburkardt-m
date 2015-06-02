function [ y, m, d, ierror ] = ymd_check_roman ( y, m, d )

%*****************************************************************************80
%
%% YMD_CHECK_ROMAN checks a Roman YMD date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2013
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
  ierror = 0;
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
  [ y, m ] = month_borrow_roman ( y, m );

  [ y, m ] = month_carry_roman ( y, m );
%
%  Check the day.
%
  [ y, m, d ] = day_borrow_roman ( y, m, d );

  [ y, m, d ] = day_carry_roman ( y, m, d );

  return
end