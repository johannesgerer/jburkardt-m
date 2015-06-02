function a = trench ( alpha, m, n )

%*****************************************************************************80
%
%% TRENCH returns the TRENCH matrix.
%
%  Discussion:
%
%    Using a small value of ALPHA causes every third leading principal
%    submatrix to be nearly singular.  The standard Levinson algorithm
%    for fast solution of Toeplitz matrices will perform poorly if
%    the leading principal submatrices are poorly conditioned in this way,
%    although the full matrix may have a good condition number.
%
%    A is related to the KMS matrix.
%
%  Formula:
%
%    if I == J
%      A(I,J) = ALPHA
%    else
%      A(I,J) = (1/2)**( abs ( I - J ) - 1 )
%
%  Example:
%
%    ALPHA = 0.01 : n = 5
%
%     0.01  1     1/2  1/4  1/8
%     1     0.01  1    1/2  1/4
%     1/2   1     0.01 1    1/2
%     1/4   1/2   1    0.01 1
%     1/8   1/4   1/2  1    0.01
%
%  Properties:
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
%    A is centrosymmetric: A(I,J) = A(N+1-I,N+1-J).
%
%    If ALPHA = 0, then every third leading principal submatrix
%    is exactly singular.
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Per Christian Hansen, Tony Chan,
%    FORTRAN Subroutines for General Toeplitz Systems,
%    ACM Transactions on Mathematical Software,
%    Volume 18, Number 3, September 1992, pages 256-273.
%
%    William Trench,
%    Numerical solution of the eigenvalue problem for Hermitian
%    Toeplitz matrices,
%    SIAM Journal on Matrix Analysis and Applications,
%    Volume 10, 1989, pages 135-146.
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines A.  For testing
%    Toeplitz solvers, ALPHA should be a small multiple of the
%    machine precision.
%
%    Input, integer M, N, the order of A.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );

  for i = 1 : m
    for j = 1 : n

      if ( i == j )
        a(i,j) = alpha;
      else
        a(i,j) = 1.0 / 2^( abs ( i - j ) - 1 );
      end

    end
  end

  return
end
