function a = circulant2 ( n )

%*****************************************************************************80
%
%% CIRCULANT2 returns the CIRCULANT2 matrix.
%
%  Formula:
%
%    K = 1 + mod ( J-I, N )
%    A(I,J) = K
%
%  Example:
%
%    N = 5
%
%    1  2  3  4  5
%    5  1  2  3  4
%    4  5  1  2  3
%    3  4  5  1  2
%    2  3  4  5  1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is a circulant: each row is shifted once to get the next row.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A commutes with any other circulant.
%
%    A is normal.
%
%    The inverse of A is a circulant matrix.
%
%    The eigenvector matrix is the Fourier matrix.
%
%    If R is an N-th root of unity, that is, R is a complex number such
%    that R**N = 1, then
%
%      Y = 1 + 2*R + 3*R**2 + ... + N*R**(N-1)
%
%    is an eigenvalue of A, with eigenvector
%
%     ( 1, R, R**2, ..., R**(N-1) )
%
%    and left eigenvector
%
%      ( R**(N-1), R**(N-2), ..., R**2, R, 1 ).
%
%    Although there are exactly N distinct roots of unity, the circulant
%    may have repeated eigenvalues, because of the behavior of the polynomial.
%    However, the matrix is guaranteed to have N linearly independent
%    eigenvectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Philip Davis,
%    Circulant Matrices,
%    John Wiley, 1979, QA188.D37.
%
%    Robert Gregory, David Karney,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, New York, 1969, page 22, 
%    LC: QA263.G68.
%
%    Morris Newman, John Todd,
%    The evaluation of matrix inversion programs,
%    Journal of the Society for Industrial and Applied Mathematics,
%    Volume 6, Number 4, pages 466-476, 1958.
%
%    Joan Westlake,
%    Test Matrix A24,
%    A Handbook of Numerical Matrix Inversion and Solution of Linear Equations,
%    John Wiley, 1968.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      k = 1 + i4_modp ( j-i, n );
      a(i,j) = k;

    end
  end

  return
end
