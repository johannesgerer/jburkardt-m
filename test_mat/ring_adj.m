function a = ring_adj ( n )

%*****************************************************************************80
%
%% RING_ADJ returns the ring adjacency matrix.
%
%  Discussion:
%
%    This is the adjacency matrix for a set of points on a circle.
%
%  Example:
%
%    N = 5
%
%    0  1  0  0  1
%    1  0  1  0  0
%    0  1  0  1  0
%    0  0  1  0  1
%    1  0  0  1  0
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    The determinant for N = 1 is 1, for N = 2 is -1, and for 2 < N,
%      mod ( N, 4 ) = 1 ==> det ( A ) =  2
%      mod ( N, 4 ) = 2 ==> det ( A ) = -4
%      mod ( N, 4 ) = 3 ==> det ( A ) =  2
%      mod ( N, 4 ) = 0 ==> det ( A ) =  0
%
%    A is a zero/one matrix.
%
%    A is an adjacency matrix.
%
%    A has a zero diagonal.
%
%    A is cyclic tridiagonal.
%
%    A is a circulant matrix: each row is shifted once to get the next row.
%
%    A has a constant row sum of 2.
%
%    Because it has a constant row sum of 2,
%    A has an eigenvalue of 2, and
%    a (right) eigenvector of ( 1, 1, 1, ..., 1 ).
%
%    A has a constant column sum of 2.
%
%    Because it has a constant column sum of 2,
%    A has an eigenvalue of 2, and
%    a (left) eigenvector of ( 1, 1, 1, ..., 1 ).
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A is centrosymmetric: A(I,J) = A(N+1-I,N+1-J).
%
%    A has an eigenvector of ( 1, 1, 1, ..., 1 ) with eigenvalue of 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n
      if ( j == i + 1 | j == i - 1 | j == i + 1 - n | j == i - 1 + n )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end
    end
  end

  return
end
