function polpak_test049 ( )

%*****************************************************************************80
%
%% POLPAK_TEST049 tests JACOBI_POLY, JACOBI_POLY_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLPAK_TEST049:\n' );
  fprintf ( 1, '  JACOBI_POLY_VALUES returns values of \n' );
  fprintf ( 1, '  the Jacobi polynomial.\n' );
  fprintf ( 1, '  JACOBI_POLY computes values of \n' );
  fprintf ( 1, '  the Jacobi polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N       A       B      X       JPV      JACOBI\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, a, b, x, fx ] = jacobi_poly_values ( n_data );

    if ( n_data == 0 )
      break
    end

    c = jacobi_poly ( n, a, b, x );
    fx2 = c(n+1);

    fprintf ( 1, '  %6d  %8f  %8f  %8f  %12f  %12f\n', n, a, b, x, fx, fx2 );

  end

  return
end
