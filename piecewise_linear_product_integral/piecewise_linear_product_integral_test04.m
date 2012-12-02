function piecewise_integral_product_test04 ( )

%*****************************************************************************80
%
%% PIECEWISE_LINEAR_PRODUCT_INTEGRAL_TEST04 tests PIECEWISE_LINEAR_PRODUCT_INTEGRAL.
%
%  Discussion:
%
%    For this test, we compute the integrals of a hat function with itself,
%    and a hat function with its neighbor.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 April 2009
%
%  Author:
%
%    John Burkardt
%
  f_num = 3;
  g_num = 3;

  f_v = [ 0.0, 1.0, 0.0 ];
  f_x = [ 0.0, 1.0, 2.0 ];
  g_v = [ 1.0, 0.0, 0.0 ];
  g_x = [ 0.0, 1.0, 2.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PIECEWISE_LINEAR_PRODUCT_INTEGRAL_TEST04\n' );
  fprintf ( 1, '  Test PIECEWISE_LINEAR_PRODUCT_INTEGRAL.\n' );
  fprintf ( 1, '  The nodes are at 0, 1, and 2.\n' );
  fprintf ( 1, '  F(X) = ( 0, 1, 0 ).\n' );
  fprintf ( 1, '  G(X) = ( 1, 0, 0 ).\n' );
  fprintf ( 1, '\n' );

  a = 0.0;
  b = 2.0;

  integral = piecewise_linear_product_integral ( a, b, f_num, f_x, f_v, ...
    f_num, f_x, f_v );

  fprintf ( 1, '  Integral F(X) * F(X) dx = %f\n', integral );

  integral = piecewise_linear_product_integral ( a, b, f_num, f_x, f_v, ...
    g_num, g_x, g_v );

  fprintf ( 1, '  Integral F(X) * G(X) dx = %f\n', integral );

  integral = piecewise_linear_product_integral ( a, b, g_num, g_x, g_v, ...
    g_num, g_x, g_v );

  fprintf ( 1, '  Integral G(X) * G(X) dx = %f\n', integral );

  return
end
