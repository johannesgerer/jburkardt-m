function value = r8_degrees ( radians )

%*****************************************************************************80
%
%% R8_DEGREES converts an angle from radian to degree measure.
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
%    Input, real RADIANS, the angle measurement in radians.
%
%    Output, real VALUE, the angle measurement in degrees.
%
  value = radians * 180.0 / pi;

  return
end
