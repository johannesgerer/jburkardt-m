function [ x, seed ] = sphere_unit_sample_2d ( seed )

%*****************************************************************************80
%
%% SPHERE_UNIT_SAMPLE_2D picks a random point on the unit sphere (circle) in 2D.
%
%  Discussion:
%
%    The unit sphere in 2D satisfies:
%
%      X * X + Y * Y = 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(2), a random point on the unit circle.
%
%    Output, integer SEED, a seed for the random number generator.
%
  dim_num = 2;

  [ u, seed ] = r8_uniform_01 ( seed );

  x(1) = cos ( 2.0 * pi * u );
  x(2) = sin ( 2.0 * pi * u );

  return
end
