function value = sin_deg ( angle )

%*****************************************************************************80
%
%% SIN_DEG returns the sine of an angle given in degrees.
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
%    Output, real VALUE, the sine of the angle.
%
  angle_rad = pi * angle / 180.0;

  value = sin ( angle_rad );

  return
end
