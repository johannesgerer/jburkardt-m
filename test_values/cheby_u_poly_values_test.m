function cheby_u_poly_values_test ( )

%*****************************************************************************80
%
%% CHEBY_U_POLY_VALUES_TEST demonstrates the use of CHEBY_U_POLY_VALUES.
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
  fprintf ( 1, 'CHEBY_U_POLY_VALUES_TEST:\n' );
  fprintf ( 1, '  CHEBY_U_POLY_VALUES returns values of\n' );
  fprintf ( 1, '  the Chebyshev U polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N       X      U(N)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = cheby_u_poly_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %8f  %24.16f\n', n, x, fx );

  end

  return
end
