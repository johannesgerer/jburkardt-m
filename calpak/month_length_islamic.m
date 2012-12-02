function days = month_length_islamic ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_ISLAMIC returns the number of days in an Islamic month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 July 2012
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
%    Output, integer DAYS, the number of days
%    in the month.
%
  mdays = [ 30, 29, 30, 29, 30, 29, 30, 29, 30, 29, 30, 29 ];
%
%  Copy the input.
%
  m2 = m;
  y2 = y;
%
%  Check the input.
%
  [ y2, m2, ierror ] = ym_check_islamic ( y2, m2 );

  if ( ierror ~= 0 )
    days = 0;
    return
  end
%
%  Get the number of days in the month.
%
  days = mdays(m2);
%
%  If necessary, add 1 day for a leap year.
%
  if ( m2 == 12 && year_is_leap_islamic ( y2 ) )
    days = days + 1;
  end

  return
end
