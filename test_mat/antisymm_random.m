function a = antisymm_random ( n, key )

%*****************************************************************************80
%
%% ANTISYMM_RANDOM returns the ANTISYMM_RANDOM matrix.
%
%  Discussion:
%
%    ANTISYMM_RANDOM is a random antisymmetric matrix.
%
%  Example:
%
%    N = 5
%
%     0.0000  -0.1096   0.0813   0.9248   -0.0793
%     0.1096   0.0000   0.1830   0.1502    0.8244
%    -0.0813  -0.1830   0.0000   0.0899   -0.2137
%    -0.9248  -0.1502  -0.0899   0.0000   -0.4804
%     0.0793  -0.8244   0.2137   0.4804    0.0000
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
%    If N is odd, then det ( A ) = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 June 2008
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
  a = zeros ( n, n );

  n2 = ( n * ( n - 1 ) ) / 2;
  
  seed = key;
  [ t, seed ] = r8vec_uniform_01 ( n2, seed );

  k = 1;
  for i = 1 : n
    for j = i + 1 : n
      a(i,j) = 2.0 * t(k) - 1.0;
      a(j,i) = - a(i,j);
      k = k + 1;
    end
  end

  return
end

