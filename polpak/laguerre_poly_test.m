function laguerre_poly_test ( )

%*****************************************************************************80
%
%% LAGUERRE_POLY_TEST tests LAGUERRE_POLY.
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
  fprintf ( 1, 'LAGUERRE_POLY_TEST:\n' );
  fprintf ( 1, '  LAGUERRE_POLY evaluates the Laguerre polynomial.\n' );
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
