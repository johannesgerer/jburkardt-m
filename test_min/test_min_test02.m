function test_min_test02 ( )

%*****************************************************************************80
%
%% TEST_MIN_TEST02 evaluates the objective function at each starting point.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_MIN_TEST02\n' );
  fprintf ( 1, '  For each problem, evaluate the function\n' );
  fprintf ( 1, '  at the starting point and the solution.\n' );
%
%  Get the number of problems.
%
  problem_num = p00_problem_num ( );

  for problem = 1 : problem_num

    title = p00_title ( problem );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem %d\n', problem );
    fprintf ( 1, '  %s\n', title );
    fprintf ( 1, '\n' );
 
    x = p00_start ( problem );

    f_start = p00_f ( problem, x );

    fprintf ( 1, '    F(X_START) = %e\n', f_start );

    [ know, x ] = p00_sol ( problem );

    if ( 0 < know )
      f_sol = p00_f ( problem, x );
      fprintf ( 1, '    F(X_SOL) = %e\n', f_sol );
    end

  end

  return
end
