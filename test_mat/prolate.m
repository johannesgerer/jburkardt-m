function a = prolate ( alpha, n )

%*****************************************************************************80
%
%% PROLATE returns the PROLATE matrix.
%
%  Formula:
%
%    If ( I == J )
%      A(I,J) = 2 * ALPHA
%    else
%      K = abs ( I - J ) + 1
%      A(I,J) = sin ( 2 * pi * ALPHA * K ) / ( pi * K )
%
%  Example:
%
%    N = 5, ALPHA = 0.25
%
%     0.5        0.0       -0.106103   0.0        0.0636620
%     0.0        0.5        0.0       -0.106103   0.0
%    -0.106103   0.0        0.5        0.0       -0.106103
%     0.0       -0.106103   0.0        0.5        0.0
%     0.0636620  0.0       -0.106103   0.0        0.5
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
%    A is centrosymmetric: A(I,J) = A(N+1-I,N+1-J).
%
%    A is Toeplitz: constant along diagonals.
%
%    If 0 < ALPHA < 0.5, then
%      A is positive definite,
%      the eigenvalues of A are distinct,
%      the eigenvalues lie in (0,1) and cluster around 0 and 1.
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    James Varah,
%    The Prolate Matrix,
%    Linear Algebra and Applications,
%    Volume 187, pages 269-278, 1993.
%
%  Parameters:
%
%    Input, real ALPHA, the parameter.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n

    for j = 1 : n

      if ( i == j )
        a(i,j) = 2.0 * alpha;
      else
        k = abs ( i - j ) + 1;
        angle = 2.0 * pi * alpha * k;
        a(i,j) = sin ( angle ) / ( pi * k );
      end

    end

  end

  return
end
