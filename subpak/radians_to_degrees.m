function degrees = radians_to_degrees ( radians )

%*****************************************************************************80
%
%% RADIANS_TO_DEGREES converts an angle measure from radians to degrees.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real RADIANS, the angle measure in radians.
%
%    Output, real DEGREES, the angle measure in degrees.
%
  degrees = ( radians / pi ) * 180.0;

  return
end
