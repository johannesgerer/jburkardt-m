function rosenbrock_test ( )

%*****************************************************************************80
%
%% ROSENBROCK_TEST works with the Rosenbrock function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ROSENBROCK_TEST:\n' );
  fprintf ( 1, '  Test COMPASS_SEARCH with the Rosenbrock function.\n' );
  m = 2;
  delta_tol = 0.00001;
  delta = 0.3;
  k_max = 20000;

  x = [ - 1.2, 1.0 ];
  r8vec_print ( m, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', rosenbrock ( m, x ) );

  [ x, fx, k ] = compass_search ( @rosenbrock, m, x, delta_tol, delta, k_max );
  r8vec_print ( m, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g, number of steps = %d\n', fx, k );
%
%  Demonstrate correct minimizer.
%
  x = [ 1.0, 1.0 ];
  r8vec_print ( m, x, '  Correct minimizer X*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', rosenbrock ( m, x ) );

  return
end
