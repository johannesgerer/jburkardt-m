function chi_square_noncentral_cdf_values_test ( )

%*****************************************************************************80
%
%% CHI_SQUARE_NONCENTRAL_CDF_VALUES_TEST test CHI_SQUARE_NONCENTRAL_CDF_VALUES.
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
  fprintf ( 1, 'CHI_SQUARE_NONCENTRAL_CDF_VALUES_TEST:\n' );
  fprintf ( 1, '  CHI_SQUARE_NONCENTRAL_CDF_VALUES returns values of\n' );
  fprintf ( 1, '  the noncentral Chi-Squared Cumulative Density Function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X      LAMBDA     DF     CDF\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, lambda, df, fx ] = chi_square_noncentral_cdf_values ( n_data );

    if ( n_data == 0 )
      break;
    end

    fprintf ( 1, '  %10f  %8f  %4d  %24.16e\n', x, lambda, df, fx );

  end

  return
end
