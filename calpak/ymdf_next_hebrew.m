function [ y2, m2, d2, f2 ] = ymdf_next_hebrew ( y1, m1, d1, f1 )

%*****************************************************************************80
%
%% YMDF_NEXT_HEBREW returns the Hebrew YMDF date of the next day.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, M1, D1, real F1,
%    the YMDF date.
%
%    Output, integer Y2, M2, D2, real F2,
%    tomorrow's YMDF date.
%
  y2 = y1;
  m2 = m1;
  d2 = d1 + 1;
  f2 = f1;

  [ y2, m2, d2 ] = day_carry_hebrew ( y2, m2, d2 );

  return
end