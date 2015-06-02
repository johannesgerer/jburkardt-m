function [ a, seed ] = r8vec_permute_uniform ( n, a, seed )

%*****************************************************************************80
%
%% R8VEC_PERMUTE_UNIFORM randomly permutes an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 May 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects.
%
%    Input, real A(N), the array to be permuted.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(N), the permuted array.
%
%    Output, integer SEED, a seed for the random number generator.
%
  [ p, seed ] = perm1_uniform ( n, seed );

  a = r8vec_permute ( n, a, p );

  return
end
