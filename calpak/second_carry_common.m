function [ y, m, d, h, n, s ] = second_carry_common ( y, m, d, h, n, s )

%*****************************************************************************80
%
%% SECOND_CARRY_COMMON: given a Common YMDHMS date, carries seconds to minutes.
%
%  Algorithm:
%
%    While 60 <= S:
%
%      decrease S by 60;
%      increase N by 1;
%      if necessary, adjust H, D, M and Y.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, D, H, N, S,
%    the year, month, day, hours, minutes, seconds,
%    On output, S is between 0 and 59.
%
  while ( 60 <= s )

    s = s - 60;
    n = n + 1;

    [ y, m, d, h, n ] = minute_carry_common ( y, m, d, h, n );

  end

  return
end
