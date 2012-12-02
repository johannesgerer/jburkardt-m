function polpak_test054 ( )

%*****************************************************************************80
%
%% TEST054 tests LAGUERRE_POLY, LAGUERRE_POLYNOMIAL_VALUES.
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
  fprintf ( 1, 'TEST054:\n' );
  fprintf ( 1, '  LAGUERRE_POLY evaluates the Laguerre polynomial.\n' );
  fprintf ( 1, '  LAGUERRE_POLYNOMIAL_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      X        Exact F       L(N)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = laguerre_polynomial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = laguerre_poly ( n, x );

    fprintf ( 1, '  %6d  %6f  %12f  %12f\n', n, x, fx, fx2(n+1) );

  end

  return
end
