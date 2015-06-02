function a = chow ( alpha, beta, m, n )

%*****************************************************************************80
%
%% CHOW returns the CHOW matrix.
%
%  Discussion:
%
%    By making ALPHA small compared with BETA, the eigenvalues can
%    all be made very close to BETA, and this is useful as a test
%    of eigenvalue computing routines.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = ALPHA + BETA
%    else if ( J <= I+1 ) then
%      A(I,J) = ALPHA^(I+1-J)
%    else
%      A(I,J) = 0
%
%  Example:
%
%    ALPHA = 2, BETA = 3, M = 5, N = 5
%
%     5  1  0  0  0
%     4  5  1  0  0
%     8  4  5  1  0
%    16  8  4  5  1
%    32 16  8  4  5
%
%    ALPHA = ALPHA, BETA = BETA, M = 5, N = 5
%
%    ALPHA+BETA 1          0          0          0
%    ALPHA^2    ALPHA+BETA 1          0          0
%    ALPHA^3    ALPHA^2    ALPHA+BETA 1          0
%    ALPHA^4    ALPHA^3    ALPHA^2    ALPHA+BETA 1
%    ALPHA^5    ALPHA^4    ALPHA^3    ALPHA^2    ALPHA+BETA
%
%  Rectangular Properties:
%
%    A is Toeplitz: constant along diagonals.
%
%    A is lower Hessenberg.
%
%  Square Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    If ALPHA is 0.0, then A is singular if and only if BETA is 0.0.
%
%    If BETA is 0.0, then A will be singular if 1 < N.
%
%    If BETA is 0.0 and N = 1, then A will be singular if ALPHA is 0.0.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    For 1 <= I < N-(N+1)/2,
%
%      LAMBDA(I) = BETA + 4 * ALPHA * cos ( i * pi / ( N+2 ) )^2,
%
%    For N-(N+1)/2+1 <= I <= N
%
%      LAMBDA(I) = BETA
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    TS Chow,
%    A class of Hessenberg matrices with known eigenvalues and inverses,
%    SIAM Review,
%    Volume 11, Number 3, 1969, pages 391-395.
%
%    Graeme Fairweather,
%    On the eigenvalues and eigenvectors of a class of Hessenberg matrices,
%    SIAM Review,
%    Volume 13, Number 2, 1971, pages 220-221.
%
%  Parameters:
%
%    Input, real ALPHA, the ALPHA value.  A typical value is 1.0.
%
%    Input, real BETA, the BETA value.  A typical value is 0.0.
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );

  for i = 1 : m
    for j = 1 : n

      if ( i == j-1 )
        a(i,j) = 1.0;
      elseif ( i == j )
        a(i,j) = alpha + beta;
      elseif ( j+1 <= i )
        a(i,j) = alpha^( i + 1 - j );
      else
        a(i,j) = 0.0;
      end

    end

  end

  return
end
