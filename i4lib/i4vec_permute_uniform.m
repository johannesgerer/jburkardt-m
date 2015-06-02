function [ a, seed ] = i4vec_permute_uniform ( n, a, seed )

%*****************************************************************************80
%
%% I4VEC_PERMUTE_UNIFORM randomly permutes an I4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 May 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects.
%
%    Input, integer A(N), the array to be permuted.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer A(N), the permuted array.
%
%    Output, integer SEED, a seed for the random number generator.
%
  [ p, seed ] = perm1_uniform ( n, seed );

  a = i4vec_permute ( n, a, p );

  return
end
