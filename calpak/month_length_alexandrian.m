function value = month_length_alexandrian ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_ALEXANDRIAN returns the number of days in an Alexandrian month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2012
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
%    Output, integer MONTH_LENGTH_ALEXANDRIAN, the number of
%    days in the month.
%
  mdays = [ 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 5 ];
%
%  Copy the input.
%
  m2 = m;
  y2 = y;

  if ( m2 < 1 || 13 < m2 )
    value = 0;
  else
    value = mdays(m2);
  end

  if ( m2 == 13 && year_is_leap_alexandrian ( y2 ) )
    value = value + 1;
  end

  return
end
