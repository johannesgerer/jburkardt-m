function a = kms ( alpha, m, n )

%*****************************************************************************80
%
%% KMS returns the Kac-Murdock-Szego matrix.
%
%  Formula:
%
%    A(I,J) = ALPHA**abs ( I - J )
%
%  Example:
%
%    ALPHA = 2, N = 5
%
%     1  2  4  8  16
%     2  1  2  4   8
%     4  2  1  2   4
%     8  4  2  1   2
%    16  8  4  2   1
%
%    ALPHA = 1/2, N = 5
%
%     1   1/2  1/4  1/8  1/16
%    1/2   1   1/2  1/4  1/8
%    1/4  1/2   1   1/2  1/4
%    1/8  1/4  1/2   1   1/2
%    1/16 1/8  1/4  1/2   1
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
%    A has an L*D*L' factorization, with L being the inverse
%    of the transpose of the matrix with 1's on the diagonal and
%    -ALPHA on the superdiagonal and zero elsewhere, and
%    D(I,I) = (1-ALPHA**2) except that D(1,1)=1.
%
%    det ( A ) = ( 1 - ALPHA**2 )**(N-1).
%
%    The inverse of A is tridiagonal.
%
%    A is positive definite if and only if 0 < abs ( ALPHA ) < 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    William Trench,
%    Numerical solution of the eigenvalue problem for Hermitian
%    Toeplitz matrices,
%    SIAM Journal on Matrix Analysis and Applications,
%    Volume 10, Number 2, April 1989, pages 135-146.
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines A.  
%    A typical value is 0.5.
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n

      if ( alpha == 0.0 & i == j )
        a(i,j) = 1.0
      else
        a(i,j) = alpha ^ ( abs ( i - j ) );
      end

    end
  end

  return
end
