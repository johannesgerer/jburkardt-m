function laguerre_polynomial_values_test ( )

%*****************************************************************************80
%
%% LAGUERRE_POLYNOMIAL_VALUES_TEST demonstrates the use of LAGUERRE_POLYNOMIAL_VALUES.
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
  fprintf ( 1, 'LAGUERRE_POLYNOMIAL_VALUES_TEST:\n' );
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
