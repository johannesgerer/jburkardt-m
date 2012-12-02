function [ y, m, d, h, n ] = minute_carry_common ( y, m, d, h, n )

%*****************************************************************************80
%
%% MINUTE_CARRY_COMMON: given a Common YMDHMS date, carries minutes to hours.
%
%  Algorithm:
%
%    While 60 <= N:
%
%      decrease N by the number of minutes in an hour;
%      increase H by 1;
%      if necessary, adjust Y, M and D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, D, H, N, the date.
%    On output, N is between 0 and 59.
%
  while ( 60 <= n )

    n = n - 60;
    h = h + 1;

    [ y, m, d, h ] = hour_carry_common ( y, m, d, h );

  end

  return
end
