function [ y, j, f, seed ] = yjf_uniform_common ( y1, j1, f1, y2, j2, f2, seed )

%*****************************************************************************80
%
%% YJF_UNIFORM_COMMON picks a random Common YJF date between two given dates.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, J1, real F1,
%    the first YJF date.
%
%    Input, integer Y2, J2, real F2,
%    the second YJF date.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, integer Y, J, real F, the random
%    YJF date.
%
  jed1 = yjf_to_jed_common ( y1, j1, f1 );
  jed2 = yjf_to_jed_common ( y2, j2, f2 );

  [ jed, seed ] = r8_uniform_ab ( jed1, jed2, seed );

  [ y, j, f ] = jed_to_yjf_common ( jed );

  return
end