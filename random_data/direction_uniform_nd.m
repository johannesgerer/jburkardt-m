function [ w, seed ] = direction_uniform_nd ( ndim, seed )

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
%    Input, integer NDIM, the dimension of the space.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real W(NDIM), a random direction vector,
%    with unit norm.
%
%    Output, integer SEED, a seed for the random number generator.
%

%
%  Get N values from a standard normal distribution.
%
  [ w, seed ] = r8vec_normal_01 ( ndim, seed );
%
%  Compute the length of the vector.
%
  norm = sqrt ( sum ( w(1:ndim).^2 ) );
%
%  Normalize the vector.
%
  w(1:ndim) = w(1:ndim) / norm;

  return
end
