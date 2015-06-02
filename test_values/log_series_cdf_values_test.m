function log_series_cdf_values_test ( )

%*****************************************************************************80
%
%% LOG_SERIES_CDF_VALUES_TEST demonstrates the use of LOG_SERIES_CDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 September 2004
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LOG_SERIES_CDF_VALUES_TEST:\n' );
  fprintf ( 1, '  LOG_SERIES_CDF_VALUES stores values of\n' );
  fprintf ( 1, '  the Log Series Cumulative Density Function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      T       N                 CDF(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, t, n, fx ] = log_series_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %6d  %24.16f\n', t, n, fx );

  end

  return
end
