function test_optimization_test03 ( )

%*****************************************************************************80
%
%% TEST_OPTIMIZATION_TEST03 tries Compass Search on each problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 January 2012
%
%  Author:
%
%    John Burkardt
%
  m = 2;
  n = 1000;
  delta_tol = 0.000001;
  k_max = 20000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_OPTIMIZATION_TEST03\n' );
  fprintf ( 1, '  For each problem, using dimension M = 2\n' );
  fprintf ( 1, '  try compass search.\n' );
%
%  Get the number of problems.
%
  problem_num = p00_problem_num ( );

  for problem = 1 : problem_num

    seed = 123456789;

    [ a, b ] = p00_ab ( problem, m );
    [ x0, seed ] = r8col_uniform ( m, 1, a, b, seed );
    fx = p00_f ( problem, m, 1, x0 );
    delta_init = 0.3 * norm ( x0 ) / m;
    delta_init = max ( delta_init, 1000.0 * delta_tol );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem %2d  DELTA_INIT = %14g\n', problem, delta_init );
    fprintf ( 1, '  Initial:  %14g  %14g  %14g\n', x0, fx );
    [ x, fx, k ] = p00_compass_search ( problem, m, x0, delta_tol, delta_init, ...
      k_max );
    fprintf ( 1, '  Final:    %14g  %14g  %14g  Steps = %d\n', x, fx, k );

    know = 0;
    while ( 1 )
      [ know, x ] = p00_sol ( problem, m, know );
      if ( know == 0 )
        break
      end
      fx = p00_f ( problem, m, 1, x );
      fprintf ( 1, '  Exact:    %14g  %14g  %14g\n', x, fx );
    end

  end

  return
end