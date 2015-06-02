function cheby_u_poly_test ( )

%*****************************************************************************80
%
%% CHEBY_U_POLY_TEST tests CHEBY_U_POLY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2015
%
%  Author:
%
%    John Burkardt
%
  n_max = 12;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBY_U_POLY_TEST:\n' );
  fprintf ( 1, '  CHEBY_U_POLY evaluates the Chebyshev T polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      X        Exact F       U(N)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = cheby_u_poly_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = cheby_u_poly ( 1, n, x );

    fprintf ( 1, '  %6d  %8f  %12f  %12f\n', n, x, fx, fx2(n+1) );

  end

  return
end
