function test_con_test ( )

%*****************************************************************************80
%
%% TEST_CON_TEST tests the TEST_CON library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_CON_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_CON library.\n' );
%
%  Find out how many problems are available.
%
  problem_num = p00_problem_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  There are %d test functions.\n', problem_num );
%
%  Print the number of options for each problem.
%
  p00_option_num_test ( problem_num );
%
%  Print the title of each problem.
%
  p00_title_test ( problem_num );
%
%  Print the size of each problem.
%
  p00_nvar_test ( problem_num );
%
%  Get the starting point X0 and the norm of F(X0).
%
  p00_start_test ( problem_num );
%
%  Check the jacobian.
%
  p00_jac_test ( problem_num );
%
%  Check the tangent.
%
  p00_tan_test ( problem_num );
%
%  Apply Newton's method to the perturbed starting point.
%
  p00_newton_test ( problem_num );
%
%  Get the starting stepsize.
%
  p00_stepsize_test ( problem_num );
%
%  Run problem 1 as a target computation, seeking X(3) = 1.0.
%  Try option = 1 and option = 4.
%
  option = 1;
  p01_target_test ( option );

  option = 4;
  p01_target_test ( option );
%
%  Run problem 1 as a limit point computation, seeking TAN(LIM)=0.
%  Try options 2, 3, 5, 6.
%
  option = 2;
  p01_limit_test ( option );

  option = 3;
  p01_limit_test ( option );

  option = 5;
  p01_limit_test ( option );

  option = 6;
  p01_limit_test ( option );
%
%  Run problem 6 as a limit point computation, for all options.
%
  problem = 6;
  option_num = p00_option_num ( problem );

  for option = 1 : option_num
    p06_limit_test ( option );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_CON_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
