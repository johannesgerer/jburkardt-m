function timer_tictoc_test01 ( )

%*****************************************************************************80
%
%% TEST01 times the RAND routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2006
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  Time the MATLAB RAND routine:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    x = rand(n,1);\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data vectors will be of minimum size %d\n', n_min );
  fprintf ( 1, '  Data vectors will be of maximum size %d\n', n_max );
  fprintf ( 1, '  Number of repetitions of the operation: %d\n', n_rep );

  for i_rep = 1 : n_rep

    for n_log = n_log_min : n_log_max

      n = 2^n_log;

      tic;

      x = rand(n,1);

      delta(n_log,i_rep) = toc;

    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01 Results:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Vector Size  Rep #1        Rep #2        Rep #3        ' );
  fprintf ( 1, 'Rep #4        Rep #5\n' );
  fprintf ( 1, '\n' );

  for n_log = n_log_min : n_log_max
    n = 2^n_log;
    fprintf ( 1, '%10d', n );
    for j = 1 : n_rep
      fprintf ( '%14f', delta(n_log,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
