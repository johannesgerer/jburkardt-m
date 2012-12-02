function test_opt_test05 ( )

%*****************************************************************************80
%
%% TEST05 carries out a simple gradient method.
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
  max_step = 5;
  reduce_max = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  For each problem, take a few steps of \n' );
  fprintf ( 1, '  the gradient method.\n' );
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

    x = p00_start ( problem, n );

    r8vec_transpose_print ( n, x, '  Starting X:' );

    f = p00_f ( problem, n, x );
    fprintf ( 1, '  Starting F(X) = %f\n', f );

    terminate = 0;

    for i = 1 : max_step

      s = 1.0;

      reduce = 0;

      g = p00_g ( problem, n, x );

      r8vec_transpose_print ( n, g, '  Gradient(X):' );

      if ( all ( g(1:n) == 0.0 ) )
        fprintf ( 1, '  Terminate because of zero gradient.\n' );
        break
      end

      x2 = zeros ( n, 1 );

      while ( 1 )

        x2(1:n,1) = x(1:n,1) - s * g(1:n,1);
 
        f2 = p00_f ( problem, n, x2 );

        if ( f2 <= 0.95 * f )
          break
        end

        reduce = reduce + 1;
        fprintf ( 1, '  Reject step, F = %f\n', f2 );

        if ( reduce_max < reduce )
          fprintf ( 1, '\n' );
          fprintf ( 1, '  Repeated step reductions do not help.\n' );
          fprintf ( 1, '  Problem abandoned.\n' );
          terminate = 1;
          break
        end

        s = s / 4.0;

      end

      if ( terminate )
        break
      end

      x(1:n,1) = x2(1:n,1);
      f = f2;

      r8vec_transpose_print ( n, x, '  New X:' );

      f = p00_f ( problem, n, x );
      fprintf ( 1, '  New F(X) = %f\n', f );

    end

  end

  return
end
