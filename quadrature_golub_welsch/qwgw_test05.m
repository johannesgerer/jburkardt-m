function qwgw_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests QWGW for the generalized Laguerre weight.
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
%  The quadrature interval is [0,+oo).
%  Set the number of points.
%
  a = 0.0;
  n = 5;
%
%  Set the weight function parameter.
%
  alpha = 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05:\n' );
  fprintf ( 1, '  Compute points and weights for Gauss quadrature\n' );
  fprintf ( 1, '  with the generalized Laguerre weight w(x) = x^alpha * exp(-x).\n' );
  fprintf ( 1, '  Order N = %d\n', n );
  fprintf ( 1, '  ALPHA = %g\n', alpha );
  fprintf ( 1, '  Interval = [0,+oo)\n' );
%
%  Set the recursion coefficients.
%
  aj = zeros ( n, 1 );
  bj = zeros ( n, 1 );

  for j = 1 : n
    aj(j) = alpha + 2 * j - 1;
  end

  for j = 1 : n - 1
    bj(j) = j * ( alpha + j );
  end
  bj(n) = 0.0;

  bj(1:n) = sqrt ( bj(1:n) );

  mu0 = gamma ( alpha + 1 )
%
%  Compute the points and weights.
%
  [ x, w ] = sgqf ( n, aj, bj, mu0 );

  r8vec_print ( n, x, '  Abscissas:' );
  r8vec_print ( n, w, '  Weights:' );

  return
end
