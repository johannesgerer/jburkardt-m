function a = diagonal ( m, n, x )

%*****************************************************************************80
%
%% DIAGONAL returns the DIAGONAL matrix.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = X(I)
%    else
%      A(I,J) = 0
%
%  Example:
%
%    M = 5, N = 5, X = ( 1, 2, 3, 4, 5 )
%
%    1 0 0 0 0
%    0 2 0 0 0
%    0 0 3 0 0
%    0 0 0 4 0
%    0 0 0 0 5
%
%  Square Properties:
%
%    A is banded, with bandwidth 1.
%
%    A is nonsingular if, and only if, each X(I) is nonzero.
%
%    The inverse of A is a diagonal matrix with diagonal values 1/X(I).
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    LAMBDA(1:N) = X(1:N).
%
%    The matrix of eigenvectors of A is the identity matrix.
%
%    det ( A ) = product ( 1 <= I <= N ) X(I).
%
%    Because A is diagonal, it has property A (bipartite).
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Input, real X(min(M,N)), the diagonal entries of A.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );

  for i = 1 : m
    for j = 1 : n

      if ( i == j )
        a(i,j) = x(i);
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
