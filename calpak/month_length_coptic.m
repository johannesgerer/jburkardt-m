function days = month_length_coptic ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_COPTIC returns the number of days in a Coptic month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 July 2012
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
  mdays = [ 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 5 ];
%
%  Copy the input.
%
  m2 = m;
  y2 = y;

  if ( m2 < 1 || 13 < m2 )
    days = 0;
  else
    days = mdays(m2);
  end

  if ( m2 == 13 && year_is_leap_coptic ( y2 ) )
    days = days + 1;
  end

  return
end
