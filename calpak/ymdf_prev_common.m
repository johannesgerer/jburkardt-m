function [ y2, m2, d2, f2 ] = ymdf_prev_common ( y1, m1, d1, f1 )

%*****************************************************************************80
%
%% YMDF_PREV_COMMON returns the Common YMDF date of the previous day.
%
%  Discussion:
%
%    The routine knows that in the Common calendar, the day before
%    15 October 1582 was 4 October 1582.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%   01 March 2013
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
%    yesterday's YMDF date.
%
  y2 = y1;
  m2 = m1;
  d2 = d1 - 1;
  f2 = f1;

  [ y2, m2, d2 ] = day_borrow_common ( y2, m2, d2 );

  return
end