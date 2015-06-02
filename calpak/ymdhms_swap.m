function [ y1, m1, d1, h1, n1, s1, y2, m2, d2, h2, n2, s2 ] = ymdhms_swap ( ...
  y1, m1, d1, h1, n1, s1, y2, m2, d2, h2, n2, s2 )

%*****************************************************************************80
%
%% YMDHMS_SWAP swaps the data defining two YMDHMS dates.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y1, M1, D1, H1, M1, S1, the first date.
%
%    Input/output, integer Y2, M2, D2, H2, M2, S2, the second date.
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

  tt = h1;
  h1 = h2;
  h2 = tt;

  tt = n1;
  n1 = n2;
  n2 = tt;

  tt = s1;
  s1 = s2;
  s2 = tt;

  return
end