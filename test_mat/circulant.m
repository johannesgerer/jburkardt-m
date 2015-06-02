function a = circulant ( m, n, x )

%*****************************************************************************80
%
%% CIRCULANT returns the CIRCULANT matrix.
%
%  Formula:
%
%    K = 1 + mod ( J-I, N )
%    A(I,J) = X(K)
%
%  Example:
%
%    M = 4, N = 4, X = ( 1, 2, 3, 4 )
%
%    1  2  3  4
%    4  1  2  3
%    3  4  1  2
%    2  3  4  1
%
%    M = 4, N = 5, X = ( 1, 2, 3, 4, 5 )
%
%    1  2  3  4  5
%    5  1  2  3  4
%    4  5  1  2  3
%    3  4  5  1  2
%
%    M = 5, N = 4, X = ( 1, 2, 3, 4 )
%
%    1  2  3  4
%    5  1  2  3
%    4  5  1  2
%    3  4  5  1
%    1  2  3  4
%
%  Discussion:
%
%    Westlake lists the following "special" circulants:
%
%      B2, X = ( T^2, 1, 2, ..., T, T+1, T, T-1, ..., 1 ),
%      with T = ( N - 2 ) / 2;
%
%      B3, X = ( N+1, 1, 1, ..., 1 );
%
%      B5, X = ( 1, 2, 3, ..., N ).
%
%  Rectangular Properties:
%
%    The product of two circulant matrices is a circulant matrix.
%
%    The transpose of a circulant matrix is a circulant matrix.
%
%    A circulant matrix C, whose first row is (c1, c2, ..., cn), can be
%    written as a polynomial in the upshift matrix U:
%
%      C = c1 * I + c2 * U + c3 * U**2 + ... + cn * U**n-1.
%
%    A is a circulant: each row is shifted once to get the next row.
%
%  Square Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A commutes with any other circulant matrix.
%
%    A is normal.
%
%    The transpose of A is also a circulant matrix.
%
%    The inverse of A is also a circulant matrix.
%
%    The Fourier matrix is the eigenvector matrix for every circulant matrix.
%
%    Because the Fourier matrix F diagonalizes A, the inverse (or
%    pseudoinverse, if any LAMBDA is zero) can be written
%
%      inverse ( A ) = (F*) * 1/LAMBDA * F
%
%    A is symmetric if, for all I, X(I+1) = X(N-I+1).
%
%    If R is an N-th root of unity, that is, R is a complex number such
%    that R**N = 1, then
%
%      Y = X(1) + X(2)*R + X(3)*R**2 + ... + X(N)*R**(N-1)
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
%    Joan Westlake,
%    Test Matrix A24,
%    A Handbook of Numerical Matrix Inversion and Solution of Linear Equations,
%    John Wiley, 1968.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Input, real X(N), the values in the first row of A.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n

      k = 1 + i4_modp ( j-i, n );
      a(i,j) = x(k);

    end
  end

  return
end
