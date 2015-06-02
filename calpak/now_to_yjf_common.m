function [ y, j, f ] = now_to_yjf_common ( )

%*****************************************************************************80
%
%% NOW_TO_YMDF_COMMON expresses the current date as a Common YJF date.
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
%    Output, integer Y, J, real F, the YJF date.
%
  c = clock ( );

  y1 = c(1);
  m1 = c(2);
  d1 = c(3);
  h1 = c(4);
  n1 = c(5);
  s1 = c(6);
  mu1 = 0.0;

  f1 = mu1;
  f1 = s1 + f1 / 1000.0;
  f1 = n1 + f1 / 60.0;
  f1 = h1 + f1 / 60.0;
  f1 = f1 / 24.0;

  [ y, j, f ] = ymdf_to_yjf_common ( y1, m1, d1, f1 );

  return
end
