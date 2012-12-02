function timer_tictoc_test02 ( )

%*****************************************************************************80
%
%% TEST02 times the vectorized EXP routine.
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
  n_log_min = 12;
  n_log_max = 22;
  n_min = 2^n_log_min;
  n_max = 2^n_log_max;
  n_rep = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  Time vectorized operations:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    y(1:n) =        x(1:n)  \n' );
  fprintf ( 1, '    y(1:n) = PI *   x(1:n)  \n' );
  fprintf ( 1, '    y(1:n) = sqrt ( x(1:n) )\n' );
  fprintf ( 1, '    y(1:n) = exp  ( x(1:n) )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data vectors will be of minimum size %d\n', n_min );
  fprintf ( 1, '  Data vectors will be of maximum size %d\n', n_max );
  fprintf ( 1, '  Number of repetitions of the operation: %d\n', n_rep );

  for func = 1 : 4

    for i_rep = 1 : n_rep
  
      for n_log = n_log_min : n_log_max

        n = 2^n_log;

        x = rand(n,1);

        tic;

        if ( func == 1 )
          y(1:n) = x(1:n);
        elseif ( func == 2 )
          y(1:n) = pi * x(1:n);
        elseif ( func == 3 )
          y(1:n) = sqrt ( x(1:n) );
        elseif ( func == 4 )
          y(1:n) = exp ( x(1:n) );
        end

        delta(n_log,i_rep) = toc;

      end

    end

    fprintf ( 1, '\n' );
    fprintf ( 1, 'Test02 Results:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Vector Size  Rep #1        Rep #2        ' );
    fprintf ( 1, 'Rep #3        Rep #4        Rep #5\n' );
    fprintf ( 1, '\n' );

    for n_log = n_log_min : n_log_max
      n = 2^n_log;
      fprintf ( 1, '%10d', n );
      for j = 1 : n_rep
        fprintf ( 1, '%14f', delta(n_log,1:n_rep) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end
