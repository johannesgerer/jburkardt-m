function value = r8_tand ( degrees )

%*****************************************************************************80
%
%% R8_TAND returns the tangent of an angle given in degrees.
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
%    Output, real VALUE, the tangent of the angle.
%
  radians = pi * ( degrees / 180.0 );

  value = sin ( radians ) / cos ( radians );

  return
end
