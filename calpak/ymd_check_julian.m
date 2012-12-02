function [ y, m, d, ierror ] = ymd_check_julian ( y, m, d )

%*****************************************************************************80
%
%% YMD_CHECK_JULIAN checks a Julian YMD date.
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
%    Input/output, integer Y, M, D, the YMD date, which may
%    be corrected if necessary and possible.
%
%    Output, integer IERROR, is 0 if the date is legal.
%

%
%  Check the month.
%
  [ y, m, ierror ] = ym_check_julian ( y, m );

  if ( ierror ~= 0 )
    return
  end
%
%  Check the day.
%
  [ y, m, d ] = day_borrow_julian ( y, m, d );

  [ y, m, d ] = day_carry_julian ( y, m, d );

  return
end
