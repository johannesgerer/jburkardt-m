function a = bab ( n, alpha, beta )

%*****************************************************************************80
%
%% BAB returns the BAB matrix.
%
%  Example:
%
%    N = 5
%    ALPHA = 5, BETA = 2
%
%    5  2  .  .  .
%    2  5  2  .  .
%    .  2  5  2  .
%    .  .  2  5  2
%    .  .  .  2  5
%
%  Properties:
%
%    A is banded, with bandwidth 3.
%
%    A is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is Toeplitz: constant along diagonals.
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    CM da Fonseca, J Petronilho,
%    Explicit Inverses of Some Tridiagonal Matrices,
%    Linear Algebra and Its Applications,
%    Volume 325, 2001, pages 7-21.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real ALPHA, BETA, the parameters.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    a(i,i) = alpha;
  end

  for i = 1 : n - 1
    a(i,i+1) = beta;
    a(i+1,i) = beta;
  end
 
  return
end
