function qwv_test01 ( )

%*****************************************************************************80
%
%% QWV_TEST01 tests QWV for a Newton-Cotes rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2014
%
%  Author:
%
%    John Burkardt
%
  a =  0.0;
  b = +1.0;
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QWV_TEST01:\n' );
  fprintf ( 1, '  Use the Vandermonde procedure to compute the\n' );
  fprintf ( 1, '  quadrature weights for a Newton-Cotes rule.\n' );
  fprintf ( 1, '  Order N = %d\n', n );
  fprintf ( 1, '  Interval = [%g,%g]\n', a, b );
%
%  Set the points.
%
  x = r8vec_even ( n, a, b );
  r8vec_print ( n, x, '  Abscissas:' );
%
%  Compute the weights.
%
  w = qwv ( n, a, b, x );

  r8vec_print ( n, w, '  Weights:' );

  return
end