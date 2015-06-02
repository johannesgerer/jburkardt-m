function quadmom_test04 ( )

%*****************************************************************************80
%
%% QUADMOM_TEST04 tests the QUADMOM procedure for the Laguerre weight.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gene Golub, John Welsch,
%    Calculation of Gaussian Quadrature Rules,
%    Mathematics of Computation,
%    Volume 23, Number 106, April 1969, pages 221-230.
%
  addpath ( '../toms655' )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADMOM_TEST04:\n' );
  fprintf ( 1, '  Compute the points and weights of a quadrature rule for\n' );
  fprintf ( 1, '  the Laguerre weight, rho(x)=exp(-x),\n' );
  fprintf ( 1, '  over [0,+oo), using Golub and Welsch''s moment method.\n' );
  fprintf ( 1, '  Compare with a standard calculation.\n' );
%
%  N is the order of the quadrature rule.
%
  n = 5;
%
%  Compute the M = 2 * N + 1 moments for the Laguerre weight on [0,+oo).
%
  m = 2 * n + 1;
  moment = moments_laguerre ( m );
%
%  Compute the points and weights by the method of moments.
%
  [ x1, w1 ] = moment_method ( n, moment );
%
%  Compute the points and weights the usual way.
%
  kind = 5;
  alpha2 = 0.0;
  beta2 = 0.0;
  a = 0.0;
  b = +1.0;
  lo = 0;

  [ x2, w2 ] = cgqf ( n, kind, alpha2, beta2, a, b, lo );
%
%  Compare the results.
%
  r8vec2_print ( n, x1, x2, ...
    '  Points from GW moment and orthogonal polynomial methods:' );

  r8vec2_print ( n, w1, w2, ...
    '  Weights from GW moment and orthogonal polynomial methods:' );

  rmpath ( '../toms655' )

  return
end

