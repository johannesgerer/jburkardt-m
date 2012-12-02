function meters = feet_to_meters ( feet )

%*****************************************************************************80
%
%% FEET_TO_METERS converts a measurement in feet to meters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real FEET, the length in feet.
%
%    Output, real METERS, the corresponding length in meters.
%
  meters = 0.0254 * 12.0 * feet;

  return
end
