function test_values_test0395 ( )

%*****************************************************************************80
%
%% TEST0395 demonstrates the use of BETA_NONCENTRAL_CDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0395:\n' );
  fprintf ( 1, '  BETA_NONCENTRAL_CDF_VALUES stores values of\n' );
  fprintf ( 1, '  the noncentral BETA CDF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        A             B             LAMBDA        X               FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, lambda, x, fx ] = beta_noncentral_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %12f  %12f  %24.16f\n', a, b, lambda, x, fx );

  end

  return
end
