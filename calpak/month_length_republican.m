function days = month_length_republican ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_REPUBLICAN returns the number of days in a Republican month.
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

%
%  Copy the input.
%
  m2 = m;
  y2 = y;
%
%  Check the input.
%
  [ y2, m2, ierror ] = ym_check_republican ( y2, m2, ierror );

  if ( ierror ~= 0 )
    days = 0;
    return
  end
%
%  Get the number of days in the month.
%
  if ( 1 <= m2 && m2 <= 12 )
    days = 30;
  else if ( m2 == 13 )
    if ( year_is_leap_republican ( y2 ) )
      days = 6;
    else
      days = 5;
    end
  end

  return
end
