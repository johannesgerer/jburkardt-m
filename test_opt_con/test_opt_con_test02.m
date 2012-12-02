function test_opt_con_test02 ( )

%*****************************************************************************80
%
%% TEST_OPT_CON_TEST02 evaluates the objective function at each starting point.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 February 2012
%
%  Author:
%
%    John Burkardt
%
  n = 100000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_OPT_CON_TEST02\n' );
  fprintf ( 1, '  For each problem, evaluate the function at many points.\n' );
  fprintf ( 1, '  Number of sample points = %d\n', n );
%
%  Get the number of problems.
%
  problem_num = p00_problem_num ( );

  for problem = 1 : problem_num

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem %d\n', problem );

    title = p00_title ( problem );

    fprintf ( 1, '  %s\n', title );

    m = p00_m ( problem );

    fprintf ( 1, '  M = %d\n', m );
 
    [ a, b ] = p00_ab ( problem, m );

    fprintf ( 1, '\n' );
    fprintf ( 1, '    I      A(i)      B(i)\n' );
    fprintf ( 1, '\n' );

    for i = 1 : m
      fprintf ( 1, '  %4d  %10g  %10g\n', i, a(i), b(i) );
    end

    x = rand ( m, n );
    for i = 1 : m
      x(i,:) = a(i) * ( 1.0 - x(i,:) ) + b(i) * x(i,:);
    end

%   seed = 123456789;
%   [ x, seed ] = r8col_uniform ( m, n, a, b, seed );

    f = p00_f ( problem, m, n, x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Max(F) = %g\n', max ( f(1:n) ) );
    fprintf ( 1, '  Min(F) = %g\n', min ( f(1:n) ) );

    know = 0;
    [ xs, know ] = p00_sol ( problem, m, know );
    if ( know ~= 0 )
      fs = p00_f ( problem, m, 1, xs );
      fprintf ( 1, '  F(X*)  = %g\n', fs );
    else
      fprintf ( 1, '  X* is not given.\n' );
    end

  end

  return
end
