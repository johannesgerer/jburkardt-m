function a = anticirculant ( m, n, x )

%*****************************************************************************80
%
%% ANTICIRCULANT returns the ANTICIRCULANT matrix.
%
%  Formula:
%
%    K = 1 + mod ( J + I - 2, N )
%    A(I,J) = X(K)
%
%  Example:
%
%    M = 4, N = 5, X = ( 1, 2, 3, 4, 5 )
%
%    1  2  3  4  5
%    2  3  4  5  1
%    3  4  5  1  2
%    4  5  1  2  3
%
%    M = 5, N = 4, X = ( 1, 2, 3, 4 )
%
%    1  2  3  4
%    2  3  4  5
%    3  4  5  1
%    4  5  1  2
%    1  2  3  4
%
%  Rectangular Properties:
%
%    A is integral: int ( A ) = A.
%
%    A is a special Hankel matrix in which the diagonals "wrap around".
%
%  Square Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Input, real X(N), the vector that defines A.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );
  
  for i = 1 : m
    for j = 1 : n

      k = 1 + mod ( j + i - 2, n );
      a(i,j) = x(k);

    end
  end

  return
end
