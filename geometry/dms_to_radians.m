function radians = dms_to_radians ( degrees, minutes, seconds )

%*****************************************************************************80
%
%% DMS_TO_RADIANS converts an angle from degrees/minutes/seconds to radians.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DEGREES, MINUTES, SECONDS, an angle in degrees, minutes,
%    and seconds.
%
%    Output, real RADIANS, the equivalent angle in radians.
%
  angle =   degrees + ( minutes + ( seconds / 60.0 ) ) / 60.0;

  radians = ( angle / 180.0 ) * pi;

  return
end
