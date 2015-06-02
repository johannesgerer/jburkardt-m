function a = bis_inverse ( alpha, beta, n )

%*****************************************************************************80
%
%% BIS_INVERSE returns the inverse of the BIS matrix.
%
%  Formula:
%
%    if ( I <= J )
%      A(I,J) = (-BETA)^(J-I) / ALPHA^(J+1-I)
%    else
%      A(I,J) = 0
%
%  Example:
%
%    ALPHA = 7.0, BETA = 2.0, N = 4
%
%    0.1429   -0.0408    0.0117   -0.0033
%        0     0.1429   -0.0408    0.0117
%        0          0    0.1429   -0.0408
%        0          0         0    0.1429
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is upper triangular
%
%    A is Toeplitz: constant along diagonals.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    det ( A ) = (1/ALPHA)^N.
%
%    LAMBDA(1:N) = 1 / ALPHA.
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 January 2015
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
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  if ( alpha == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BIS_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The input parameter ALPHA was 0.\n' );
    error ( 'BIS_INVERSE - Fatal error!' );
  end

  for i = 1 : n
    for j = 1 : n

      if ( i <= j )
        a(i,j) = ( -beta )^(j-i) / alpha^(j+1-i);
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
