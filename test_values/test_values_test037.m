function test_values_test037 ( )

%*****************************************************************************80
%
%% TEST037 demonstrates the use of BETA_CDF_VALUES.
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
  fprintf ( 1, 'TEST037:\n' );
  fprintf ( 1, '  BETA_CDF_VALUES stores values of\n' );
  fprintf ( 1, '  the BETA CDF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A          B        X            FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, x, fx ] = beta_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %12f  %24.16f\n', a, b, x, fx );

  end

  return
end
