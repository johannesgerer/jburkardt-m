function a = covar ( n, b, a )

%*****************************************************************************80
%
%% COVAR returns the covariance matrix for a square nonsingular matrix.
%
%  Discussion:
%
%    This routine will not compute the covariance matrix for the more
%    general case of a rectangular matrix, nor of a matrix not of
%    full rank.
%
%  Formula:
%
%    A = inverse ( B' * B ).
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    A is positive definite.
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
%    Input, integer N, the order of B.
%
%    Input/output, real B(N,N), on input, the matrix whose
%    covariance matrix is desired.  On output, B has been
%    replaced by factorization information.
%
%    Output, real A(N,N), the covariance matrix of B.
%

%
%  Factor the matrix B.
%
  [ b, pivot, ierror ] = r8mat_gefa ( b, n );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COVAR - Warning!\n' );
    fprintf ( 1, '  The matrix B is singular.\n' );
    a(1:n,1:n) = 0.0;
    error ( 'COVAR - Fatal error!' );
  end
%
%  Solve for A by solving the equations ( B' * B ) * A = I
%  one column at a time.
%
  a = identity ( n, n );

  for j = 1 : n
%
%  Solve B' * Y = Z
%
    job = 1;
    a(1:n,j) = r8mat_gesl ( b, n, pivot, a(1:n,j), job );
%
%  Solve B * X = Y
%
    job = 0;
    a(1:n,j) = r8mat_gesl ( b, n, pivot, a(1:n,j), job );

  end

  return
end
