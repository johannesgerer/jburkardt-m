function legendre_polynomial_test01 ( )

%*****************************************************************************80
%
%% LEGENDRE_POLYNOMIAL_TEST01 tests P_POLYNOMIAL_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2012
%
%  Author:
%
%    John Burkardt
%
  m = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_POLYNOMIAL_TEST01:\n' );
  fprintf ( 1, '  P_POLYNOMIAL_VALUES stores values of\n' );
  fprintf ( 1, '  the Legendre polynomial P(n,x).\n' );
  fprintf ( 1, '  P_POLYNOMIAL_VALUE evaluates the polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                        Tabulated                 Computed\n' );
  fprintf ( 1, '     N        X           P(N,X)                    P(N,X)                     Error\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx1 ] = p_polynomial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    v = p_polynomial_value ( m, n, x );
    fx2 = v(1,n+1);

    e = fx1 - fx2;

    fprintf ( 1, '  %4d  %12f  %24g  %24g  %8g\n', n, x, fx1, fx2, e );

  end

  return
end
