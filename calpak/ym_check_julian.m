function [ y, m, ierror ] = ym_check_julian ( y, m )

%*****************************************************************************80
%
%% YM_CHECK_JULIAN checks a Julian YM date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2012
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
  [ y, ierror ] = y_check_julian ( y );

  if ( ierror ~= 0 )
    return
  end
%
%  Make sure the month isn't too small or too big.
%
  [ y, m ] = month_borrow_julian ( y, m );

  [ y, m ] = month_carry_julian ( y, m );

  return
end
