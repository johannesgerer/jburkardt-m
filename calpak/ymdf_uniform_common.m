function [ y, m, d, f, seed ] = ymdf_uniform_common ( y1, m1, d1, f1, ...
  y2, m2, d2, f2, seed )

%*****************************************************************************80
%
%% YMDF_UNIFORM_COMMON: random Common YMDF date between two given dates.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, M1, D1, real F1,
%    the first YMDF date.
%
%    Input, integer Y2, M2, D2, real F2,
%    the second YMDF date.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, integer Y, M, D, real F, the
%    random YMDF date.
%
  jed1 = ymdf_to_jed_common ( y1, m1, d1, f1 );
  jed2 = ymdf_to_jed_common ( y2, m2, d2, f2 );

  [ jed, seed ] = r8_uniform_ab ( jed1, jed2, seed );

  [ y, m, d, f ] = jed_to_ymdf_common ( jed );

  return
end