function quadmom_test06 ( )

%*****************************************************************************80
%
%% QUADMOM_TEST06 tests the QUADMOM procedure for the lower truncated normal weight.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADMOM_TEST06:\n' );
  fprintf ( 1, '  Compute the points and weights of a quadrature rule for\n' );
  fprintf ( 1, '  a lower truncated normal weight,\n' ); 
  fprintf ( 1, '  rho(mu,s;x)=exp(-((x-mu)/sigma)^2/2)/sigma^2/sqrt(2pi),\n' );
  fprintf ( 1, '  over [a,+00), using Golub and Welsch''s moment method.\n' );
%
%  N is the order of the quadrature rule.
%
  n = 9;
%
%  Compute the M = 2 * N + 1 moments.
%
  m = 2 * n + 1;
  mu = 2.0;
  sigma = 0.5;
  a = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  MU = %g\n', mu );
  fprintf ( 1, '  SIGMA = %g\n', sigma );
  fprintf ( 1, '  A = %g\n', a );

  moment = moments_truncated_normal_a ( m, mu, sigma, a );
%
%  Compute the N points and weights by the method of moments.
%
  [ x, w ] = moment_method ( n, moment );
%
%  Print the results.
%
  r8vec_print ( n, x, '  Points from GW moment method:' );

  r8vec_print ( n, w, '  Weights from GW moment method:' );

  return
end

