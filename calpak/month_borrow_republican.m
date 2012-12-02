function [ y, m ] = month_borrow_republican ( y, m )

%*****************************************************************************80
%
%% MONTH_BORROW_REPUBLICAN borrows a year of months on the Republican calendar.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, the YM date.
%
  while ( m <= 0 )

    months = year_length_months_republican ( y );

    m = m + months;
    y = y - 1;

  end

  return
end
