function days = month_length_bahai ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_BAHAI returns the number of days in a Bahai month.
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
%    Output, integer DAYS, the number of
%    days in the month.
%

%
%  Copy the input.
%
  m2 = m;
  y2 = y;
%
%  Check the input.
%
  [ y2, m2, ierror ] = ym_check_bahai ( y2, m2 );

  if ( ierror ~= 0 )
    days = 0;
    return
  end

  if ( m2 <= 18 || m2 == 20 )
    days = 19;
  elseif ( year_is_leap_bahai ( y2 ) )
    days = 5;
  else
    days = 4;
  end

  return
end
