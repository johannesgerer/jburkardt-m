function a = jordan ( alpha, m, n )

%*****************************************************************************80
%
%% JORDAN returns the Jordan block matrix for a single eigenvalue ALPHA.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = ALPHA
%    else if ( I = J-1 )
%      A(I,J) = 1
%    else
%      A(I,J) = 0
%
%  Example:
%
%    ALPHA = 2, M = 5, N = 5
%
%    2  1  0  0  0
%    0  2  1  0  0
%    0  0  2  1  0
%    0  0  0  2  1
%    0  0  0  0  2
%
%  Properties:
%
%    A is upper triangular.
%
%    A is lower Hessenberg.
%
%    A is bidiagonal.
%
%    Because A is bidiagonal, it has property A (bipartite).
%
%    A is banded, with bandwidth 2.
%
%    A is generally not symmetric: A' /= A.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A is nonsingular if and only if ALPHA is nonzero.
%
%    det ( A ) = ALPHA**N.
%
%    LAMBDA(I) = ALPHA.
%
%    A is defective, having only one eigenvector, namely (1,0,0,...,0).
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
%  Parameters:
%
%    Input, real ALPHA, the eigenvalue of A.
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n

      if ( i == j )
        a(i,j) = alpha;
      elseif ( j == i + 1 )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end

