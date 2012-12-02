function [ y, m ] = month_carry_eg_civil ( y, m )

%*****************************************************************************80
%
%% MONTH_CARRY_EG_CIVIL carries a year of months on the Egyptian Civil calendar.
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
%
  months = year_length_months_eg_civil ( y );

  while ( 1 )

    if ( m <= months )
      break
    end

    m = m - months;
    y = y + 1;

  end

  return
end
