function determ = permutation_random_determinant ( n, key )

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
%    Input, integer KEY, a positive value that selects the data.
%
%    Output, real DETERM, the determinant.
%
  seed = key;

  p = i4vec_indicator ( n );

  for i = 1 : n

    [ j, seed ] = i4_uniform_ab ( i, n, seed );

    k    = p(j);
    p(j) = p(i);
    p(i) = k;

  end

  determ = perm_sign ( n, p );

  return
end
