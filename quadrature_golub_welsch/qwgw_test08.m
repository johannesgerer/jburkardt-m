function qwgw_test08 ( )

%*****************************************************************************80
%
%% TEST08 tests QWGW for the Laguerre weight.
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
%  The quadrature interval is [a,+oo).
%  Set the number of points.
%
  a = 0.0;
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08:\n' );
  fprintf ( 1, '  Compute points and weights for Gauss quadrature\n' );
  fprintf ( 1, '  with the Laguerre weight w(x) = exp(-x).\n' );
  fprintf ( 1, '  Order N = %d\n', n );
  fprintf ( 1, '  Interval = [0,+oo)\n' );
%
%  Set the recursion coefficients.
%
  aj = zeros ( n, 1 );
  bj = zeros ( n, 1 );

  for j = 1 : n
    aj(j) = 2 * j - 1;
  end

  for j = 1 : n - 1
    bj(j) = j * j;
  end
  bj(n) = 0.0;

  bj(1:n) = sqrt ( bj(1:n) );

  mu0 = 1.0;
%
%  Compute the points and weights.
%
  [ x, w ] = sgqf ( n, aj, bj, mu0 );

  r8vec_print ( n, x, '  Abscissas:' );
  r8vec_print ( n, w, '  Weights:' );

  return
end
