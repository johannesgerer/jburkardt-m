function himmelblau_test ( )

%*****************************************************************************80
%
%% HIMMELBLAU_TEST works with the Himmelblau function.
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
  fprintf ( 1, 'HIMMELBLAU_TEST:\n' );
  fprintf ( 1, '  Test COMPASS_SEARCH with the Himmelblau function.\n' );
  m = 2;
  delta_tol = 0.00001;
  delta = 0.3;
  k_max = 20000;

  x = [ 1.0, 1.0 ];
  r8vec_print ( m, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', himmelblau ( m, x ) );

  [ x, fx, k ] = compass_search ( @himmelblau, m, x, delta_tol, delta, k_max );
  r8vec_print ( m, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g, number of steps = %d\n', fx, k );

  x = [ -1.0, 1.0 ];
  r8vec_print ( m, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', himmelblau ( m, x ) );

  [ x, fx, k ] = compass_search ( @himmelblau, m, x, delta_tol, delta, k_max );
  r8vec_print ( m, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g, number of steps = %d\n', fx, k );

  x = [ -1.0, -1.0 ];
  r8vec_print ( m, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', himmelblau ( m, x ) );

  [ x, fx, k ] = compass_search ( @himmelblau, m, x, delta_tol, delta, k_max );
  r8vec_print ( m, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g, number of steps = %d\n', fx, k );

  x = [ 1.0, -1.0 ];
  r8vec_print ( m, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', himmelblau ( m, x ) );

  [ x, fx, k ] = compass_search ( @himmelblau, m, x, delta_tol, delta, k_max );
  r8vec_print ( m, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g, number of steps = %d\n', fx, k );
%
%  Demonstrate Himmelblau minimizers.
%
  x = [ 3.0, 2.0 ];
  r8vec_print ( m, x, '  Correct Himmelblau minimizer X1*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', himmelblau ( m, x ) );

  x = [ 3.58439, -1.84813 ];
  r8vec_print ( m, x, '  Correct Himmelblau minimizer X2*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', himmelblau ( m, x ) );

  x = [ -3.77934, -3.28317 ];
  r8vec_print ( m, x, '  Correct Himmelblau minimizer X3*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', himmelblau ( m, x ) );

  x = [ -2.80512,  3.13134 ];
  r8vec_print ( m, x, '  Correct Himmelblau minimizer X4*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', himmelblau ( m, x ) );

  return
end
