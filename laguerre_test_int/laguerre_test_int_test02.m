function laguerre_test_int_test02 ( )

%*****************************************************************************80
%
%% LAGUERRE_TEST_INT_TEST02 tests P00_ALPHA and P00_EXACT.
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
  fprintf ( 1, 'LAGUERRE_TEST_INT_TEST02\n' );
  fprintf ( 1, '  P00_ALPHA returns the lower limit of integration.\n' );
  fprintf ( 1, '  P00_EXACT returns the "exact" integral.\n' );

  problem_num = p00_problem_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   Problem       ALPHA           EXACT\n' );
  fprintf ( 1, '\n' );

  for problem = 1 : problem_num

    alpha = p00_alpha ( problem );

    exact = p00_exact ( problem );

    fprintf ( 1, '  %8d  %14f  %24.16f\n', problem, alpha, exact );

  end

  return
end
