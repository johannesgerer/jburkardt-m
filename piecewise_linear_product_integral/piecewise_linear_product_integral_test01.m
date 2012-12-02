function piecewise_integral_product_test01 ( )

%*****************************************************************************80
%
%% PIECEWISE_LINEAR_PRODUCT_INTEGRAL_TEST01 tests PIECEWISE_LINEAR_PRODUCT_INTEGRAL.
%
%  Discussion:
%
%    For the first test, we use the same single "piece" for both F and G.
%    Hence, we are actually integrating X^2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2009
%
%  Author:
%
%    John Burkardt
%
  f_num = 2;
  g_num = 2;

  f_v = [ 0.0, 5.0 ];
  f_x = [ 0.0, 5.0 ];
  g_v = [ 0.0, 5.0 ];
  g_x = [ 0.0, 5.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PIECEWISE_LINEAR_PRODUCT_INTEGRAL_TEST01\n' );
  fprintf ( 1, '  Test PIECEWISE_LINEAR_PRODUCT_INTEGRAL on a very simple problem.\n' );
  fprintf ( 1, '  F and G are both defined over a single common\n' );
  fprintf ( 1, '  interval, so that F(X) = G(X) = X.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '           A           B      Integral        Exact\n' );
  fprintf ( 1, '\n' );

  a = 1.0;
  for i = 1 : 5
    b = i;
    integral = piecewise_linear_product_integral ( a, b, f_num, f_x, f_v, ...
      g_num, g_x, g_v );
    exact = ( b * b * b - a * a * a ) / 3.0;
    fprintf ( 1, '  %10f  %10f  %10f  %14f\n', a, b, integral, exact );
  end

  return
end
