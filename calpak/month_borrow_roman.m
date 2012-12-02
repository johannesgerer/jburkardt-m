function [ y, m ] = month_borrow_roman ( y, m )

%*****************************************************************************80
%
%% MONTH_BORROW_ROMAN borrows a year of months on the Roman calendar.
%
%  Discussion:
%
%    If the month index is legal, nothing is done.  If the month index
%    is too small, then one or more years are "cashed in" to bring the
%    month index up to a legal value.
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

    months = year_length_months_roman ( y );

    m = m + months;
    y = y - 1;

    if ( y == 0 )
      y = - 1;
    end

  end

  return
end
