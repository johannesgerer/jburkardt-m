function radians = degrees_to_radians ( degrees )

%*****************************************************************************80
%
%% DEGREES_TO_RADIANS converts an angle measure from degrees to radians.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real DEGREES, the angle measure in degrees.
%
%    Output, real RADIANS, the angle measure in radians.
%
  radians = ( degrees / 180.0 ) * 3.141592653589793;

  return
end
