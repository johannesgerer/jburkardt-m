function test_values_test105 ( )

%*****************************************************************************80
%
%% TEST105 demonstrates the use of LOG_NORMAL_CDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST105:\n' );
  fprintf ( 1, '  LOG_NORMAL_CDF_VALUES stores values of\n' );
  fprintf ( 1, '  the Log Normal Cumulative Density Function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Mu        Sigma         X                  CDF(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, mu, sigma, x, fx ] = log_normal_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %12f  %24.16f\n', mu, sigma, x, fx );

  end

  return
end
