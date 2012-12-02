function a = givens ( m, n )

%*****************************************************************************80
%
%% GIVENS returns the Givens matrix.
%
%  Discussion:
%
%    Note that this is NOT the "Givens rotation matrix".  This
%    seems to be more commonly known as the Moler matrix%
%
%  Formula:
%
%    A(I,J) = 2 * min ( I, J ) - 1
%
%  Example:
%
%    N = 5
%
%    1 1 1 1 1
%    1 3 3 3 3
%    1 3 5 5 5
%    1 3 5 7 7
%    1 3 5 7 9
%
%  Rectangular Properties:
%
%    A is integral: int ( A ) = A.
%
%  Square Properties:
%
%    A is positive definite.
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    The inverse of A is tridiagonal.
%
%    A has a simple Cholesky factorization.
%
%    A has eigenvalues
%
%      LAMBDA(I) = 0.5 * sec ( ( 2 * I - 1 ) * PI / ( 4 * N ) )**2
%
%    The condition number P(A) is approximately 16 N**2 / PI**2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Morris Newman, John Todd,
%    Example A9,
%    The evaluation of matrix inversion programs,
%    Journal of the Society for Industrial and Applied Mathematics,
%    Volume 6, Number 4, pages 466-476, 1958.
%
%    John Todd,
%    Example A9,
%    Basic Numerical Mathematics, Volume 2: Numerical Algebra,
%    Academic Press, New York, 1977, page 1.
%
%    Joan Westlake,
%    Test Matrix A8,
%    A Handbook of Numerical Matrix Inversion and Solution of Linear Equations,
%    John Wiley, 1968.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n
      a(i,j) = 2 * min ( i, j ) - 1;
    end
  end

  return
end
