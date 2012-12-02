function days = days_before_month_common ( y, m )

%*****************************************************************************80
%
%% DAYS_BEFORE_MONTH_COMMON returns the number of days before a Common month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year in which the month occurred.
%
%    Input, integer M, the number of the month.
%
%    Output, integer DAYS, the number of
%    days in the year before the first day of the given month.
%
  mdays = [ 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334 ];
%
%  Copy the input.
%
  m2 = m;
  y2 = y;
%
%  Check the input.
%
  [ y2, m2, ierror ] = ym_check_common ( y2, m2 );

  if ( ierror ~= 0 )
    days = 0;
    return
  end

  days = mdays ( m2 );

  if ( 2 < m2 && year_is_leap_common ( y2 ) )
    days = days + 1;
  end

  return
end
