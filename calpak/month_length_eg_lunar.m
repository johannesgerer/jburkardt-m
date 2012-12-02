function days = month_length_eg_lunar ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_EG_LUNAR returns the number of days in an Egyptian Lunar month.
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
  mdays = [ 29, 30, 29, 30, 29, 30, 29, 30, 29, 30, 29, 30, 30 ];
%
%  Copy the input.
%
  m2 = m;
  y2 = y;

  last = year_length_months_eg_lunar ( y2 );

  if ( m2 < 1 )
    days = 0;
  elseif ( m2 <= last )
    days = mdays(m2);
  else
    days = 0;
  end

  if ( m2 == last )
    if ( year_is_leap_eg_lunar ( y ) )
      days = days + 1;
    end
  end

  return
end
