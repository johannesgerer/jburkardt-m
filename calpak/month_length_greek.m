function days = month_length_greek ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_GREEK returns the number of days in a Greek month.
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
  mdays = [ 30, 29, 30, 29, 30, 29, 29, 30, 29, 30, 29, 30, 29 ];
%
%  Copy the input.
%
  m2 = m;
  y2 = y;

  if ( m2 < 1 )
    days = 0;
    return
  end
%
%  A 13-month year.
%
  if ( year_is_embolismic_greek ( y2 ) )

    if ( 13 < m2 )
      days = 0;
      return
    end

    days = mdays(m2);

    if ( m2 == 7 && year_is_leap_greek ( y2 ) )
      days = days + 1;
    end
%
%  A 12 month year.
%
  else

    if ( m2 <= 6 )
      days = mdays(m2);
    elseif ( m2 <= 12 )
      days = mdays(m2+1);
    else
      days = 0;
    end

  end

  return
end
