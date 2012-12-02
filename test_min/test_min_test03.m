function test_min_test03 ( )

%*****************************************************************************80
%
%% TEST_MIN_TEST03 compares the exact and approximate first derivatives.
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
  fprintf ( 1, 'TEST_MIN_TEST03\n' );
  fprintf ( 1, '  For each problem, compare the exact and\n' );
  fprintf ( 1, '  approximate gradients at the starting point.\n' );
%
%  Get the number of problems.
%
  problem_num = p00_problem_num ( );

  for problem = 1 : problem_num

    title = p00_title ( problem );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem %d\n', problem );
    fprintf ( 1, '  %s\n', title );

    x = p00_start ( problem );

    f1 = p00_f1 ( problem, x );

    f1_dif = p00_f1_dif ( problem, x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  X\n' );
    fprintf ( 1, '  %e\n', x );
    fprintf ( 1, '  F''(X) (exact)\n' );
    fprintf ( 1, '  %e\n', f1 );
    fprintf ( 1, '  F''(X) (difference)\n' );
    fprintf ( 1, '  %e\n', f1_dif );

  end

  return
end
