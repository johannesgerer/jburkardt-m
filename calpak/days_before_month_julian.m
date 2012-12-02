function value = days_before_month_julian ( y, m )

%*****************************************************************************80
%
%% DAYS_BEFORE_MONTH_JULIAN returns the number of days before a Julian month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 June 2012
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
%    Output, integer VALUE, the number of
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
  [ y2, m2, ierror ] = ym_check_julian ( y2, m2 );

  if ( ierror ~= 0 )
    value = 0;
    return
  end

  value = mdays ( m2 );

  if ( 2 < m2 && year_is_leap_julian ( y2 ) )
    value = value + 1;
  end

  return
end
