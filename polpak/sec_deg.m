function value = sec_deg ( angle )

%*****************************************************************************80
%
%% SEC_DEG returns the secant of an angle given in degrees.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ANGLE, the angle, in degrees.
%
%    Output, real VALUE, the secant of the angle.
%
  value = 1.0D+00 / sin ( pi * angle / 180.0 );

  return
end
