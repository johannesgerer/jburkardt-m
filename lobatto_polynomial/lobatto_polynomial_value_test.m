function lobatto_polynomial_value_test ( )

%*****************************************************************************80
%
%% LOBATTO_POLYNOMIAL_VALUE_TEST tests LOBATTO_POLYNOMIAL_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2013
%
%  Author:
%
%    John Burkardt
%
  m = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LOBATTO_POLYNOMIAL_VALUE_TEST:\n' );
  fprintf ( 1, '  LOBATTO_POLYNOMIAL_VALUES stores values of\n' );
  fprintf ( 1, '  the completed Lobatto polynomial L(n,x).\n' );
  fprintf ( 1, '  LOBATTO_POLYNOMIAL_VALUE evaluates the completed Lobatto polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                                       Tabulated                 Computed\n' );
  fprintf ( 1, '     N        X                        L(N,X)                    L(N,X)        Error\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx1 ] = lobatto_polynomial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    l = lobatto_polynomial_value ( m, n, x );
    fx2 = l(1,n);

    e = fx1 - fx2;

    fprintf ( 1, '  %4d  %12f  %24g  %24g  %8g\n', n, x, fx1, fx2, e );

  end

  return
end
