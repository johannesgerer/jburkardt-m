function days = month_length_english ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_ENGLISH returns the number of days in an English month.
%
%  Discussion:
%
%    In the English calendar, September 1752 had only 19 days.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2012
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
%  Copy the input.
%
  m2 = m;
  y2 = y;
%
%  Check the input.
%
  [ y2, m2, ierror ] = ym_check_english ( y2, m2 );

  if ( ierror ~= 0 )
    days = 0;
    return
  end
%
%  Take care of special cases:
%
  if ( y2 == 1752 )
    if ( m2 == 9 )
      days = 19;
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
  if ( m2 == 2 && year_is_leap_english ( y2 ) )
    days = days + 1;
  end

  return
end
