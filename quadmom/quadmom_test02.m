function quadmom_test02 ( )

%*****************************************************************************80
%
%% QUADMOM_TEST02 tests the QUADMOM procedure for the standard Gaussian weight.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 September 2013
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
  fprintf ( 1, 'QUADMOM_TEST02:\n' );
  fprintf ( 1, '  Compute the points and weights of a quadrature rule for\n' );
  fprintf ( 1, '  the standard Gaussian weight, rho(x)=exp(-x^2/2)/sqrt(2pi),\n' );
  fprintf ( 1, '  over (-oo,+oo), using Golub and Welsch''s moment method.\n' );
  fprintf ( 1, '  Compare with a standard calculation.\n' );
%
%  N is the order of the quadrature rule.
%
  n = 5;
%
%  Compute the M = 2 * N + 1 moments for the standard Gaussian weight on (-oo,+oo).
%
  m = 2 * n + 1;
  moment = moments_normal_01 ( m );
%
%  Compute the points and weights by the method of moments.
%
  [ x1, w1 ] = moment_method ( n, moment );
%
%  Compute the points and weights the usual way.
%
  kind = 6;
  alpha2 = 0.0;
  beta2 = 0.0;
  a = 0.0;
  b = +0.5;
  lo = 0;

  [ x2, w2 ] = cgqf ( n, kind, alpha2, beta2, a, b, lo );
%
%  The CGQF weights need to be normalized by sigma * sqrt ( 2 * pi )
%  because they don't divide the Gaussian PDF by that factor.
%
  sigma = 1.0;
  w2(1:n) = w2(1:n) / sigma / sqrt ( 2.0 * pi );
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

