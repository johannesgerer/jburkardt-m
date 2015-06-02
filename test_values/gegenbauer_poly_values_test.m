function gegenbauer_poly_values_test ( )

%*****************************************************************************80
%
%% GEGENBAUER_POLY_VALUES_TEST demonstrates the use of GEGENBAUER_POLY_VALUES.
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
  fprintf ( 1, 'GEGENBAUER_POLY_VALUES_TEST:\n' );
  fprintf ( 1, '  GEGENBAUER_POLY_VALUES returns values of\n' );
  fprintf ( 1, '  the Gegenbauer polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N       A       X       G(N,A)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, a, x, fx ] = gegenbauer_poly_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %6d  %10f  %10f  %24.16f\n', n, a, x, fx );

  end

  return
end
