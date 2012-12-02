function [ y, m, d ] = day_borrow_common ( y, m, d )

%*****************************************************************************80
%
%% DAY_BORROW_COMMON borrows days from months in a Common date.
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
%    Input, integer Y, integer M, integer D, a year, month, and day
%    representing a date.  On input, D might be negative.
%
%    Output, integer Y, integer M, integer D, a year, month, and day
%    representing a date.  On output,
%    M should have decreased by one month, and D gone up by the
%    number of days in the month we "cashed in".  Y may be affected
%    if the input value of M was 1.
%
  while ( d <= 0 )

    m = m - 1;

    [ y, m ] = month_borrow_common ( y, m );

    days = month_length_common ( y, m );

    d = d + days;

  end

  return
end
