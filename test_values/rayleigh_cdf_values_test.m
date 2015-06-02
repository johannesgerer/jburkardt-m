function rayleigh_cdf_values_test ( )

%*****************************************************************************80
%
%% RAYLEIGH_CDF_VALUES_TEST demonstrates the use of RAYLEIGH_CDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RAYLEIGH_CDF_VALUES_TEST:\n' );
  fprintf ( 1, '  RAYLEIGH_CDF_VALUES stores values of\n' );
  fprintf ( 1, '  the Rayleigh CDF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      SIGMA    X            FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, sigma, x, fx ] = rayleigh_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n', sigma, x, fx );

  end

  return
end
