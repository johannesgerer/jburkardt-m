function [ y, j ] = j_borrow_republican ( y, j )

%*****************************************************************************80
%
%% J_BORROW_REPUBLICAN borrows year-days from years in a Republican date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2000
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

    days = year_length_republican ( y );

    j = j + days;

  end

  return
end
