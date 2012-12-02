function test_optimization_test02 ( )

%*****************************************************************************80
%
%% TEST_OPTIMIZATION_TEST02 samples the function at 1,000 points and prints the minimum.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 February 2012
%
%  Author:
%
%    John Burkardt
%
  m = 2;
  n = 1000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_OPTIMIZATION_TEST02\n' );
  fprintf ( 1, '  For each problem, using dimension M = 2\n' );
  fprintf ( 1, '  sample the function at N = 1000 points,\n' );
  fprintf ( 1, '  and print the minimum and maximum.\n' );

  seed = 123456789;
%
%  Get the number of problems.
%
  problem_num = p00_problem_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Problem     Minimum  Sample Minimum  Sample Maximum\n' );
  fprintf ( 1, '\n' );

  for problem = 1 : problem_num

    know = 0;
    [ know, x ] = p00_sol ( problem, m, know );
    if ( know ~= 0 )
      f = p00_f ( problem, m, 1, x );
      f_min = f(1);
    end

    [ a, b ] = p00_ab ( problem, m );
    [ x, seed ] = r8col_uniform ( m, n, a, b, seed );
    f = p00_f ( problem, m, n, x );
    if ( know ~= 0 )
      fprintf ( 1, '  %7d  %14g  %14g  %14g\n', ...
        problem, f_min, min ( f(1:n) ), max ( f(1:n) ) );
    else
      fprintf ( 1, '  %7d                  %14g  %14g\n', ...
        problem,         min ( f(1:n) ), max ( f(1:n) ) );
    end

  end

  return
end