function wtime_test03 ( )

%*****************************************************************************80
%
%% TEST03 times the vectorized EXP routine.
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
  n_log_min = 12;
  n_log_max = 22;
  n_min = 2^n_log_min;
  n_max = 2^n_log_max;
  n_rep = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  Time unvectorized operations:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  for i = 1 : n \n' );
  fprintf ( 1, '    y(i) =        x(i)  \n' );
  fprintf ( 1, '    y(i) = PI *   x(i) )\n' );
  fprintf ( 1, '    y(i) = sqrt ( x(i) )\n' );
  fprintf ( 1, '    y(i) = exp  ( x(i) )\n' );
  fprintf ( 1, '  end\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data vectors will be of minimum size %d\n', n_min );
  fprintf ( 1, '  Data vectors will be of maximum size %d\n', n_max );
  fprintf ( 1, '  Number of repetitions of the operation: %d\n', n_rep );

  for func = 1 : 4

    for i_rep = 1 : n_rep

      for n_log = n_log_min : n_log_max

        n = 2^( n_log );

        x = rand ( n, 1 );
        y = zeros ( n, 1 );

        seconds = wtime ( );

        if ( func == 1 )
          for i = 1 : n
            y(i) = x(i);
          end
        elseif ( func == 2 )
          for i = 1 : n
            y(i) = pi * x(i);
          end
        elseif ( func == 3 )
          for i = 1 : n
            y(i) = sqrt ( x(i) );
          end
        elseif ( func == 4 )
          for i = 1 : n
            y(i) = exp ( x(i) );
          end
        end

        delta(n_log,i_rep) = wtime ( ) - seconds;

      end

    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Timing results:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    Vector Size  Rep #1        Rep #2        ' );
    fprintf ( 1, 'Rep #3        Rep #4        Rep #5\n' );
    fprintf ( 1, '\n' );
    for n_log = n_log_min : n_log_max
      n = 2^( n_log );
      fprintf ( 1, '  %8d  %12f  %12f  %12f  %12f  %12f\n', ...
        n, delta(n_log,1:n_rep) );
    end

  end

  return
end
