function [ degrees, minutes, seconds ] = radians_to_dms ( radians )

%*****************************************************************************80
%
%% RADIANS_TO_DMS converts an angle from radians to degrees/minutes/seconds.
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
%    Input, real RADIANS, the angle in radians.
%
%    Output, integer DEGREES, MINUTES, SECONDS, the equivalent angle in
%    degrees, minutes, and seconds.
%
  angle = 180.0 * abs ( radians ) / pi;

  degrees = floor ( angle );
  angle = ( angle - degrees ) * 60.0;
  minutes = floor ( angle );
  angle = ( angle - minutes ) * 60.0;
  seconds = round ( angle );

  if ( radians < 0.0 )
    degrees = -degrees;
    minutes = -minutes;
    seconds = -seconds;
  end

  return
end
