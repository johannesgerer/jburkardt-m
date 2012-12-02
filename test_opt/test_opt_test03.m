function test_opt_test03 ( )

%*****************************************************************************80
%
%% TEST_OPT_TEST03 compares the exact and approximate gradient vectors.
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
  fprintf ( 1, 'TEST_OPT_TEST03\n' );
  fprintf ( 1, '  For each problem, compare the exact and\n' );
  fprintf ( 1, '  approximate gradients at the starting point.\n' );
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

      seed = 123456789;
      [ x, seed ] = r8vec_uniform_01 ( n, seed );

    else

      x = p00_start ( problem, n );

    end

    g = p00_g ( problem, n, x );

    g_dif = p00_gdif ( problem, n, x );

    r8vec_transpose_print ( n, x, '  X:' );
    r8vec_transpose_print ( n, g, '  G:' );
    r8vec_transpose_print ( n, g_dif, '  G (approximated):' );

    if ( problem == 25 )

      p = 1.0;
      p25_p_set ( p );

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Repeat problem with P = %f\n', p );

      x = p00_start ( problem, n );

      g = p00_g ( problem, n, x );

      g_dif = p00_gdif ( problem, n, x );

      r8vec_transpose_print ( n, x, '  X:' );
      r8vec_transpose_print ( n, g, '  G:' );
      r8vec_transpose_print ( n, g_dif, '  G (approximated):' );

    end

  end

  return
end
