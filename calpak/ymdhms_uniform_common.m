function [ y, m, d, h, n, s, seed ] = ymdhms_uniform_common ( y1, m1, d1, ...
  h1, n1, s1, y2, m2, d2, h2, n2, s2, seed )

%*****************************************************************************80
%
%% YMDHMS_UNIFORM_COMMON: random Common YMDHMS date between two given dates.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, M1, D1, H1, N1, S1,
%    the first YMDHMS date.
%
%    Input, integer Y2, M2, D2, H2, N2, S2,
%    the second YMDHMS date.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, integer Y, M, D, H, N, S,
%    the random YMDHMS date.
%
  jed1 = ymdhms_to_jed_common ( y1, m1, d1, h1, n1, s1 );

  jed2 = ymdhms_to_jed_common ( y2, m2, d2, h2, n2, s2 );

  [ jed, seed ] = r8_uniform_ab ( jed1, jed2, seed );

  [ y, m, d, h, n, s ] = jed_to_ymdhms_common ( jed );

  return
end
