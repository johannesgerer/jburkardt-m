function laguerre_polynomial_test01 ( )

%*****************************************************************************80
%
%% LAGUERRE_POLYNOMIAL_TEST01 tests L_POLYNOMIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2012
%
%  Author:
%
%    John Burkardt
%
  m = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGUERRE_POLYNOMIAL_TEST01:\n' );
  fprintf ( 1, '  L_POLYNOMIAL_VALUES stores values of\n' );
  fprintf ( 1, '  the Laguerre polynomials.\n' );
  fprintf ( 1, '  L_POLYNOMIAL evaluates the polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                        Tabulated                 Computed\n' );
  fprintf ( 1, '     N        X           L(N,X)                    L(N,X)                     Error\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx1 ] = l_polynomial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    v = l_polynomial ( m, n, x );
    fx2 = v(1,n+1);

    e = fx1 - fx2;

    fprintf ( 1, '  %4d  %12.6g  %24.16g  %24.16g  %8.2g\n', n, x, fx1, fx2, e );

  end

  return
end
