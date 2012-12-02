function local_test ( )

%*****************************************************************************80
%
%% LOCAL_TEST works with the Local function.
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
  fprintf ( 1, 'LOCAL_TEST:\n' );
  fprintf ( 1, '  Test COMPASS_SEARCH with the Local function.\n' );
  m = 2;
  delta_tol = 0.00001;
  delta = 0.3;
  k_max = 20000;

  x = [ 1.0, 1.0 ];
  r8vec_print ( m, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', local ( m, x ) );

  [ x, fx, k ] = compass_search ( @local, m, x, delta_tol, delta, k_max );
  r8vec_print ( m, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g, number of steps = %d\n', fx, k );
%
%  Demonstrate local minimizer.
%
  x = [ 0.2858054412, 0.2793263206 ];
  r8vec_print ( m, x, '  Correct local minimizer X*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', local ( m, x ) );
%
%  Try for global minimizer.
%
  x = [ -15.0, -35.0 ];
  r8vec_print ( m, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', local ( m, x ) );

  [ x, fx, k ] = compass_search ( @local, m, x, delta_tol, delta, k_max );
  r8vec_print ( m, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g, number of steps = %d\n', fx, k );
%
%  Demonstrate global minimizer.
%
  x = [ -21.02667179, -36.75997872 ];
  r8vec_print ( m, x, '  Correct global minimizer X*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', local ( m, x ) );

  return
end
