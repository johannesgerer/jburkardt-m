function a = tris ( m, n, x, y, z )

%*****************************************************************************80
%
%% TRIS returns the tridiagonal scalar matrix.
%
%  Formula:
%
%    if ( J = I-1 )
%      A(I,J) = X
%    elseif ( J = I )
%      A(I,J) = Y
%    elseif ( J = I + 1 )
%      A(I,J) = Z
%    else
%      A(I,J) = 0
%
%  Example:
%
%    M = 5, N = 5, X = 1, Y = 2, Z = 3
%
%    2 3 0 0 0
%    1 2 3 0 0
%    0 1 2 3 0
%    0 0 1 2 3
%    0 0 0 1 2
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is banded, with bandwidth 3.
%
%    A is Toeplitz: constant along diagonals.
%
%    If Y is not zero, then for A to be singular, it must be the case that
%
%      0.5 * Y / sqrt ( X * Z ) < 1
%
%    and
%
%      cos (K*PI/(N+1)) = - 0.5 * Y / sqrt ( X * Z ) for some 1 <= K <= N.
%
%    If Y is zero, then A is singular when N is odd, or if X or Z is zero.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A has eigenvalues
%
%      LAMBDA(I) = Y + 2 * sqrt(X*Z) * COS(I*PI/(N+1))
%
%    The eigenvalues will be complex if X * Z < 0.
%
%    If X = Z, the matrix is symmetric.
%
%    As long as X and Z are nonzero, the matrix is irreducible.
%
%    If X = Z = -1, and Y = 2, the matrix is a symmetric, positive
%    definite M matrix, the negative of the second difference matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Todd,
%    Basic Numerical Mathematics,
%    Volume 2: Numerical Algebra,
%    Academic Press, 1978, page 155.
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Input, real X, Y, Z, the scalars that define A.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n

      if ( j == i - 1 )
        a(i,j) = x;
      elseif ( j == i )
        a(i,j) = y;
      elseif ( j == i + 1 )
        a(i,j) = z;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
