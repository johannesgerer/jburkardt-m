function polpak_test020 ( )

%*****************************************************************************80
%
%% TEST020 tests CHEBY_U_POLY, CHEBY_U_POLY_VALUES.
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
  n_max = 12;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST020:\n' );
  fprintf ( 1, '  CHEBY_U_POLY evaluates the Chebyshev U polynomial.\n' );
  fprintf ( 1, '  CHEBY_U_POLY_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      X        Exact F       U(N)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = cheby_u_poly_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = cheby_u_poly ( n, x );

    fprintf ( 1, '  %6d  %6f  %12f  %12f\n', n, x, fx, fx2(n+1) );

  end

  return
end
