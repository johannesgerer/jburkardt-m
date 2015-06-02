function value = r8_cotd ( degrees )

%*****************************************************************************80
%
%% R8_COTD returns the cotangent of an angle given in degrees.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real DEGREES, the angle in degrees.
%
%    Output, real VALUE, the cotangent of the angle.
%
  radians = pi * ( degrees / 180.0 );

  value = cos ( radians ) / sin ( radians );

  return
end
