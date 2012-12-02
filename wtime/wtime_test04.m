function wtime_test04 ( )

%*****************************************************************************80
%
%% TEST04 times the 2D nearest neighbor problem.
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
  n_log_min = 10;
  n_log_max = 20;
  n_min = 2^n_log_min;
  n_max = 2^n_log_max;
  n_rep = 5;
  n_test = 1;

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

  for i_rep = 1 : n_rep

    for n_log = n_log_min : n_log_max

      n = 2^( n_log );

      x = rand ( 2, n );
      y = rand ( 2, 1 );

      seconds = wtime ( );

      dist_min = Inf;
      i_min = 0;
      for i = 1 : n
        dist_i =  ( x(1,i) - y(1,1) )^2 + ( x(2,i) - y(2,1) )^2;
        if ( dist_i < dist_min )
          dist_min = dist_i;
          i_min = i;
        end
      end

      delta(n_log,i_rep) = wtime ( ) - seconds;

    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Timing results:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Vector Size  Rep #1        Rep #2        Rep #3        ' );
  fprintf ( 1, 'Rep #4        Rep #5\n' );
  fprintf ( 1, '\n' );
  for n_log = n_log_min : n_log_max
    n = 2^( n_log );
    fprintf ( 1, '  %8d  %12f  %12f  %12f  %12f  %12f\n', ...
      n, delta(n_log,1:n_rep) );
  end

  return
end
