function mckinnon_test ( )

%*****************************************************************************80
%
%% MCKINNON_TEST works with the McKinnon function.
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
  global phi
  global tau
  global theta

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MCKINNON_TEST:\n' );
  fprintf ( 1, '  Test COMPASS_SEARCH with the McKinnon function.\n' );
  m = 2;
  delta_tol = 0.00001;
  delta = 0.3;
  k_max = 20000;
%
%  Test 1
%
  a = ( 1.0 + sqrt ( 33.0 ) ) / 8.0;
  b = ( 1.0 - sqrt ( 33.0 ) ) / 8.0;

  phi = 10.0;
  tau = 1.0;
  theta = 15.0;

  x = [ a, b ];
  r8vec_print ( m, x, '  Initial point X0:' );
  fprintf ( 1, '  PHI = %f, TAU = %f, THETA = %f\n', phi, tau, theta );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', mckinnon ( m, x ) );

  [ x, fx, k ] = compass_search ( @mckinnon, m, x, delta_tol, delta, k_max );
  r8vec_print ( m, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g, number of steps = %d\n', fx, k );

  x = [ 0.0, -0.5 ];
  r8vec_print ( m, x, '  Correct minimizer X*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', mckinnon ( m, x ) );
%
%  Test 2
%
  a = ( 1.0 + sqrt ( 33.0 ) ) / 8.0;
  b = ( 1.0 - sqrt ( 33.0 ) ) / 8.0;

  phi = 60.0;
  tau = 2.0;
  theta = 6.0;

  x = [ a, b ];
  r8vec_print ( m, x, '  Initial point X0:' );
  fprintf ( 1, '  PHI = %f, TAU = %f, THETA = %f\n', phi, tau, theta );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', mckinnon ( m, x ) );

  [ x, fx, k ] = compass_search ( @mckinnon, m, x, delta_tol, delta, k_max );
  r8vec_print ( m, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g, number of steps = %d\n', fx, k );

  x = [ 0.0, -0.5 ];
  r8vec_print ( m, x, '  Correct minimizer X*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', mckinnon ( m, x ) );
%
%  Test 3
%
  a = ( 1.0 + sqrt ( 33.0 ) ) / 8.0;
  b = ( 1.0 - sqrt ( 33.0 ) ) / 8.0;

  phi = 4000.0;
  tau = 3.0;
  theta = 6.0;

  x = [ a, b ];
  r8vec_print ( m, x, '  Initial point X0:' );
  fprintf ( 1, '  PHI = %f, TAU = %f, THETA = %f\n', phi, tau, theta );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', mckinnon ( m, x ) );

  [ x, fx, k ] = compass_search ( @mckinnon, m, x, delta_tol, delta, k_max );
  r8vec_print ( m, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g, number of steps = %d\n', fx, k );

  x = [ 0.0, -0.5 ];
  r8vec_print ( m, x, '  Correct minimizer X*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', mckinnon ( m, x ) );

  return
end
