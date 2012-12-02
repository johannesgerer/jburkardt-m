function polpak_test041 ( )

%*****************************************************************************80
%
%% TEST041 tests HERMITE_POLY, HERMITE_POLY_VALUES.
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
  fprintf ( 1, 'TEST041:\n' );
  fprintf ( 1, '  HERMITE_POLY evaluates the Hermite polynomial.\n' );
  fprintf ( 1, '  HERMITE_POLY_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N      X        Exact F       H(N)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = hermite_poly_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = hermite_poly ( n, x );

    fprintf ( 1, '  %6d  %6.2f  %12e  %12e\n', n, x, fx, fx2(n+1) );

  end

  return
end
