function [ y, m ] = month_carry_republican ( y, m )

%*****************************************************************************80
%
%% MONTH_CARRY_REPUBLICAN carries a year of months on the Republican calendar.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 July 2012
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

    months = year_length_months_republican ( y );

    if ( m <= months )
      return
    end

    m = m - months;
    y = y + 1;

  end

  return
end