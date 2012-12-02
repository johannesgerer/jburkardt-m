function test_min_test04 ( )

%*****************************************************************************80
%
%% TEST_MIN_TEST04 compares the eact and approximate second derivatives.
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
  fprintf ( 1, 'TEST_MIN_TEST04\n' );
  fprintf ( 1, '  For each problem, compare the eact and\n' );
  fprintf ( 1, '  approximate second derivatives at the starting point.\n' );
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

    fprintf ( 1, '\n' );
    fprintf ( 1, '  X:\n' );
    fprintf ( 1, '  %e\n', x );

    f2 = p00_f2 ( problem, x );

    fprintf ( 1, '  F"(X) (exact):\n' );
    fprintf ( 1, '  %e\n', f2 );

    f2_dif = p00_f2_dif ( problem, x );

    fprintf ( 1, '  F"(X) (difference):\n' );
    fprintf ( 1, '  %e\n', f2_dif );

  end

  return
end
