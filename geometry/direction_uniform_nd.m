function [ w, seed ] = direction_uniform_nd ( dim_num, seed )

%*****************************************************************************80
%
%% DIRECTION_UNIFORM_ND generates a random direction vector in ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real W(DIM_NUM), a random direction vector,
%    with unit norm.
%
%    Output, integer SEED, a seed for the random number generator.
%

%
%  Get N values from a standard normal distribution.
%
  [ w, seed ] = r8vec_normal_01 ( dim_num, seed );
%
%  Compute the length of the vector.
%
  norm = sqrt ( sum ( w(1:dim_num).^2 ) );
%
%  Normalize the vector.
%
  w(1:dim_num) = w(1:dim_num) / norm;

  return
end
