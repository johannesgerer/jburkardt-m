function hermite_test_int_test02 ( )

%*****************************************************************************80
%
%% HERMITE_TEST_INT_TEST02 tests P00_EXACT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 May 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_TEST_INT_TEST02\n' );
  fprintf ( 1, '  P00_EXACT returns the "exact" integral.\n' );

  problem_num = p00_problem_num ( );

  m = 4;
  p06_param ( 'S', 'M', m );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   Problem       EXACT\n' );
  fprintf ( 1, '\n' );

  for problem = 1 : problem_num

    exact = p00_exact ( problem );

    fprintf ( 1, '  %8d  %24.16f\n', problem, exact );

  end

  return
end
