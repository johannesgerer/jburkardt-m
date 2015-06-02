function qwgw_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests QWGW for the generalized Hermite weight.
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
%
%  Set the weight function parameter.
%
  alpha = 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04:\n' );
  fprintf ( 1, '  Compute points and weights for Gauss quadrature\n' );
  fprintf ( 1, '  with the generalized Hermite weight w(x) = |x|^alpha * exp(-x^2).\n' );
  fprintf ( 1, '  ALPHA = %g\n', alpha );
  fprintf ( 1, '  Order N = %d\n', n );
  fprintf ( 1, '  Interval = (-oo,+oo)\n' );
%
%  Set the recursion coefficients.
%
  aj = zeros ( n, 1 );
  bj = zeros ( n, 1 );

  aj(1:n) = 0.0;

  for j = 1 : n - 1
    if ( mod ( j, 2 ) == 1 )
      bj(j) = ( j + alpha ) / 2.0;
    else
      bj(j) = j / 2.0;
    end
  end
  bj(n) = 0.0;

  bj(1:n) = sqrt ( bj(1:n) )

  mu0 = gamma ( ( alpha + 1.0 ) / 2.0 )
%
%  Compute the points and weights.
%
  [ x, w ] = sgqf ( n, aj, bj, mu0 );

  r8vec_print ( n, x, '  Abscissas:' );
  r8vec_print ( n, w, '  Weights:' );

  return
end
