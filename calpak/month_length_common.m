function days = month_length_common ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_COMMON returns the number of days in a Common month.
%
%  Discussion:
%
%    The "common" calendar is meant to be the calendar which is Julian up to
%    day JED = 2299160, and Gregorian from day JED = 2299161 and after.
%
%    The routine knows that February has 28 days, except in leap years,
%    when it has 29.
%
%    In the Common calendar, October 1582 had only 21 days
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2012
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
  mdays = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
%
%  Check the input.
%
  [ y2, m2, ierror ] = ym_check_common ( y, m );

  if ( ierror ~= 0 )
    days = 0;
    return
  end
%
%  Take care of the special case.
%
  if ( y2 == 1582 )
    if ( m2 == 10 )
      days = 21;
      return
    end
  end
%
%  Get the number of days in the month.
%
  days = mdays(m2);
%
%  If necessary, add 1 day for February 29.
%
  if ( m2 == 2 && year_is_leap_common ( y2 ) )
    days = days + 1;
  end

  return
end
