function value = month_length_julian ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_JULIAN returns the number of days in a Julian month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2012
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
%    Output, integer VALUE, the number of days
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
  [ y2, m2, ierror ] = ym_check_julian ( y2, m2 );

  if ( ierror ~= 0 )
    value = 0;
    return
  end
%
%  Get the number of days in the month.
%
  value = mdays(m2);
%
%  If necessary, add 1 day for February 29.
%
  if ( m2 == 2 && year_is_leap_julian ( y2 ) )
    value = value + 1;
  end

  return
end
