function test_opt_test04 ( )

%*****************************************************************************80
%
%% TEST_OPT_TEST04 compares the exact and approximate Hessian matrices.
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
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_OPT_TEST04\n' );
  fprintf ( 1, '  For each problem, compare the exact and\n' );
  fprintf ( 1, '  approximate Hessians at the starting point.\n' );
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

    title = p00_title ( problem );

    n = p00_n ( problem );

    n_min = n;

    if ( n < 0 )
      n_min = abs ( n_min );
      n = max ( n_min, 4 );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem %d\n', problem );
    fprintf ( 1, '  %s\n', title );
    fprintf ( 1, '  N = %d\n', n );

    if ( 1 )

      [ x, seed ] = r8vec_uniform_01 ( n, seed );

    else

      x = p00_start ( problem, n );

    end

    r8vec_transpose_print ( n, x, '  X:' );

    h = p00_h ( problem, n, x );

    r8mat_print ( n, n, h, '  H:' );

    h_dif = p00_hdif ( problem, n, x );

    r8mat_print ( n, n, h_dif, '  H (approximated):' );

    if ( problem == 25 )

      p = 1.0;
      p25_p_set ( p )

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Repeat problem with P = %f\n', p );

      x = p00_start ( problem, n );

      r8vec_transpose_print ( n, x, '  X:' );

      h = p00_h ( problem, n, x );

      r8mat_print ( n, n, h, '  H:' );

      h_dif = p00_hdif ( problem, n, x );

      r8mat_print ( n, n, h_dif, '  H (approximated):' );

    end

  end

  return
end
