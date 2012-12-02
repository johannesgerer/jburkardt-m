function [ y, m ] = month_carry_bahai ( y, m )

%*****************************************************************************80
%
%% MONTH_CARRY_BAHAI carries a year of months on the Bahai calendar.
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
%    Input/output, integer Y, M, the YM date.
%
  months = year_length_months_bahai ( y );

  while ( 1 )

    if ( m <= months )
      break;
    end if

    m = m - months;
    y = y + 1;

  end

  return
end
