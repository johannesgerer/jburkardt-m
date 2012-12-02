function [ y, m, d, f ] = frac_borrow_hebrew ( y, m, d, f )

%*****************************************************************************80
%
%% FRAC_BORROW_HEBREW borrows fractions from days in a Hebrew YMDF date.
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
  while ( f < 0.0 )

    f = f + 1.0;

    d = d - 1;

  end

  [ y, m, d ] = day_borrow_hebrew ( y, m, d );

  return
end
