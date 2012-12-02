function hermite_polynomial_test02 ( )

%*****************************************************************************80
%
%% HERMITE_POLYNOMIAL_TEST02 tests HE_POLYNOMIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_POLYNOMIAL_TEST02:\n' );
  fprintf ( 1, '  HE_POLYNOMIAL_VALUES stores values of\n' );
  fprintf ( 1, '  the probabilist''s Hermite polynomials.\n' );
  fprintf ( 1, '  HE_POLYNOMIAL evaluates the polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                        Tabulated                 Computed\n' );
  fprintf ( 1, '     N        X          He(N,X)                   He(N,X)                     Error\n' );

  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx1 ] = he_polynomial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2_vec = he_polynomial ( 1, n, x );
    fx2 = fx2_vec(1,n+1);
    e = fx1 - fx2;

    fprintf ( 1, '  %4d  %12f  %24.16e  %24.16e  %8.2g\n', n, x, fx1, fx2, e );

  end

  return
end
