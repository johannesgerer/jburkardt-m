function value = r8_secd ( degrees )

%*****************************************************************************80
%
%% R8_SECD returns the secant of an angle given in degrees.
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
%    Output, real VALUE, the secant of the angle.
%
  radians = pi * ( degrees / 180.0 );

  value = 1.0 / cos ( radians );

  return
end
