function lobatto_polynomial_values_test ( )

%*****************************************************************************80
%
%% LOBATTO_POLYNOMIAL_VALUES_TEST demonstrates the use of LOBATTO_POLYNOMIAL_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LOBATTO_POLYNOMIAL_VALUES_TEST:\n' );
  fprintf ( 1, '  LOBATTO_POLYNOMIAL_VALUES stores values of\n' );
  fprintf ( 1, '  the completed Lobatto polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N    X            Lo(N)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = lobatto_polynomial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %12f  %24.16f\n',  n, x, fx );

  end

  return
end
