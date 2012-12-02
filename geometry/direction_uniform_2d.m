function [ vran, seed ] = direction_uniform_2d ( seed, vran )

%*****************************************************************************80
%
%% DIRECTION_UNIFORM_2D picks a random direction vector in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real VRAN(2), the random direction vector, with
%    unit norm.
%
%    Output, integer SEED, a seed for the random number generator.
%
  dim_num = 2;

  [ theta, seed ] = r8_uniform_01 ( seed );
  theta = 2.0 * pi * theta;

  vran(1) = cos ( theta );
  vran(2) = sin ( theta );

  return
end
