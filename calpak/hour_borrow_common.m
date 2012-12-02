function [ y, m, d, h ] = hour_borrow_common ( y, m, d, h )

%*****************************************************************************80
%
%% HOUR_BORROW_COMMON "borrows" a day of hours.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, D, H, the year, month, day
%    and hour of the date.  The value of H is presumably negative, and
%    so hours will be "borrowed" to make H positive.
%
  while ( h <= 0 )

    h = h + 24;
    d = d - 1;

    [ y, m, d ] = day_borrow_common ( y, m, d );

  end

  return
end
