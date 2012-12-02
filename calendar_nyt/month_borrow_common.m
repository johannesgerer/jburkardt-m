function [ y, m ] = month_borrow_common ( y, m )

%*****************************************************************************80
%
%% MONTH_BORROW_COMMON borrows a year of months on the Common calendar.
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
%    08 December 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, integer M, the YM date.
%    On input, M might be negative.  
%
%    Output, integer Y, integer M, the YM date.
%    On output, Y should have decreased by
%    one, and M gone up by the number of months in the year that we
%    "cashed in".  The routine knows there was no year 0.
%
  while ( m <= 0 )

    months = year_length_months_common ( y );

    m = m + months;
    y = y - 1;

    if ( y == 0 )
      y = - 1;
    end

  end

  return
end
