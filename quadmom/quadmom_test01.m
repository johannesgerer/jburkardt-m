function quadmom_test01 ( )

%*****************************************************************************80
%
%% QUADMOM_TEST01 tests the QUADMOM procedure for the Legendre weight.
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
  addpath ( '../toms655' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADMOM_TEST01:\n' );
  fprintf ( 1, '  Compute the points and weights of a quadrature rule\n' );
  fprintf ( 1, '  for the Legendre weight, rho(x)=1, over [-1,+1],\n' );
  fprintf ( 1, '  using Golub and Welsch''s moment method.\n' );
  fprintf ( 1, '  Compare with a standard calculation.\n' );
%
%  N is the order of the rule we want to compute.
%
  n = 5;
%
%  Compute M = 2*N+1 moments for the Legendre weight on [-1,+1].
%
  m = 2 * n + 1;
  a = -1.0;
  b = 1.0;

  moment = moments_legendre ( m, a, b );
%
%  Compute the points and weights by the method of moments.
%
  [ x1, w1 ] = moment_method ( n, moment );
%
%  Compute the points and weights the usual way.
%
  kind = 1;
  alpha2 = 0.0;
  beta2 = 0.0;
  a = -1.0;
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

