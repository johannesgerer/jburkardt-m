function a = one ( m, n )

%*****************************************************************************80
%
%% ONE returns the ONE matrix.
%
%  Discussion:
%
%    The matrix is sometimes symbolized by "J".
%
%  Example:
%
%    N = 5
%
%    1 1 1 1 1
%    1 1 1 1 1
%    1 1 1 1 1
%    1 1 1 1 1
%    1 1 1 1 1
%
%  Properties:
%
%    Every entry of A is 1.
%
%    A is symmetric.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is Hankel: constant along antidiagonals.
%
%    A is a circulant matrix: each row is shifted once to get the next row.
%
%    A has constant row sums.
%
%    A has constant column sums.
%
%    If 1 < N, A is singular.
%
%    If 1 < N, det ( A ) = 0.
%
%    LAMBDA(1:N-1) = 0
%    LAMBDA(N) = N
%
%    The eigenvector associated with LAMBDA = N is ( 1, 1, ..., 1 ).
%
%    A * A = N * A
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Output, real A(M,N), the matrix.
%
  a = ones ( m, n );

  return
end
