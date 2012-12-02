function [ determ, seed ] = permutation_random_determinant ( n, seed )

%*****************************************************************************80
%
%% PERMUTATION_RANDOM_DETERMINANT: determinant of PERMUTATION_RANDOM matrix.
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
%    27 October 2007
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
%    Output, real DETERM, the determinant.
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

  determ = perm_sign ( n, p );

  return
end
