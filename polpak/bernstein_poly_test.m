function bernstein_poly_test ( )

%*****************************************************************************80
%
%% BERNSTEIN_POLY_TEST tests BERNSTEIN_POLY.
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
  fprintf ( 1, 'BERNSTEIN_POLY_TEST:\n' );
  fprintf ( 1, '  BERNSTEIN_POLY evaluates the Bernstein polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N   K    X             Exact         B(N,K)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, k, x, b ] = bernstein_poly_01_values ( n_data );

    if ( n_data == 0 )
      break
    end

    bvec = bernstein_poly ( n, x );

    fprintf ( 1, '  %2d  %2d  %5g  %12g  %12g\n', n, k, x, b, bvec(k+1) );

  end

  return
end
