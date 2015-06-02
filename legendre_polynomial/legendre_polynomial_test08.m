function legendre_polynomial_test08 ( )

%*****************************************************************************80
%
%% LEGENDRE_POLYNOMIAL_TEST08 tests PMN_POLYNOMIAL_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 March 2012
%
%  Author:
%
%    John Burkardt
%
  mm = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_POLYNOMIAL_TEST08:\n' );
  fprintf ( 1, '  PMN_POLYNOMIAL_VALUES stores values of\n' );
  fprintf ( 1, '  the Legendre polynomial Pmn(n,m,x).\n' );
  fprintf ( 1, '  PMN_POLYNOMIAL_VALUE evaluates the polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                                Tabulated                 Computed\n' );
  fprintf ( 1, '     N     M        X           Pmn(N,M,X)                Pmn(N,M,X)             Error\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, m, x, fx1 ] = pmn_polynomial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    v = pmn_polynomial_value ( mm, n, m, x );
    fx2 = v(1,n+1);

    e = fx1 - fx2;

    fprintf ( 1, '  %4d  %4d  %12g  %24g  %24g  %8g\n', n, m, x, fx1, fx2, e );

  end

  return
end
