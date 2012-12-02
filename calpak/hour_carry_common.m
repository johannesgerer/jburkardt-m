function [ y, m, d, h ] = hour_carry_common ( y, m, d, h )

%*****************************************************************************80
%
%% HOUR_CARRY_COMMON is given a YMDH date, and carries hours to days.
%
%  Algorithm:
%
%    While 24 < H:
%
%      decrease H by the number of hours in a day;
%      increase D by 1;
%      if necessary, adjust M and Y.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, D, H, the year, month, day
%    and hour of the date.  On input, H is presumably 24 or greater.
%
  while ( 24 < h )

    h = h - 24;
    d = d + 1;

    [ y, m, d ] = day_carry_common ( y, m, d );

  end

  return
end
