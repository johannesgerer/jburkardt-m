function a = gk316 ( n )

%*****************************************************************************80
%
%% GK316 returns the GK316 matrix.
%
%  Formula:
%
%    if ( I == N )
%      A(I,J) = J
%    elseif ( J == N )
%      A(I,J) = I
%    elseif ( I == J )
%      A(I,J) = 1.0
%    else
%      A(I,J) = 0.0
%
%  Example:
%
%    N = 5
%
%     1  0  0  0  1
%     0  1  0  0  2
%     0  0  1  0  3
%     0  0  0  1  4
%     1  2  3  4  5
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A has property A (the first set is 1:N-1, the second is just N).
%
%    A is integral: int ( A ) = A.
%
%    det ( A ) = - N * ( N + 1 ) * ( 2 * N - 5 ) / 6.
%
%    N-2 eigenvalues are equal to 1, while the remaining eigenvalues
%    are the roots of X**2 - (N+1)*X - N*(N+1)*(2*N-5)/6 = 0.
%
%    A is border-banded.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Aegerter,
%    Construction of a Set of Test Matrices,
%    Communications of the ACM,
%    Volume 2, Number 8, 1959, pages 10-12.
%
%    Robert Gregory, David Karney,
%    Example 3.16, Example 4.15,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, New York, 1969, page 44, page 74,
%    LC: QA263.G68.
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
      if ( i == n )
        a(i,j) = j;
      elseif ( j == n )
        a(i,j) = i;
      elseif ( i == j )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end
    end
  end

  return
end
