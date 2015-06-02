function a = pei ( alpha, n )

%*****************************************************************************80
%
%% PEI returns the PEI matrix.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = 1.0 + ALPHA
%    else
%      A(I,J) = 1.0
%
%  Example:
%
%    ALPHA = 2, N = 5
%
%    3 1 1 1 1
%    1 3 1 1 1
%    1 1 3 1 1
%    1 1 1 3 1
%    1 1 1 1 3
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A is positive definite for 0 < ALPHA.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is a circulant matrix: each row is shifted once to get the next row.
%
%    A is singular if and only if ALPHA = 0 or ALPHA = -N.
%
%    A becomes more ill-conditioned as ALPHA approaches 0.
%
%    The condition number under the spectral norm is 
%      abs ( ( ALPHA + N ) / ALPHA )
%
%    The eigenvalues of A are
%
%      LAMBDA(1:N-1) = ALPHA
%      LAMBDA(N) = ALPHA + N
%
%    A has constant row sum of ALPHA + N.
%
%    Because it has a constant row sum of ALPHA + N,
%    A has an eigenvalue of ALPHA + N, and
%    a (right) eigenvector of ( 1, 1, 1, ..., 1 ).
%
%    A has constant column sum of ALPHA + N.
%
%    Because it has a constant column sum of ALPHA + N,
%    A has an eigenvalue of ALPHA + N, and
%    a (left) eigenvector of ( 1, 1, 1, ..., 1 ).
%
%    The eigenvectors are:
%
%      V1 = 1 / sqrt ( N )       * ( 1, 1, 1, ... , 1 )
%      VR = 1 / sqrt ( R * (R-1) ) * ( 1, 1, 1, ... 1, -R+1, 0, 0, 0, ... 0 )
%
%    where the "-R+1" occurs at index R.
%
%    det ( A ) = ALPHA**(N-1) * ( N + ALPHA ).
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Morris Newman, John Todd,
%    Example A3,
%    The evaluation of matrix inversion programs,
%    Journal of the Society for Industrial and Applied Mathematics,
%    Volume 6, Number 4, pages 466-476, 1958.
%
%    ML Pei,
%    A test matrix for inversion procedures,
%    Communications of the ACM,
%    Volume 5, 1962, page 508.
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
%    Input, real ALPHA, the scalar that defines the Pei matrix.  A
%    typical value of ALPHA is 1.0.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      if ( i == j )
        a(i,j) = 1.0 + alpha;
      else
        a(i,j) = 1.0;
      end

    end

  end

  return
end
