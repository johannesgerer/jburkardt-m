function test_min_test06 ( )

%*****************************************************************************80
%
%% TEST_MIN_TEST06 carries out a version of Brent's derivative-free minimizer.
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
  tol = 0.000001;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_MIN_TEST06\n' );
  fprintf ( 1, '  For each problem, use Brent''s method.\n' );
%
%  Get the number of problems.
%
  problem_num = p00_problem_num ( );

  for problem = 1 : problem_num

    title = p00_title ( problem );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem %d\n', problem );
    fprintf ( 1, '  %s\n', title );

    [ a, b ] = p00_interval ( problem );

    fa = p00_f ( problem, a );
    fb = p00_f ( problem, b );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Initial interval [A,B]:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '   A,       B:  %10e            %10e\n', a,     b );
    fprintf ( 1, '  FA,      FB:  %10e            %10e\n', fa,     fb );

    [ x, a, b ] = p00_fmin ( a, b, problem, tol );

    fa = p00_f ( problem, a );
    fb = p00_f ( problem, b );
    fx = p00_f ( problem, x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Final interval [A,X*,B]:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '   A,  X*,  B:  %10e  %10e  %10e\n', a, x, b );
    fprintf ( 1, '  FA, FX*, FB:  %10e  %10e  %10e\n', fa, fx, fb );

  end

  return
end
