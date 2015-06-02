function legendre_poly_test ( )

%*****************************************************************************80
%
%% LEGENDRE_POLY_TEST tests LEGENDRE_POLY.
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
  fprintf ( 1, 'LEGENDRE_POLY_TEST:\n' );
  fprintf ( 1, '  LEGENDRE_POLY evaluates the Legendre PN function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      X        Exact F       P(N)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = legendre_poly_values ( n_data );

    if ( n_data == 0 )
      break
    end

    [ fx2, fp2 ] = legendre_poly ( n, x );

    fprintf ( 1, '  %6d  %6f  %12f  %12f\n', n, x, fx, fx2(n+1) );

  end

  return
end
