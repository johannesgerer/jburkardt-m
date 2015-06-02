function legendre_poly_values_test ( )

%*****************************************************************************80
%
%% LEGENDRE_POLY_VALUES_TEST demonstrates the use of LEGENDRE_POLY_VALUES.
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
  fprintf ( 1, 'LEGENDRE_POLY_VALUES_TEST:\n' );
  fprintf ( 1, '  LEGENDRE_POLY_VALUES stores values of\n' );
  fprintf ( 1, '  the Legendre polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N    X             P(N)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = legendre_poly_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %12f  %24.16f\n',  n, x, fx );

  end

  return
end
