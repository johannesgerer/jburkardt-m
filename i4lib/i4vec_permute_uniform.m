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
%    17 April 2005
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
  base = 1;

  [ p, seed ] = perm_uniform ( n, base, seed );

  a = i4vec_permute ( n, a, p );

  return
end
