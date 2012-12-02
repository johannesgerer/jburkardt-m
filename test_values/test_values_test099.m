function test_values_test099 ( )

%*****************************************************************************80
%
%% TEST099 demonstrates the use of LAGUERRE_POLYNOMIAL_VALUES.
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
  fprintf ( 1, 'TEST099:\n' );
  fprintf ( 1, '  LAGUERRE_POLYNOMIAL_VALUES stores values of\n' );
  fprintf ( 1, '  the Laguerre polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     X            L(N)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = laguerre_polynomial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %12f  %24.16f\n',  n, x, fx );

  end

  return
end
