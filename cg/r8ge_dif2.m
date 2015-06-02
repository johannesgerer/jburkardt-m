function a = r8ge_dif2 ( m, n )

%*****************************************************************************80
%
%% R8GE_DIF2 returns the DIF2 matrix in R8GE format.
%
%  Example:
%
%    N = 5
%
%    2 -1  .  .  .
%   -1  2 -1  .  .
%    . -1  2 -1  .
%    .  . -1  2 -1
%    .  .  . -1  2
%
%  Properties:
%
%    A is banded, with bandwidth 3.
%
%    A is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is a special case of the TRIS or tridiagonal scalar matrix.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
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
%    A is positive definite.
%
%    A is an M matrix.
%
%    A is weakly diagonally dominant, but not strictly diagonally dominant.
%
%    A has an LU factorization A = L * U, without pivoting.
%
%      The matrix L is lower bidiagonal with subdiagonal elements:
%
%        L(I+1,I) = -I/(I+1)
%
%      The matrix U is upper bidiagonal, with diagonal elements
%
%        U(I,I) = (I+1)/I
%
%      and superdiagonal elements which are all -1.
%
%    A has a Cholesky factorization A = L * L', with L lower bidiagonal.
%
%      L(I,I) =    sqrt ( (I+1) / I )
%      L(I,I-1) = -sqrt ( (I-1) / I )
%
%    The eigenvalues are
%
%      LAMBDA(I) = 2 + 2 * COS(I*PI/(N+1))
%                = 4 SIN^2(I*PI/(2*N+2))
%
%    The corresponding eigenvector X(I) has entries
%
%       X(I)(J) = sqrt(2/(N+1)) * sin ( I*J*PI/(N+1) ).
%
%    Simple linear systems:
%
%      x = (1,1,1,...,1,1),   A*x=(1,0,0,...,0,1)
%
%      x = (1,2,3,...,n-1,n), A*x=(0,0,0,...,0,n+1)
%
%    det ( A ) = N + 1.
%
%    The value of the determinant can be seen by induction,
%    and expanding the determinant across the first row:
%
%      det ( A(N) ) = 2 * det ( A(N-1) ) - (-1) * (-1) * det ( A(N-2) )
%                = 2 * N - (N-1)
%                = N + 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2000
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969,
%    ISBN: 0882756494,
%    LC: QA263.68
%
%    Morris Newman, John Todd,
%    Example A8,
%    The evaluation of matrix inversion programs,
%    Journal of the Society for Industrial and Applied Mathematics,
%    Volume 6, Number 4, pages 466-476, 1958.
%
%    John Todd,
%    Basic Numerical Mathematics,
%    Volume 2: Numerical Algebra,
%    Birkhauser, 1980,
%    ISBN: 0817608117,
%    LC: QA297.T58.
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
%    Input, integer M, N, the order of the matrix.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros(m,n);

  for j = 1 : n
    for i = 1 : m

      if ( j == i - 1 )
        a(i,j) = -1.0;
      elseif ( j == i )
        a(i,j) = 2.0;
      elseif ( j == i + 1 )
        a(i,j) = -1.0;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
