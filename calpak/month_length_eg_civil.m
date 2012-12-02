function days = month_length_eg_civil ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_EG_CIVIL returns the number of days in an Egyptian Civil month.
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
  if ( m < 1 )
    days = 0;
  elseif ( m <= 12 )
    days = 30;
  elseif ( m == 13 )
    days = 5;
  else
    days = 0;
  end

  return
end
