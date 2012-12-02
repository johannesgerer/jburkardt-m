function laguerre_polynomial_test05 ( )

%*****************************************************************************80
%
%% LAGUERRE_POLYNOMIAL_TEST05 tests LM_POLYNOMIAL.
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
  mm = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGUERRE_POLYNOMIAL_TEST05:\n' );
  fprintf ( 1, '  LM_POLYNOMIAL_VALUES stores values of\n' );
  fprintf ( 1, '  the Laguerre polynomial Lm(n,m,x)\n' );
  fprintf ( 1, '  LM_POLYNOMIAL evaluates the polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                                 Tabulated                 Computed\n' );
  fprintf ( 1, '     N     M        X            Lm(N,M,X)                 Lm(N,M,X)               Error\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, m, x, fx1 ] = lm_polynomial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    v = lm_polynomial ( mm, n, m, x );
    fx2 = v(1,n+1);

    e = fx1 - fx2;

    fprintf ( 1, '  %4d  %12.6g  %24.16g  %24.16g  %8.2g\n', n, x, fx1, fx2, e );

  end

  return
end
