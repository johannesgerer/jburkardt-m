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
%    22 May 2005
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
  angle_rad = pi * angle / 180.0;

  value = 1.0 / cos ( angle_rad );

  return
end
