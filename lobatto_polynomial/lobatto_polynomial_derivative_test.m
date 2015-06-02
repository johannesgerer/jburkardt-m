function lobatto_polynomial_derivative_test ( )

%*****************************************************************************80
%
%% LOBATTO_POLYNOMIAL_DERIVATIVE_TEST tests LOBATTO_POLYNOMIAL_DERIVATIVE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2014
%
%  Author:
%
%    John Burkardt
%
  m = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LOBATTO_POLYNOMIAL_DERIVATIVE_TEST:\n' );
  fprintf ( 1, '  LOBATTO_POLYNOMIAL_DERIVATIVES stores derivatives of\n' );
  fprintf ( 1, '  the completed Lobatto polynomial L(n,x).\n' );
  fprintf ( 1, '  LOBATTO_POLYNOMIAL_DERIVATIVE evaluates the completed Lobatto polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                                       Tabulated                 Computed\n' );
  fprintf ( 1, '     N        X                        L''(N,X)                   L''(N,X)       Error\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx1 ] = lobatto_polynomial_derivatives ( n_data );

    if ( n_data == 0 )
      break
    end

    lp = lobatto_polynomial_derivative ( m, n, x );
    fx2 = lp(1,n);

    e = fx1 - fx2;

    fprintf ( 1, '  %4d  %12f  %24g  %24g  %8g\n', n, x, fx1, fx2, e );

  end

  return
end
