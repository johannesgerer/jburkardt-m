function [ y, m ] = month_carry_common ( y, m )

%*****************************************************************************80
%
%% MONTH_CARRY_COMMON carries a year of months on the Common calendar.
%
%  Algorithm:
%
%    While 12 < M:
%
%      decrease M by 12;
%      increase Y by 1;
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
%    Input/output, integer Y, M, the year and month.
%    On output, M is no greater than 12.
%
  while ( 1 )

    months = year_length_months_common ( y );

    if ( m <= months )
      break
    end

    m = m - months;
    y = y + 1;

  end

  return
end
