function value = r8_radians ( degrees )

%*****************************************************************************80
%
%% R8_RADIANS converts an angle from degree to radian measure.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real DEGREES, the angle measurement in degrees.
%
%    Output, real VALUE, the angle measurement in radians.
%
  value = degrees * r8_pi / 180.0;

  return
end
