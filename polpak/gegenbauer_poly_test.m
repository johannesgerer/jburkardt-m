function gegenbauer_poly_test ( )

%*****************************************************************************80
%
%% GEGENBAUER_POLY_TEST tests GEGENBAUER_POLY.
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
  fprintf ( 1, 'GEGENBAUER_POLY_TEST:\n' );
  fprintf ( 1, '  GEGENBAUER_POLY computes values of \n' );
  fprintf ( 1, '    the Gegenbauer polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N       A       X       GPV      GEGENBAUER\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, a, x, fx ] = gegenbauer_poly_values ( n_data );

    if ( n_data == 0 )
      break
    end

    c = gegenbauer_poly ( n, a, x );
    fx2 = c(n+1);

    fprintf ( 1, '  %6d  %8f  %8f  %12f  %12f\n', n, a, x, fx, fx2 );

  end

  return
end
