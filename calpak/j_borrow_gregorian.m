function [ y, j ] = j_borrow_gregorian ( y, j )

%*****************************************************************************80
%
%% J_BORROW_GREGORIAN borrows year-days from years in a Gregorian date.
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
%    Input/output, integer Y, J, a YJ date.
%
  while ( j <= 0 )

    y = y - 1;

    days = year_length_gregorian ( y );

    j = j + days;

  end

  return
end
