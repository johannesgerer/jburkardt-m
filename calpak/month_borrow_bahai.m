function [ y, m ] = month_borrow_bahai ( y, m )

%*****************************************************************************80
%
%% MONTH_BORROW_BAHAI borrows a year of months on the Bahai calendar.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, the YM date.
%    On input, M might be negative.  On output, Y should have decreased by
%    one, and M gone up by the number of months in the year that we
%    "cashed in".  The routine knows there was no year 0.
%
  while ( m <= 0 )

    months = year_length_months_bahai ( y );

    m = m + months;
    y = y - 1;

  end

  return
end
