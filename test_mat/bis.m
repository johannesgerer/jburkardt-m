function a = bis ( alpha, beta, m, n )

%*****************************************************************************80
%
%% BIS returns the BIS matrix.
%
%  Discussion:
%
%    This is a bidiagonal scalar matrix.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = ALPHA
%    else if ( J = I+1 )
%      A(I,J) = BETA
%    else
%      A(I,J) = 0
%
%  Example:
%
%    ALPHA = 7, BETA = 2, M = 5, N = 4
%
%    7  2  0  0
%    0  7  2  0
%    0  0  7  2
%    0  0  0  7
%    0  0  0  0
%
%  Rectangular Properties:
%
%    A is bidiagonal.
%
%    Because A is bidiagonal, it has property A (bipartite).
%
%    A is upper triangular.
%
%    A is banded with bandwidth 2.
%
%    A is Toeplitz: constant along diagonals.
%
%  Square Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is nonsingular if and only if ALPHA is nonzero.
%
%    det ( A ) = ALPHA^N.
%
%    LAMBDA(1:N) = ALPHA.
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
%    27 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, BETA, the scalars which define the
%    diagonal and first superdiagonal of the matrix.
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );
  
  for i = 1 : m
    for j = 1 : n

      if ( j == i )
        a(i,j) = alpha;
      elseif ( j == i + 1 )
        a(i,j) = beta;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
