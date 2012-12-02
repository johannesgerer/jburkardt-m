function [ y, m, d ] = day_borrow_alexandrian ( y, m, d )

%*****************************************************************************80
%
%% DAY_BORROW_ALEXANDRIAN borrows days from months in an Alexandrian date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, D, a year, month, and day
%    representing a date.  On input, D might be negative.  On output,
%    M should have decreased by one month, and D gone up by the
%    number of days in the month we "cashed in".  Y may be affected
%    if the input value of M was 1.
%
  while ( d <= 0 )

    m = m - 1;

    [ y, m ] = month_borrow_alexandrian ( y, m );

    days = month_length_alexandrian ( y, m );

    d = d + days;

  end

  return
end
