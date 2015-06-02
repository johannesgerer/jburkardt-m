function quadmom_test03 ( )

%*****************************************************************************80
%
%% QUADMOM_TEST03 tests the QUADMOM procedure for the general Gaussian weight.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 September 2013
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
  fprintf ( 1, 'QUADMOM_TEST03:\n' );
  fprintf ( 1, '  Compute the points and weights of a quadrature rule for\n' );
  fprintf ( 1, '  a general Gaussian weight,\n' ); 
  fprintf ( 1, '  rho(mu,s;x)=exp(-((x-mu)/sigma)^2/2)/sigma^2/sqrt(2pi),\n' );
  fprintf ( 1, '  over (-oo,+oo), using Golub and Welsch''s moment method.\n' );
  fprintf ( 1, '  Compare with a standard calculation.\n' );
%
%  N is the order of the quadrature rule.
%
  n = 5;
%
%  Compute the M = 2 * N + 1 moments for a general Gaussian weight on (-oo,+oo).
%
  m = 2 * n + 1;
  mu = 1.0;
  sigma = 2.0;
  moment = moments_normal ( m, mu, sigma );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  MU = %g\n', mu );
  fprintf ( 1, '  SIGMA = %g\n', sigma );
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
  a = 1.0;
  b = +0.5 / sigma^2;
  lo = 0;

  [ x2, w2 ] = cgqf ( n, kind, alpha2, beta2, a, b, lo );
%
%  The CGQF weights need to be normalized by sigma * sqrt ( 2 * pi )
%  because they don't divide the Gaussian PDF by that factor.
%
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

