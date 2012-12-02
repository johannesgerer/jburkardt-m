function [ y, m ] = month_carry_alexandrian ( y, m )

%*****************************************************************************80
%
%% MONTH_CARRY_ALEXANDRIAN carries a year of months on the Alexandrian calendar.
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
  months = year_length_months_alexandrian ( y );

  while ( 1 )

    if ( m <= months )
      break
    end

    m = m - months;
    y = y + 1;

  end

  return
end
