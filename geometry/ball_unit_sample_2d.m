function [ x, seed ] = ball_unit_sample_2d ( seed )

%*****************************************************************************80
%
%% BALL_UNIT_SAMPLE_2D picks a random point in the unit ball in 2D.
%
%  Discussion:
%
%    The unit ball is the set of points (X,Y) such that
%
%      X(1) * X(1) + X(2) * X(2) <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(2), a random point in the unit ball.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ u, seed ] = r8vec_uniform_01 ( 2, seed );

  r = sqrt ( u(1) );
  theta = 2.0 * pi * u(2);

  x(1) = r * cos ( theta );
  x(2) = r * sin ( theta );

  return
end
