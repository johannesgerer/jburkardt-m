function test_values_test093 ( )

%*****************************************************************************80
%
%% TEST093 demonstrates the use of JACOBI_POLY_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST093:\n' );
  fprintf ( 1, '  JACOBI_POLY_VALUES returns values of\n' );
  fprintf ( 1, '  the Jacobi polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N       A       B      X               J(N,A,B)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, a, b, x, fx ] = jacobi_poly_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %6d  %8f  %8f  %10f  %24.16f\n', n, a, b, x, fx );

  end

  return
end
