function [ w, seed ] = r8vec_uniform_unit ( m, seed )

%*****************************************************************************80
%
%% R8VEC_UNIFORM_UNIT generates a random unit vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the dimension of the space.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real W(M), a random direction vector,
%    with unit norm.
%
%    Output, integer SEED, a seed for the random number generator.
%

%
%  Get N values from a standard normal distribution.
%
  [ w, seed ] = r8vec_normal_01 ( m, seed );
%
%  Compute the length of the vector.
%
  norm = sqrt ( sum ( w(1:m).^2 ) );
%
%  Normalize the vector.
%
  w(1:m) = w(1:m) / norm;

  return
end
