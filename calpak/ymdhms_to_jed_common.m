function jed = ymdhms_to_jed_common ( y, m, d, h, n, s )

%*****************************************************************************80
%
%% YMDHMS_TO_JED_COMMON converts a Common YMDHMS date to a JED.
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
%    Input, integer Y, M, D, H, N, S, the YMDHMS date.
%
%    Output, real JED, the Julian Ephemeris Date.
%
  [ y1, m1, d1, f1 ] = ymdhms_to_ymdf_common ( y, m, d, h, n, s );

  jed = ymdf_to_jed_common ( y1, m1, d1, f1 );

  return
end