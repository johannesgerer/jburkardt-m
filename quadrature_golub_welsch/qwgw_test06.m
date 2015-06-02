function qwgw_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests QWGW for the Hermite weight.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2014
%
%  Author:
%
%    John Burkardt
%

%
%  The quadrature interval is (-oo,+oo).
%  Set the number of points.
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06:\n' );
  fprintf ( 1, '  Compute points and weights for Gauss quadrature\n' );
  fprintf ( 1, '  with the Hermite weight w(x) = exp(-x^2).\n' );
  fprintf ( 1, '  Order N = %d\n', n );
  fprintf ( 1, '  Interval = (-oo,+oo)\n' );
%
%  Set the recursion coefficients.
%
  aj = zeros ( n, 1 );
  bj = zeros ( n, 1 );

  aj(1:n) = 0.0;

  for j = 1 : n - 1
    bj(j) = j / 2.0
  end
  bj(n) = 0.0;

  bj(1:n) = sqrt ( bj(1:n) );

  mu0 = sqrt ( pi );
%
%  Compute the points and weights.
%
  [ x, w ] = sgqf ( n, aj, bj, mu0 );

  r8vec_print ( n, x, '  Abscissas:' );
  r8vec_print ( n, w, '  Weights:' );

  return
end
