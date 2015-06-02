function qwgw_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests QWGW for the Jacobi weight.
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
%  Set the weight function parameters.
%
  alpha = 0.25;
  beta = 0.75;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07:\n' );
  fprintf ( 1, '  Compute points and weights for Gauss quadrature\n' );
  fprintf ( 1, '  with the Jacobi weight w(x) = (1-x^2)^alpha*(1+x)^beta\n' );
  fprintf ( 1, '  Order N = %d\n', n );
  fprintf ( 1, '  ALPHA = %g\n', alpha );
  fprintf ( 1, '  BETA =  %g\n', beta );
  fprintf ( 1, '  Interval = [%g,%g]\n', a, b );
%
%  Set the recursion coefficients.
%
  aj = zeros ( n, 1 );
  bj = zeros ( n, 1 );

  for j = 1 : n
    jr = j;
    aj(j) = ( beta - alpha ) * ( beta + alpha ) ...
      / ( alpha + beta + 2.0 * jr - 2.0 ) ...
      / ( alpha + beta + 2.0 * jr );
  end

  for j = 1 : n - 1
    jr = j;
    bj(j) = 4.0 * jr * ( alpha + jr ) * ( beta + jr ) ...
      * ( alpha + beta + jr ) ...
      / ( ( alpha + beta + 2.0 * jr )^2 - 1.0 ) ...
      / ( alpha + beta + 2.0 * jr )^2;
  end
  bj(n) = 0.0;

  bj(1:n) = sqrt ( bj(1:n) );

  mu0 = 2.0 ^ ( alpha + beta + 1.0 ) ...
    * gamma ( alpha + 1.0 ) * gamma ( beta + 1.0 ) ...
    / gamma ( alpha + beta + 2.0 );
%
%  Compute the points and weights.
%
  [ x, w ] = sgqf ( n, aj, bj, mu0 );

  r8vec_print ( n, x, '  Abscissas:' );
  r8vec_print ( n, w, '  Weights:' );

  return
end
