function jed = now_to_jed ( )

%*****************************************************************************80
%
%% NOW_TO_JED expresses the current date as JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 December 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real JED, the Julian Ephemeris Date.
%
  t = now;

  [ y, m, d, h, n, s ] = datevec ( now );

  f = s;
  f = n + f / 60.0;
  f = h + f / 60.0;
  f = f / 24.0;

  jed = ymdf_to_jed_common ( y, m, d, f );

  return
end
