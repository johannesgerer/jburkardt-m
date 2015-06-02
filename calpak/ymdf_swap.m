function [ y1, m1, d1, f1, y2, m2, d2, f2 ] = ymdf_swap ( y1, m1, d1, f1, ...
  y2, m2, d2, f2 )

%*****************************************************************************80
%
%% YMDF_SWAP swaps two YMDF dates.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y1, M1, D1, real F1, the
%    first YMDF date.
%
%    Input/output, integer Y2, M2, D2, real F2, the
%    second YMDF date.
%
  tt = y1;
  y1 = y2;
  y2 = tt;

  tt = m1;
  m1 = m2;
  m2 = tt;

  tt = d1;
  d1 = d2;
  d2 = tt;

  tt = f1;
  f1 = f2;
  f2 = tt;

  return
end