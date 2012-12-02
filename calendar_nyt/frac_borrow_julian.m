function [ y, m, d, f] = frac_borrow_julian ( y, m, d, f )

%*****************************************************************************80
%
%% FRAC_BORROW_JULIAN borrows fractions from days in a Julian YMDF date.
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
%    Input, integer Y, integer M, integer D, real F,
%    a YMDF date.
%
%    Output, integer Y, integer M, integer D, real F,
%    a YMDF date.
%
  while ( f < 0.0 )

    f = f + 1.0;

    d = d - 1;

  end

  [ y, m, d ] = day_borrow_julian ( y, m, d );

  return
end
