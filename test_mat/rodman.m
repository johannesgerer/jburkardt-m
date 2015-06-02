function a = rodman ( m, n, alpha )

%*****************************************************************************80
%
%% RODMAN returns the RODMAN matrix.
%
%  Formula:
%
%    If ( I = J )
%      A(I,J) = 1
%    else
%      A(I,J) = ALPHA
%
%  Example:
%
%    M = 5, N = 5, ALPHA = 2
%
%    1 2 2 2 2
%    2 1 2 2 2
%    2 2 1 2 2
%    2 2 2 1 2
%    2 2 2 2 1
%
%  Properties:
%
%    A is a special case of the combinatorial matrix.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is a circulant matrix: each row is shifted once to get the next row.
%
%    A has constant row sum.
%
%    Because it has a constant row sum of 1+(N-1)*ALPHA,
%    A has an eigenvalue of 1+(N-1)*ALPHA, and
%    a (right) eigenvector of ( 1, 1, 1, ..., 1 ).
%
%    A has constant column sum.
%
%    Because it has a constant column sum of 1+(N-1)*ALPHA,
%    A has an eigenvalue of 1+(N-1)*ALPHA, and
%    a (left) eigenvector of ( 1, 1, 1, ..., 1 ).
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
%    A is positive definite for ALPHA < 1.
%
%    The eigenvalues and eigenvectors of A are:
%
%      For I = 1 to N-1:
%
%        LAMBDA(I) = 1 - ALPHA
%        V(I) = ( - sum ( 2 <= J <= N ) X(J), X(2), X(3), ..., X(N) )
%
%      For I = N:
%
%        LAMBDA(I) = 1 + ALPHA * ( N - 1 )
%        V(I) = ( 1, 1, 1, ..., 1 )
%
%    det ( A ) = ( 1 - ALPHA )^(N-1) * ( 1 + ALPHA * ( N - 1 ) ).
%
%    A is nonsingular if ALPHA is not 1, and ALPHA is not -1/(N-1).
%
%    The inverse of A is known.
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
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
%    Input, integer M, N, the order of A.
%
%    Input, real ALPHA, the parameter.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );

  a(1:m,1:n) = alpha;

  for i = 1 : min ( m, n )
    a(i,i) = 1.0;
  end

  return
end
