function chebyshev_polynomial_test17 ( )

%*****************************************************************************80
%
%% TEST17 tests T_TRIPLE_PRODUCT_INTEGRAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 April 2012
%
%  Author:
%
%    John Burkardt
%
  test_num = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_POLYNOMIAL_TEST17:\n' );
  fprintf ( 1, '  T_TRIPLE_PRODUCT_INTEGRAL computes the triple integral\n' );
  fprintf ( 1, '  Tijk = integral ( -1 <= x <= 1 ) T(i,x) T(j,x) T(k,x) / sqrt ( 1-x^2) dx\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I   J   K     Tijk           Tijk\n' );
  fprintf ( 1, '                 computed       exact\n' );
  fprintf ( 1, '\n' );

  n = 15;
  [ x, w ] = t_quadrature_rule ( n );

  seed = 123456789;

  for test = 1 : test_num
    [ i, seed ] = i4_uniform ( 2, 6, seed );
    [ j, seed ] = i4_uniform ( 1, 3, seed );
    [ k, seed ] = i4_uniform ( 0, 4, seed );
    fx1 = t_triple_product_integral ( i, j, k );
    fx2 = 0.0;
    for l = 1 : n
      ti = t_polynomial_value ( i, x(l) );
      tj = t_polynomial_value ( j, x(l) );
      tk = t_polynomial_value ( k, x(l) );
      fx2 = fx2 + w(l) * ti * tj * tk;
    end
    fprintf ( 1, '  %2d  %2d  %2d  %14.6g  %14.6g\n', i, j, k, fx1, fx2 );
  end

  return
end
