function test_values_test098 ( )

%*****************************************************************************80
%
%% TEST098 demonstrates the use of LAGUERRE_ASSOCIATED_VALUES.
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
  fprintf ( 1, 'TEST098:\n' );
  fprintf ( 1, '  LAGUERRE_ASSOCIATED_VALUES stores values of\n' );
  fprintf ( 1, '  the associated Laguerre function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     M    X             L(N,M)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, m, x, fx ] = laguerre_associated_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %4d  %12f  %24.16f\n', n, m, x, fx );

  end

  return
end
