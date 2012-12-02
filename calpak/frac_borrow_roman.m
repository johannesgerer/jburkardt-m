function [ y, m, d, f ] = frac_borrow_roman ( y, m, d, f )

%*****************************************************************************80
%
%% FRAC_BORROW_ROMAN borrows fractions from days in a Roman YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, D, real F,
%    a YMDF date.
%
  do ( f < 0.0 )

    f = f + 1.0;

    d = d - 1;

  end

  [ y, m, d ] = day_borrow_roman ( y, m, d );

  return
end
