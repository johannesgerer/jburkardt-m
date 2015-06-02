function a = dif2cyclic ( n )

%*****************************************************************************80
%
%% DIF2CYCLIC returns the DIF2CYCLIC matrix.
%
%  Example:
%
%    N = 5
%
%    2 -1  .  . -1
%   -1  2 -1  .  .
%    . -1  2 -1  .
%    .  . -1  2 -1
%   -1  .  . -1  2
%
%  Square Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A is centrosymmetric: A(I,J) = A(N+1-I,N+1-J).
%
%    A is a circulant: each row is shifted once to get the next row.
%
%    A is (weakly) row diagonally dominant.
%
%    A is (weakly) column diagonally dominant.
%
%    A is singular.
%
%    det ( A ) = 0.
%
%    (1,1,...,1) is a null vector of A.
%
%    A is cyclic tridiagonal.
%
%    A is Toeplitz: constant along diagonals.
%
%    A has constant row sum = 0.
%
%    A has constant column sum = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2007
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

      if ( mod ( n + i - j, n ) == 1 )
        a(i,j) = -1.0;
      elseif ( j == i )
        a(i,j) = 2.0;
      elseif ( mod ( n + j - i, n ) == 1 )
        a(i,j) = -1.0;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
