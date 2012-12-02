function [ a, seed ] = permutation_random_inverse ( n, seed )

%*****************************************************************************80
%
%% PERMUTATION_RANDOM_INVERSE: inverse of PERMUTATION_RANDOM matrix.
%
%  Discussion:
%
%    This routine will only work properly if it is given as input the
%    same value of SEED that was given to PERMUTATION_RANDOM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(N,N), the inverse matrix.
%
%    Output, integer SEED, a seed for the random number generator.
%
  p = i4vec_indicator ( n );

  for i = 1 : n

    [ j, seed ] = i4_uniform ( i, n, seed );

    k    = p(j);
    p(j) = p(i);
    p(i) = k;

  end

  p = perm_inverse ( n, p );

  a = perm_vec_to_mat ( n, p );

  return
end
