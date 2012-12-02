function days = month_length_lunar ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_LUNAR returns the number of days in a lunar month.
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
%    Output, real DAYS, the number of days in
%    the month.
%
  if ( m < 1 || 12 < m )
    days = 0.0;
  else
    days = 29.53058;
  end

  return
end
