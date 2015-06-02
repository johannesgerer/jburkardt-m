function a = minij ( m, n )

%*****************************************************************************80
%
%% MINIJ returns the MINIJ matrix.
%
%  Formula:
%
%    A(I,J) = min ( I, J )
%
%  Example:
%
%    N = 5
%
%    1 1 1 1 1
%    1 2 2 2 2
%    1 2 3 3 3
%    1 2 3 4 4
%    1 2 3 4 5
%
%  Properties:
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
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
%    The eigenvalues of A are
%
%      LAMBDA(I) = 0.5 / ( 1 - cos ( ( 2 * I - 1 ) * pi / ( 2 * N + 1 ) ) ),
%
%    For N = 12, the characteristic polynomial is
%      P(X) = X^12 - 78 X^11 + 1001 X^10 - 5005 X^9 + 12870 X^8
%        - 19448 X^7 + 18564 X^6 - 11628 X^5 + 4845 X^4 - 1330 X^3
%        + 231 X^2 - 23 X + 1.
%
%    (N+1)*ONES(N) - A also has a tridiagonal inverse.
%
%    Gregory and Karney consider the matrix defined by
%
%      B(I,J) = N + 1 - MAX(I,J)
%
%    which is equal to the MINIJ matrix, but with the rows and
%    columns reversed.
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    Example 3.12, Example 4.14,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969, page 41, page 74, 
%    LC: QA263.G68.
%
%    Daniel Rutherford,
%    Some continuant determinants arising in physics and chemistry II,
%    Proceedings of the Royal Society Edinburgh,
%    Volume 63, A, 1952, pages 232-241.
%
%    John Todd,
%    Basic Numerical Mathematics, Vol. 2: Numerical Algebra,
%    Academic Press, 1977, page 158.
%
%    Joan Westlake,
%    A Handbook of Numerical Matrix Inversion and Solution of 
%    Linear Equations,
%    John Wiley, 1968,
%    ISBN13: 978-0471936756,
%    LC: QA263.W47.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns 
%    of the matrix.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n
      a(i,j) = min ( i, j );
    end
  end

  return
end
