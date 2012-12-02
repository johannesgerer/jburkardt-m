function [ y, m ] = month_borrow_hebrew ( y, m )

%*****************************************************************************80
%
%% MONTH_BORROW_HEBREW borrows a year of months on the Hebrew calendar.
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

    months = year_length_months_hebrew ( y );

    m = m + months;
    y = y - 1;

  end

  return
end
