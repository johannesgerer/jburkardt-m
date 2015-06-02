function test_values_test100 ( )

%*****************************************************************************80
%
%% TEST100 demonstrates the use of LAPLACE_CDF_VALUES.
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
  fprintf ( 1, 'TEST100:\n' );
  fprintf ( 1, '  LAPLACE_CDF_VALUES stores values of\n' );
  fprintf ( 1, '  the Laplace Cumulative Density Function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Mu        Beta          X                  CDF(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, mu, beta, x, fx ] = laplace_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %12f  %24.16f\n', mu, beta, x, fx );

  end

  return
end
