function test_values_test158 ( )

%*****************************************************************************80
%
%% TEST158 demonstrates the use of WEIBULL_CDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST158:\n' );
  fprintf ( 1, '  WEIBULL_CDF_VALUES stores values of\n' );
  fprintf ( 1, '  the Weibull Cumulative Density Function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Alpha     Beta          X                  CDF(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, alpha, beta, x, fx ] = weibull_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %12f  %24.16f\n', alpha, beta, x, fx );

  end

  return
end
