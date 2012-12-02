function k = correlation_to_covariance ( n, c, sigma )

%*****************************************************************************80
%
%% CORRELATION_TO_COVARIANCE: covariance matrix from a correlation matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real C(N,N), the correlation matrix.
%
%    Input, real SIGMA(N), the standard deviations.
%
%    Output, real K(N,N), the covariance matrix.
%
  tol = sqrt ( eps );
%
%  C must be symmetric.
%
  error_frobenius = r8mat_is_symmetric ( n, n, c );

  if ( tol < error_frobenius )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CORRELATION_TO_COVARIANCE - Fatal error!\n' );
    fprintf ( 1, '  Input matrix C fails symmetry test with error %g\n', error_frobenius );
    error ( 'CORRELATION_TO_COVARIANCE - Fatal error!' );
  end
%
%  The diagonal must be 1.
%
  error_l1 = 0.0;
  for i = 1 : n
    error_l1 = error_l1 + abs ( c(i,i) - 1.0 );
  end
  error_l1 = error_l1 / n;

  if ( tol < error_l1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CORRELATION_TO_COVARIANCE - Fatal error!\n' );
    fprintf ( 1, '  Input matrix C has non-unit diagonal entries.\n' );
    fprintf ( 1, '  Average error is %g\n', error_l1 );
    error ( 'CORRELATION_TO_COVARIANCE - Fatal error!' );
  end
%
%  Off-diagonals must be between -1 and 1.
%
  c_min = min ( min ( c(1:n,1:n) ) );

  if ( c_min < - 1.0 - tol )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CORRELATION_TO_COVARIANCE - Fatal error!\n' );
    fprintf ( 1, '  Input matrix C has entries less than -1.0\n' );
    error ( 'CORRELATION_TO_COVARIANCE - Fatal error!' );
  end

  c_max = max ( max ( c(1:n,1:n) ) );

  if ( 1.0 + tol < c_max )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CORRELATION_TO_COVARIANCE - Fatal error!\n' );
    fprintf ( 1, '  Input matrix C has entries greater than +1.0\n' );
    error ( 'CORRELATION_TO_COVARIANCE - Fatal error!' );
  end
%
%  Form K.
%
  k(1:n,1:n) = diag ( sigma(1:n) ) * c(1:n,1:n) * diag ( sigma(1:n) );

  return
end

