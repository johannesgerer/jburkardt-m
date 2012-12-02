function sandia_rules_test33 ( )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST33 tests HC_COMPUTE_WEIGHTS_FROM_POINTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2011
%
%  Author:
%
%    John Burkardt
%
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_RULES_TEST33:\n' );
  fprintf ( 1, '  HC_COMPUTE_WEIGHTS_FROM_POINTS returns quadrature\n' );
  fprintf ( 1, '  weights for a Hermite cubic spline given the points.\n' );

  seed = 123456789;
  [ r, seed ] = r8vec_uniform_01 ( n, seed );

  x(1) = r(1);
  for j = 2 : n
    x(j) = x(j-1) + r(j);
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Random spacing\n' );
  fprintf ( 1, '  Number of points N = %d\n', n );
  fprintf ( 1, '  Interval = [%f,%f]\n', x(1), x(n) );

  w = hc_compute_weights_from_points ( n, x );

  [ fn, dn, s, t ] = cubic_value ( x(1:n) );

  q = w(1,1:n) * fn(1:n) + w(2,1:n) * dn(1:n);

  q_exact = cubic_integrate ( x(1), x(n) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Q         = %f\n', q );
  fprintf ( 1, '  Q (exact) = %f\n', q_exact );

  return
end
