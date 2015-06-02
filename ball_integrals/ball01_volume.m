function volume = ball01_volume ( )

%*****************************************************************************80
%
%% BALL01_VOLUME returns the volume of the unit ball.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VOLUME, the volume of the unit ball.
%
  r = 1.0;
  volume = 4.0 * pi * r ^ 3 / 3.0;

  return
end
