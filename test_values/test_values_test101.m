function test_values_test101 ( )

%*****************************************************************************80
%
%% TEST101 demonstrates the use of LEGENDRE_ASSOCIATED_VALUES.
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
  fprintf ( 1, 'TEST101:\n' );
  fprintf ( 1, '  LEGENDRE_ASSOCIATED_VALUES stores values of\n' );
  fprintf ( 1, '  the associated Legendre polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     M    X             P(N,M)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, m, x, fx ] = legendre_associated_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %4d  %12f  %24.16f\n', n, m, x, fx );

  end

  return
end
