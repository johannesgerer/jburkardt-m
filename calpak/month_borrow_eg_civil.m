function [ y, m ] = month_borrow_eg_civil ( y, m )

%*****************************************************************************80
%
%% MONTH_BORROW_EG_CIVIL borrows a year of months on Egyptian Civil calendar.
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

    months = year_length_months_eg_civil ( y );

    m = m + months;
    y = y - 1;

  end

  return
end
