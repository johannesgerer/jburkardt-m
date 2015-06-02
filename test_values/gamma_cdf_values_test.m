function gamma_cdf_values_test ( )

%*****************************************************************************80
%
%% GAMMA_CDF_VALUES_TEST demonstrates the use of GAMMA_CDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GAMMA_CDF_VALUES_TEST:\n' );
  fprintf ( 1, '  GAMMA_CDF_VALUES stores values of\n' );
  fprintf ( 1, '  the Gamma CDF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      MU         SIGMA       X            FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, mu, sigma, x, fx ] = gamma_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %12f  %24.16f\n', mu, sigma, x, fx );

  end

  return
end
