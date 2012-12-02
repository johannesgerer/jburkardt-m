function value = ball_unit_volume_nd ( n )

%*****************************************************************************80
%
%% BALL_UNIT_VOLUME_ND computes the volume of a unit ball in ND.
%
%  Integration region:
%
%    Points X(1:N) such that
%
%      Sum ( X(1:N)**2 ) <= 1.
%
%  Discussion:
%
%    N  Volume
%
%    2             PI
%    3  (4/3)    * PI
%    4  (1/2)    * PI**2
%    5  (8/15)   * PI**2
%    6  (1/6)    * PI**3
%    7  (16/105) * PI**3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the space.
%
%    Output, real BALL_UNIT_VOLUME_ND, the volume of the ball.
%
  if ( mod ( n, 2 ) == 0 )
    m = floor ( n / 2 );
    value = 1.0;
    for i = 1 : m
      value = value * pi / i;
    end
  else
    m = floor ( ( n - 1 ) / 2 );
    value = 2.0^n * pi^m;
    for i = 1 : m + 1
      value = value / ( m + i );
    end
  end

  return
end
