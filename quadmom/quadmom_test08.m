function quadmom_test08 ( )

%*****************************************************************************80
%
%% QUADMOM_TEST08 integrates sin(x) against a lower truncated normal weight.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2013
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
  fprintf ( 1, 'QUADMOM_TEST08:\n' );
  fprintf ( 1, '  Integrate sin(x) against a lower truncated normal weight.\n' );

  mu = 0.0;
  sigma = 1.0;
  a = -3.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  MU = %g\n', mu );
  fprintf ( 1, '  SIGMA = %g\n', sigma );
  fprintf ( 1, '  A = %g\n', a );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N    Estimate\n' );
  fprintf ( 1, '\n' );
%
%  N is the order of the quadrature rule.
%
  for n = 1 : 9
%
%  Compute the M = 2 * N + 1 moments.
%
    m = 2 * n + 1;

    moment = moments_truncated_normal_a ( m, mu, sigma, a );
%
%  Compute the N points and weights by the method of moments.
%
    [ x, w ] = moment_method ( n, moment );
%
%  Evaluate the quadrature rule when f(x) = sin(x).
%
    q = w' * sin ( x );

    fprintf ( 1, '  %2d  %14.6g\n', n, q );

  end

  return
end

