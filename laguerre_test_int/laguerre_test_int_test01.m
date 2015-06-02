function laguerre_test_int_test01 ( )

%*****************************************************************************80
%
%% LAGUERRE_TEST_INT_TEST01 tests P00_PROBLEM_NUM and P00_TITLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 July 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGUERRE_TEST_INT_TEST01\n' );
  fprintf ( 1, '  P00_PROBLEM_NUM returns the number of problems.\n' );
  fprintf ( 1, '  P00_TITLE returns the title of a problem.\n' );

  problem_num = p00_problem_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '  P00_PROBLEM_NUM: number of problems is %d\n', problem_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Problem       Title\n' );
  fprintf ( 1, '\n' );

  for problem = 1 : problem_num

    title = p00_title ( problem );

    fprintf ( 1, '  %8d  "%s"\n', problem, title );

  end

  return
end
