function polpak_test013 ( )

%*****************************************************************************80
%
%% TEST013 tests BERNSTEIN_POLY, BERNSTEIN_POLY_VALUES.
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
  fprintf ( 1, 'TEST013:\n' );
  fprintf ( 1, '  BERNSTEIN_POLY evaluates the Bernstein polynomials.\n' );
  fprintf ( 1, '  BERNSTEIN_POLY_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N   K    X             Exact         B(N,K)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, k, x, b ] = bernstein_poly_values ( n_data );

    if ( n_data == 0 )
      break
    end

    bvec = bernstein_poly ( n, x );

    fprintf ( 1, '  %2d  %2d  %5f  %12f  %12f\n', n, k, x, b, bvec(k+1) );

  end

  return
end
