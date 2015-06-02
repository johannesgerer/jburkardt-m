function [ y2, m2, d2, f2 ] = ymdf_next_common ( y1, m1, d1, f1 )

%*****************************************************************************80
%
%% YMDF_NEXT_COMMON returns the Common YMDF date of the next day.
%
%  Discussion:
%
%    The routine knows that in the Common calendar, the day after
%    4 October 1582 was 15 October 1582.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, M1, D1, real F1, the YMDF date.
%
%    Output, integer Y2, M2, D2, real F2, tomorrow's YMDF date.
%
  y2 = y1;
  m2 = m1;
  d2 = d1 + 1;
  f2 = f1;

  [ y2, m2, d2 ] = day_carry_common ( y2, m2, d2 );

  return
end
