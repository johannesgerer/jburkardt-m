function jed = now_to_jed ( )

%*****************************************************************************80
%
%% NOW_TO_JED expresses the current date as a JED.
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
%    Output, real JED, the JED for the current date.
%
  c = clock ( );

  y = c(1);
  m = c(2);
  d = c(3);
  h = c(4);
  n = c(5);
  s = c(6);

  jed = ymdhms_to_jed_common ( y, m, d, h, n, s );

  return
end
