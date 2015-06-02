function pd1d_steady_test ( )

%*****************************************************************************80
%
%% PD1D_STEADY_TEST runs all the peridynamics problems.
%
%  Discussion:
%
%    This function calls both convergence tests for all the problems.
%    You probably don't want to do it this way, since the tests take some
%    time, and generate graphic files that may get overwritten by the 
%    next test.  However, this shows you how to use either test with any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 February 2012
%
%  Author:
%
%    Marta D'Elia
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PD1D_STEADY_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the PERIDYNAMICS_1D_STEADY library.\n' );
  fprintf ( 1, '  Run all the peridynamics test cases.\n' );
%
%  Test 1 decreases EPSILON and H in a fixed ratio.
%  Test 2 uses a fixed EPSILON and decreases H.
%
  pd1d_steady_test01 ( @problem1 );
  pd1d_steady_test02 ( @problem1 );

  pd1d_steady_test01 ( @problem2 );
  pd1d_steady_test02 ( @problem2 );

  pd1d_steady_test01 ( @problem3 );
  pd1d_steady_test02 ( @problem3 );

  pd1d_steady_test01 ( @problem4 );
  pd1d_steady_test02 ( @problem4 );

  pd1d_steady_test01 ( @problem5 );
  pd1d_steady_test02 ( @problem5 );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PD1D_STEADY_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
