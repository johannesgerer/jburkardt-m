function a = permutation_random ( n, key )

%*****************************************************************************80
%
%% PERMUTATION_RANDOM returns the PERMUTATION_RANDOM matrix.
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
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer KEY, a positive value that selects the data.
%
%    Output, real A(N,N), the matrix.
%
  p = i4vec_indicator ( n );

  seed = key;

  for i = 1 : n
    [ j, seed ] = i4_uniform_ab ( i, n, seed );
    temp = p(j);
    p(j) = p(i);
    p(i) = temp;
  end

  a = perm_vec_to_mat ( n, p );

  return
end
