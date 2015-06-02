function qwgw_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests QWGW for the Gegenbauer weight.
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
%  Set the quadrature interval and number of points.
%
  a = -1.0;
  b = +1.0;
  n = 5;
%
%  Set the weight function parameter.
%
  alpha = 0.25;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03:\n' );
  fprintf ( 1, '  Compute points and weights for Gauss quadrature\n' );
  fprintf ( 1, '  with the Gegenbauer weight w(x) = (1-x^2)^alpha.\n' );
  fprintf ( 1, '  Order N = %d\n', n );
  fprintf ( 1, '  ALPHA = %g\n', alpha );
  fprintf ( 1, '  Interval = [%g,%g]\n', a, b );
%
%  Set the recursion coefficients.
%
  aj = zeros ( n, 1 );
  bj = zeros ( n, 1 );

  aj(1:n) = 0.0;

  for j = 1 : n - 1
    jr = j;
    bj(j) = ( jr * ( 2.0 * alpha + jr ) ) ...
      / ( 4.0 * ( alpha + jr )^2 - 1.0 );
  end
  bj(n) = 0.0;

  bj(1:n) = sqrt ( bj(1:n) );

  mu0 = gamma ( alpha + 1.0 ) * gamma ( 0.5 ) / gamma ( alpha + 1.5 );
%
%  Compute the points and weights.
%
  [ x, w ] = sgqf ( n, aj, bj, mu0 );

  r8vec_print ( n, x, '  Abscissas:' );
  r8vec_print ( n, w, '  Weights:' );

  return
end
