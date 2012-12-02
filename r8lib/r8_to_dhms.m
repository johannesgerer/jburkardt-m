fucntion [ d, h, m, s ] = r8_to_dhms ( r )

%*****************************************************************************80
%
%% R8_TO_DHMS converts decimal days into days, hours, minutes, seconds.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, a decimal number representing a time 
%    period measured in days.
%
%    Output, integer D, H, M, S, the equivalent number of days, hours,
%    minutes and seconds.
%
  r_sign = r8_sign ( r );
  r = abs ( r );

  d = int ( r );

  r = r - d;
  r = 24.0 * r;
  h = int ( r );

  r = r - h;
  r = 60.0 * r;
  m = int ( r );

  r = r - m;
  r = 60.0 * r;
  s = int ( r );

  d = r_sign * d;
  h = r_sign * h;
  m = r_sign * m;
  s = r_sign * s;

  return
end
