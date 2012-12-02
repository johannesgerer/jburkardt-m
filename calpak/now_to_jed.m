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
%    09 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real JED, the Julian Ephemeris Date.
%
  c = clock ( );

  y = c(1);
  m = c(2);
  d = c(3);
  h = c(4);
  n = c(5);
  s = c(6);

  f = ( h + ( n + s / 60.0D+00 ) / 60.00 ) / 24.00;

  jed = ymdf_to_jed_common ( y, m, d, f );

  return
end
