function piecewise_integral_product_test03 ( )

%*****************************************************************************80
%
%% PIECEWISE_LINEAR_PRODUCT_INTEGRAL_TEST03 tests PIECEWISE_LINEAR_PRODUCT_INTEGRAL.
%
%  Discussion:
%
%    For this test, F(X) and G(X) are piecewise linear interpolants to
%    SIN(X) and 2 * COS(X), so we know the exact value of the integral
%    of the product of the original functions, but this is only an estimate
%    of the exact value of the integral of the product of the interpolants.
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
  f_num = 11;
  g_num = 31;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PIECEWISE_LINEAR_PRODUCT_INTEGRAL_TEST03\n' );
  fprintf ( 1, '  Test PIECEWISE_LINEAR_PRODUCT_INTEGRAL on a simple problem.\n' );
  fprintf ( 1, '  F and G are defined over separate, multiple\n' );
  fprintf ( 1, '  intervals.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X) interpolates SIN(X),\n' );
  fprintf ( 1, '  G(X) interpolates 2*COS(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We compare:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  INTEGRAL, our value for the integral,\n' );
  fprintf ( 1, '  QUAD, a quadrature estimate for the integral, and\n' );
  fprintf ( 1, '  CLOSE, the value of the integral of 2*COS(X)*SIN(X)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '           A           B      Integral        Quad            Close\n' );
  fprintf ( 1, '\n' );

  for i = 1 : f_num
    f_x(i) = ( ( f_num - i     ) * 0.0 ...
             + (         i - 1 ) * pi ) ...
             / ( f_num     - 1 );
    f_v(i) = sin ( f_x(i) );
  end

  for i = 1 : g_num
    g_x(i) = ( ( g_num - i     ) * 0.0 ...
             + (         i - 1 ) * pi ) ...
             / ( g_num     - 1 );
    g_v(i) = 2.0 * cos ( g_x(i) );
  end

  a = 0.0;
  for i = 0 : 6
    b = i * pi / 6.0;
    integral = piecewise_linear_product_integral ( a, b, f_num, f_x, f_v, ...
      g_num, g_x, g_v );
    exact = - ( cos ( 2.0 * b ) - cos ( 2.0 * a ) ) / 2.0;
    quad_num = 2000;
    quad = piecewise_linear_product_quad ( a, b, f_num, f_x, f_v, g_num, ...
      g_x, g_v, quad_num );
    fprintf ( 1, '  %10f  %10f  %14f  %14f  %14f\n', ...
      a, b, integral, quad, exact );
  end

  return
end
