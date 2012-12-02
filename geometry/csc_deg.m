function value = csc_deg ( angle )

%*****************************************************************************80
%
%% CSC_DEG returns the cosecant of an angle given in degrees.
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
%    Output, real VALUE, the cosecant of the angle.
%
  angle_rad = pi * angle / 180.0;

  value = 1.0 / sin ( angle_rad );

  return
end
