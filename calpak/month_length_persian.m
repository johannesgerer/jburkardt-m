function days = month_length_persian ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_PERSIAN returns the number of days in a Persian month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 July 2012
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
  mdays = [ 31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 29 ];
%
%  Copy the input.
%
  m2 = m;
  y2 = y;
%
%  Get the number of days in the month.
%
  days = mdays(m2);
%
%  If necessary, add 1 day for a leap year.
%
  if ( m2 == 12 && year_is_leap_persian ( y2 ) )
    days = days + 1;
  end

  return
end
