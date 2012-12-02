function [ y, m, d, h, n ] = minute_borrow_common ( y, m, d, h, n )

%*****************************************************************************80
%
%% MINUTE_BORROW_COMMON "borrows" an hour of minutes in a Common date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, D, H, N, the year,
%    month, day, hour and minute representing a date.  On input, N
%    might be negative.
%    On output, H should have decreased by one, and N gone up by 60.
%
  while ( n < 0 )

    n = n + 60;
    h = h - 1;

    [ y, m, d, h ] = hour_borrow_common ( y, m, d, h );

  end

  return
end