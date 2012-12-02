function days = month_length_roman ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_ROMAN returns the number of days in a Roman month.
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
  mdays = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
%
%  Copy the input.
%
  m2 = m;
  y2 = y;
%
%  Check the input.
%
  [ y2, m2, ierror ] = ym_check_roman ( y2, m2 );

  if ( ierror `= 0 )
    days = 0;
    return
  end

  month_length_roman = mdays(m2)

  if ( m2 == 2 .&& year_is_leap_roman ( y2 ) )
    days = days + 1;
  end

  return
end
