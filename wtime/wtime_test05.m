function wtime_test05 ( )

%*****************************************************************************80
%
%% TEST05 times the matrix multiplication problem problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2010
%
%  Author:
%
%    John Burkardt
%
  l_log_min = 1;
  l_log_max = 5;
  l_min = 4^l_log_min;
  l_max = 4^l_log_max;
  rep_num = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  Time the matrix multiplication problem.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute C = A * B\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  where\n' );
  fprintf ( 1, '    A is an L by M matrix,\n' );
  fprintf ( 1, '    B is an M by N matrix,\n' );
  fprintf ( 1, '  and so\n' );
  fprintf ( 1, '    C is an L by N matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Minimum value of L = M = N = %d\n', l_min );
  fprintf ( 1, '  Maximum value of L = M = N = %d\n', l_max );
  fprintf ( 1, '  Number of repetitions of the operation: %d\n', rep_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use triple loop for matrix multiplication.\n' );

  for rep = 1 : rep_num

    for l_log = l_log_min : l_log_max - 1

      l = 4^( l_log );
      m = l;
      n = l;

      a = rand ( l, l );
      b = rand ( l, l );

      seconds = wtime ( );

      for i = 1 : l
        for j = 1 : l
          c(i,j) = 0.0;
          for k = 1 : l
            c(i,j) = c(i,j) + a(i,k) * b(k,j);
          end
        end
      end

      delta(l_log,rep) = wtime ( ) - seconds;

    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Timing results using nested loops:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Vector Size  Rep #1        Rep #2        Rep #3        ' );
  fprintf ( 1, 'Rep #4        Rep #5\n' );
  fprintf ( 1, '\n' );
  for l_log = l_log_min : l_log_max - 1
    l = 4^( l_log );
    fprintf ( 1, '  %8d  %12f  %12f  %12f  %12f  %12f\n', ...
      l, delta(l_log,1:rep_num) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use C = A * B matrix multiplication.\n' );

  for rep = 1 : rep_num

    for l_log = l_log_min : l_log_max - 1

      l = 4^( l_log );
      m = l;
      n = l;

      a = rand ( l, l );
      b = rand ( l, l );

      seconds = wtime ( );

      c = a * b;

      delta(l_log,rep) = wtime ( ) - seconds;

    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Timing results using C = A * B:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Vector Size  Rep #1        Rep #2        Rep #3        ' );
  fprintf ( 1, 'Rep #4        Rep #5\n' );
  fprintf ( 1, '\n' );
  for l_log = l_log_min : l_log_max - 1
    l = 4^( l_log );
    fprintf ( 1, '  %8d  %12f  %12f  %12f  %12f  %12f\n', ...
      l, delta(l_log,1:rep_num) );
  end

  return
end
