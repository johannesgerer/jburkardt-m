function test_opt_test02 ( )

%*****************************************************************************80
%
%% TEST_OPT_TEST02 evaluates the objective function at each starting point.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 October 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_OPT_TEST02\n' );
  fprintf ( 1, '  For each problem, evaluate the function\n' );
  fprintf ( 1, '  at the starting point.\n' );
%
%  Get the number of problems.
%
  problem_num = p00_problem_num ( );

  for problem = 1 : problem_num

    if ( problem == 25 )
      p = 0.0;
      p25_p_set ( p );
    end

    if ( problem == 36 )
      seed = 123456789;
      p36_p_init ( seed );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem %d\n', problem );

    title = p00_title ( problem );
    fprintf ( 1, '  %s\n', title );

    n = p00_n ( problem );

    n_min = n;

    if ( n < 0 )
      n_min = abs ( n_min );
      n = max ( n_min, 4 );
    end

    fprintf ( 1, '  N_MIN = %d\n', n_min );
    fprintf ( 1, '  N =     %d\n', n );
    fprintf ( 1, '\n' );
 
    x = p00_start ( problem, n );

    f_start = p00_f ( problem, n, x );

    fprintf ( 1, '  F(X_START) = %g\n', f_start );

    [ know, x ] = p00_sol ( problem, n );

    if ( 0 < know )
      f_sol = p00_f ( problem, n, x );
      fprintf ( 1, '  F(X_SOL) =  %g\n', f_sol );
    end

    if ( problem == 25 )

      p = 1.0;
      p25_p_set ( p );

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Repeat problem with P = %f\n', p );

      x = p00_start ( problem, n );

      f_start = p00_f ( problem, n, x );

      fprintf ( 1, '  F(X_START) = %g\n', f_start );

      [ know, x ] = p00_sol ( problem, n );

      if ( 0 < know )
        f_sol = p00_f ( problem, n, x );
        fprintf ( 1, '  F(X_SOL) =  %g\n', f_sol );
      end
        
    end

  end

  return
end
