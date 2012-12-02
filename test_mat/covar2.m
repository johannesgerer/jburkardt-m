function a = covar2 ( m, n, b, a )

%*****************************************************************************80
%
%% COVAR2 returns the covariance matrix for a rectangular matrix.
%
%  Discussion:
%
%    M should be at least N, and B has maximal rank N.
%    The covariance matrix is defined as
%
%      A = inverse ( B' * B ).
%
%  Properties:
%
%    A is symmetric: A' = A.
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
%  Parameters:
%
%    Input, integer M, N, the order of B.
%    N <= M is required.
%
%    Input, real B(M,N), the matrix whose covariance matrix 
%    is desired.
%
%    Output, real A(N,N), the covariance matrix of B.
%
%    Output, integer IERROR, error flag.
%    IERROR = 0 for no error,
%    IERROR is nonzero to mean that A is singular.
%
  if ( m < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COVAR2 - Fatal error!\n' );
    fprintf ( 1, '  M < N\n' );o
    error ( 'COVAR2 - Fatal error!' );
  end
%
%  Compute B' * B.
%
  btb(1:n,1:n) = b(1:m,1:n)' * b(1:m,1:n);
%
%  Factor the matrix.
%
  [ btb, pivot, error ] = r8mat_gefa ( btb, n );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COVAR2 - Fatal error!\n' );
    fprintf ( 1, '  The matrix B'' * B does not have full rank.\n' );
    fprintf ( 1, '  This means that B does not have rank N.\n' );
    error ( 'COVAR2 - Fatal error!' );
  end
%
%  Solve for A by solving the equations ( B' * B ) * A = I
%  one column at a time.
%
  a = identity ( n, n );

  job = 0;

  for j = 1 : n
    a(1:n,j) = r8mat_gesl ( btb, n, pivot, a(1:n,j), job );
  end

  return
end
