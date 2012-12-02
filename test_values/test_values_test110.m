function test_values_test110 ( )

%*****************************************************************************80
%
%% TEST110 demonstrates the use of NEGATIVE_BINOMIAL_CDF_VALUES.
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
  fprintf ( 1, 'TEST110:\n' );
  fprintf ( 1, '  NEGATIVE_BINOMIAL_CDF_VALUES stores values of\n' );
  fprintf ( 1, '  the Negative Binomial Cumulative Density Function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     F     S         P         NBN_CDF(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, f, s, p, cdf ] = negative_binomial_cdf_values ( n_data );

    if ( n_data == 0 )
      break;
    end

    fprintf ( 1, '  %4d  %4d  %12f  %24.16f\n', f, s, p, cdf );

  end

  return
end
