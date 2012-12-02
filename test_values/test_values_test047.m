function test_values_test047 ( )

%*****************************************************************************80
%
%% TEST047 demonstrates the use of CHI_SQUARE_CDF_VALUES.
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
  fprintf ( 1, 'TEST047:\n' );
  fprintf ( 1, '  CHI_SQUARE_CDF_VALUES returns values of\n' );
  fprintf ( 1, '  the Chi-Squared Cumulative Density Function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N       X    CHI_CDF(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, x, fx ] = chi_square_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %8f  %24.16f\n', a, x, fx );

  end

  return
end
