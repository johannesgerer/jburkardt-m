function value = cot_deg ( angle )

%*****************************************************************************80
%
%% COT_DEG returns the cotangent of an angle given in degrees.
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
%    Output, real COT_DEG, the cotangent of the angle.
%
  angle_rad = pi * angle / 180.0;

  value = cos ( angle_rad ) / sin ( angle_rad );

  return
end
