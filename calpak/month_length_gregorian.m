function days = month_length_gregorian ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_GREGORIAN returns the number of days in a Gregorian month.
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
  [ y2, m2, ierror ] = ym_check_gregorian ( y2, m2 );

  if ( ierror ~= 0 )
    days = 0;
    return
  end
%
%  Get the number of days in the month.
%
  days = mdays(m2);
%
%  If necessary, add 1 day for February 29.
%
  if ( m2 == 2 )
    if ( year_is_leap_gregorian ( y2 ) )
      days = days + 1;
    end
  end

  return
end
