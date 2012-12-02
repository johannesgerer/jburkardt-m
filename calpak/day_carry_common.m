function [ y, m, d ] = day_carry_common ( y, m, d )

%*****************************************************************************80
%
%% DAY_CARRY_COMMON carries days to months in a Common date.
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
%    15 June 2012
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

%
%  If the date is in the transition month, deflate it,
%  so we can perform ordinary arithmetic.
%
  [ y, m, d ] = deflate_common ( y, m, d );

  days = month_length_common ( y, m );

  while ( days < d )

    d = d - days;
    m = m + 1;
    days = month_length_common ( y, m );
%
%  Make sure the month isn't too big.
%
    [ y, m ] = month_carry_common ( y, m );

  end
%
%  If the date is in the transition month, inflate it.
%
  [ y, m, d ] = inflate_common ( y, m, d );

  return
end
