function [ y, m, d, h, n, s ] = now_to_ymdhms_common ( )

%*****************************************************************************80
%
%% NOW_TO_YMDHMS_COMMON expresses the current date as a Common YMDHMS date.
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
%    Output, integer Y, M, D, H, N, S, the YMDHMS date.
%
  c = clock ( );

  y = c(1);
  m = c(2);
  d = c(3);
  h = c(4);
  n = c(5);
  s = round ( c(6) );

  return
end
