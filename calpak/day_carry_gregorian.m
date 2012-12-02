function [ y, m, d ] = day_carry_gregorian ( y, m, d )

%*****************************************************************************80
%
%% DAY_CARRY_GREGORIAN carries days to months in a Gregorian date.
%
%  Discussion:
%
%    While ( number of days in M ) < D:
%      decrease the day D by the number of days in the month M;
%      increase M by 1;
%      if necessary, adjust Y.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, D, the YMD date.
%    On output, D is between 1 and the number of days in M.
%
  days = month_length_gregorian ( y, m );

  while ( days < d )

    d = d - days;
    m = m + 1;
    days = month_length_gregorian ( y, m );
%
%  Make sure the month isn't too big.
%
    [ y, m ] = month_carry_gregorian ( y, m );

  end

  return
end
