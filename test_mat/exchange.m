function a = exchange ( m, n )

%*****************************************************************************80
%
%% EXCHANGE returns the EXCHANGE matrix.
%
%  Formula:
%
%    if ( I + J = N + 1 )
%      A(I,J) = 1
%    else
%      A(I,J) = 0
%
%  Example:
%
%    M = 4, N = 5
%
%    0 0 0 0 1
%    0 0 0 1 0
%    0 0 1 0 0
%    0 1 0 0 0
%
%    M = 5, N = 5
%
%    0 0 0 0 1
%    0 0 0 1 0
%    0 0 1 0 0
%    0 1 0 0 0
%    1 0 0 0 0
%
%  Rectangular properties:
%
%    A is integral: int ( A ) = A.
%
%    A is a zero/one matrix.
%
%  Square Properties:
%
%    A is nonsingular.
%
%    A is a permutation matrix.
%
%    A has property A.
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A is a Hankel matrix: constant along anti-diagonals.
%
%    A is involutional: A * A = I.
%
%    A is a square root of the identity matrix.
%
%    A is orthogonal: A' * A = A * A' = I.
%
%    det ( A ) = ( -1 )^(N/2).
%
%    There are N/2 eigenvalues of -1, and (N+1)/2 eigenvalues of 1.
%
%    For each pair of distinct vector indices I1 and I2 that sum to N+1, there
%    is an eigenvector which has a 1 in the I1 and I2 positions and 0 elsewhere,
%    and there is an eigenvector for -1, with a 1 in the I1 position and a -1
%    in the I2 position.  If N is odd, then there is a single eigenvector
%    associated with the index I1 = (N+1)/2, having a 1 in that index and zero
%    elsewhere, associated with the eigenvalue 1.
%
%    The exchange matrix is also called the "counter-identity matrix".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns 
%    of the matrix.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : m
    for j = 1 : n
      if ( i + j == n + 1 )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end
    end
  end

  return
end
