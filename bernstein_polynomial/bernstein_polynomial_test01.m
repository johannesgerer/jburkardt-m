function bernstein_polynomial_test01 ( )

%*****************************************************************************80
%
%% BERNSTEIN_POLYNOMIAL_TEST01 tests BERNSTEIN_POLY and BERNSTEIN_POLY_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 July 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BERNSTEIN_POLYNOMIAL_TEST01:\n' );
  fprintf ( 1, '  BERNSTEIN_POLY_01 evaluates the Bernstein polynomials\n' );
  fprintf ( 1, '  based on the interval [0,1].\n' );
  fprintf ( 1, '  BERNSTEIN_POLY_01_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     K     X       Exact         BP01(N,K)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, k, x, b ] = bernstein_poly_01_values ( n_data );

    if ( n_data == 0 )
      break
    end

    bvec = bernstein_poly_01 ( n, x );

    fprintf ( 1, '  %4d  %4d  %7.4f  %14.6g  %14.6g\n', n, k, x, b, bvec(k+1) );

  end

  return
end
