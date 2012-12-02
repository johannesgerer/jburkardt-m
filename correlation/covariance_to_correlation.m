function [ c, sigma ] = covariance_to_correlation ( n, k )

%*****************************************************************************80
%
%% COVARIANCE_TO_CORRELATION: correlation matrix from a covariance matrix.
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
%    Input, real K(N,N), the covariance matrix.
%
%    Output, real C(N,N), the correlation matrix.
%
%    Output, real SIGMA(N), the standard deviations.
%
  tol = sqrt ( eps );
%
%  K must be symmetric.
%
  error_frobenius = r8mat_is_symmetric ( n, n, k );

  if ( tol < error_frobenius )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COVARIANCE_TO_CORRELATION - Fatal error!\n' );
    fprintf ( 1, '  Input matrix K fails symmetry test with error %g\n', error_frobenius );
    error ( 'COVARIANCE_TO_CORRELATION - Fatal error!' );
  end
%
%  It must be the case that K(I,J)^2 <= K(I,I) * K(J,J).
%
  error_max = 0.0;
  for i = 1 : n
    for j = i + 1 : n
      error_max = max ( error_max, k(i,j)^2 - k(i,i) * k(j,j) );
    end
  end

  if ( tol < error_max )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COVARIANCE_TO_CORRELATION - Fatal error!\n' );
    fprintf ( 1, '  Input matrix K fails K(I,J)^2 <= K(I,I)*K(J,J)\n' );
    error ( 'COVARIANCE_TO_CORRELATION - Fatal error!' );
  end
%
%  Get the diagonal.
%
  sigma = zeros ( n, 1 );
  for i = 1 : n
    sigma(i) = k(i,i);
  end
%
%  Ensure the diagonal is positive.
%
  sigma_min = min ( sigma(1:n) );

  if ( sigma_min <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COVARIANCE_TO_CORRELATION - Fatal error!\n' );
    fprintf ( 1, '  Input matrix K has nonpositive diagonal entry = %g\n', sigma_min );
    error ( 'COVARIANCE_TO_CORRELATION - Fatal error!' );
  end
%
%  Convert from variance to standard deviation.
%
  sigma(1:n) = sqrt ( sigma(1:n) );
%
%  Form C.
%
  c(1:n,1:n) = diag ( 1.0 ./ sigma(1:n) ) * k(1:n,1:n) * diag ( 1.0 ./ sigma(1:n) );

  return
end

