function correlation_test04 ( )

%*****************************************************************************80
%
%% CORRELATION_TEST04 converts between covariance and correlation matrices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CORRELATION_TEST04\n' );
  fprintf ( 1, '  Convert between a correlation and a covariance matrix.\n' );

  n = 5;
  k = minij ( n, n );
  r8mat_print ( n, n, k, '  Covariance matrix K:' );

  [ c, sigma ] = covariance_to_correlation ( n, k );

  r8mat_print ( n, n, c, '  Correlation matrix C:' );

  r8vec_print ( n, sigma, '  Variances:' );

  k2 = correlation_to_covariance ( n, c, sigma );

  r8mat_print ( n, n, k2, '  Recovered covariance matrix K2:' );

  return
end



