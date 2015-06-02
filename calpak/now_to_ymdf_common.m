function [ y, m, d, f ] = now_to_ymdf_common ( )

%*****************************************************************************80
%
%% NOW_TO_YMDF_COMMON expresses the current date as a Common YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer Y, M, D, real F,
%    the YMDF date.
%
  c = clock ( );

  y = c(1);
  m = c(2);
  d = c(3);
  h = c(4);
  n = c(5);
  s = c(6);
  mu = 0.0;

  f = mu;
  f = s + f / 1000.0;
  f = n + f / 60.0;
  f = h + f / 60.0;
  f = f / 24.0;

  return
end
