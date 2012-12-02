function value = ball_volume_3d ( r )

%*****************************************************************************80
%
%% BALL_VOLUME_3D computes the volume of a ball in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that
%
%      X**2 + Y**2 + Z**2 <= R**2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the ball.
%
%    Output, real BALL_VOLUME_3D, the volume of the ball.
%
  value = ( 4.0E+00 / 3.0E+00 ) * pi * r * r * r;

  return
end
