function a = zero ( m, n )

%*****************************************************************************80
%
%% ZERO returns the zero matrix.
%
%  Formula:
%
%    A(I,J) = 0
%
%  Example:
%
%    M = 4, N = 5
%
%    0 0 0 0 0
%    0 0 0 0 0
%    0 0 0 0 0
%    0 0 0 0 0
%
%  Properties:
%
%    A is integral.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is a Hankel matrix: constant along anti-diagonals.
%
%    A is a circulant matrix: each row is shifted once to get the next row.
%
%    A is an anticirculant matrix.
%
%    A is singular.
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    LAMBDA(1:N) = 0.
%
%    The matrix of eigenvectors of A is I.
%
%    det ( A ) = 0.
%
%    For any vector v, A*v = 0.
%
%    For any matrix B, A*B = B*A = 0.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of the matrix.
%
%    Output, real A(M,N), the matrix.
%
  a(1:m,1:n) = 0.0;

  return
end
