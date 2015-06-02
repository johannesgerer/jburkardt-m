function binomial_cdf_values_test ( )

%*****************************************************************************80
%
%% BINOMIAL_CDF_VALUES_TEST demonstrates the use of BINOMIAL_CDF_VALUES.
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
  fprintf ( 1, 'BINOMIAL_CDF_VALUES_TEST:\n' );
  fprintf ( 1, '  BINOMIAL_CDF_VALUES returns values of\n' );
  fprintf ( 1, '  the Binomial Cumulative Density Function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     A      B        X   CDF(A,B)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, x, fx ] = binomial_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %6d  %8f  %4d  %24.16f\n', a, b, x, fx );

  end

  return
end
