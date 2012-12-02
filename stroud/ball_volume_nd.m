function value = ball_volume_nd ( n, r )

%*****************************************************************************80
%
%% BALL_VOLUME_ND computes the volume of a ball in ND.
%
%  Integration region:
%
%    Points X(1:N) such that
%
%      Sum ( X(1:N)**2 ) <= R**2
%
%  Discussion:
%
%    N  Volume
%
%    2             PI    * R**2
%    3  (4/3)    * PI    * R**3
%    4  (1/2)    * PI**2 * R**4
%    5  (8/15)   * PI**2 * R**5
%    6  (1/6)    * PI**3 * R**6
%    7  (16/105) * PI**3 * R**7
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
%    Input, integer N, the dimension of the space.
%
%    Input, real R, the radius of the ball.
%
%    Output, real BALL_VOLUME_ND, the volume of the ball.
%
  value = ball_unit_volume_nd ( n ) * r^n;

  return
end
