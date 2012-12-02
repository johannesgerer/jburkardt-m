function [ y, m ] = month_carry_english ( y, m )

%*****************************************************************************80
%
%% MONTH_CARRY_ENGLISH carries a year of months on the English calendar.
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

    months = year_length_months_english ( y );

    if ( m <= months )
      break
    end

    m = m - months;
    y = y + 1;

  end

  return
end
