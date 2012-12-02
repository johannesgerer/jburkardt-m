function timer_cputime_test04 ( )

%*****************************************************************************80
%
%% TEST04 times the 2D nearest neighbor problem.
%
%  Discussion:
%
%    For the MATLAB implementation of this test, the unvectorized
%    test limits had to be DRASTICALLY reduced.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 December 2005
%
%  Author:
%
%    John Burkardt
%
  n_log_min = 10;
  n_log_max = 18;
  n_min = 2^n_log_min;
  n_max = 2^n_log_max;
  n_rep = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  Time the 2D nearest neighbor problem.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Given X(2,N) and Y(2),\n' );
  fprintf ( 1, '    find X(2,*) closest to Y(2).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    for i = 1 : n\n' );
  fprintf ( 1, '      if distance ( x(2,i), y ) < minimum so far\n' );
  fprintf ( 1, '        x_min = x(2,i)\n' );
  fprintf ( 1, '    end\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data vectors will be of minimum size %d\n', n_min );
  fprintf ( 1, '  Data vectors will be of maximum size %d\n', n_max );
  fprintf ( 1, '  Number of repetitions of the operation: %d\n', n_rep );

  x = rand (2,n_max);
  y = rand(1,2);

  for i_rep = 1 : n_rep

    for n_log = n_log_min : n_log_max

      n = 2^n_log;

      time1 = cputime;

      dist_min = r8_huge ( );
      i_min = 0;
      for i = 1 : n
        dist_i = sum ( ( x(1:2,i) - y(1:2)' ).^2 );
        if ( dist_i < dist_min )
          dist_min = dist_i;
          i_min = i;
        end
      end

      time2 = cputime;

      delta(n_log,i_rep) = time2 - time1;

    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04 Results:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Vector Size  Rep #1        Rep #2        Rep #3        ' );
  fprintf ( 1, 'Rep #4        Rep #5\n' );
  fprintf ( 1, '\n' );
  for n_log = n_log_min : n_log_max
    n = 2^n_log;
    fprintf ( 1, '%10d', n );
    for j = 1 : n_rep
      fprintf ( 1, '%14f', delta(n_log,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
