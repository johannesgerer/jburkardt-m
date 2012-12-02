function jacobi_polynomial_test01 ( )

%*****************************************************************************80
%
%% JACOBI_POLYNOMIAL_TEST01 tests J_POLYNOMIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'JACOBI_POLYNOMIAL_TEST01:\n' );
  fprintf ( 1, '  J_POLYNOMIAL_VALUES stores values of\n' );
  fprintf ( 1, '  the Jacobi polynomials.\n' );
  fprintf ( 1, '  J_POLYNOMIAL evaluates the polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                                    Tabulated                 Computed\n' );
  fprintf ( 1, '     N     A     B        X           J(N,A,B,X)                    J(N,A,B,X)                     Error\n' );

  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, a, b, x, fx1 ] = j_polynomial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2_vec = j_polynomial ( 1, n, a, b, x );
    fx2 = fx2_vec(1,n+1);
    e = fx1 - fx2;

    fprintf ( 1, '  %4d  %6f  %6f  %6f  %24.16e  %24.16e  %8.2g\n', n, a, b, x, fx1, fx2, e );

  end

  return
end
