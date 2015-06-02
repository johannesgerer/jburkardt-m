function a = tournament_random ( n, key )

%*****************************************************************************80
%
%% TOURNAMENT_RANDOM returns a random tournament matrix.
%
%  Example:
%
%    N = 5
%
%     0  -1   1   1   -1
%     1   0   1   1    1
%    -1  -1   0   1   -1
%    -1  -1  -1   0   -1
%     1  -1   1   1    0
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is antisymmetric: A' = -A.
%
%    Because A is antisymmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    The diagonal of A is zero.
%
%    All the eigenvalues of A are imaginary.
%
%    If N is odd, then A is singular.
%
%    If N is even, then A is nonsingular.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, integer KEY, a positive value that selects the data.
%
%    Output, real A(N,N), the matrix.
%
  seed = key;
  [ a, seed ] = r8mat_uniform_01 ( n, n, seed );

  for i = 1 : n
    a(i,i) = 0.0;
    for j = i + 1 : n
      if ( 0.5 < a(i,j) )
        a(i,j) = + 1.0;
      else
        a(i,j) = - 1.0;
      end
      a(j,i) = - a(i,j);
    end
  end

  return
end
