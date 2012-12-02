function wtime_test01 ( )

%*****************************************************************************80
%
%% TEST01 times the MATLAB RAND function.
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
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  Time the RAND function:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    x = rand ( n, 1 );\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data vectors will be of minimum size %d\n', n_min );
  fprintf ( 1, '  Data vectors will be of maximum size %d\n', n_max );
  fprintf ( 1, '  Number of repetitions of the operation: %d\n', n_rep );

  for i_rep = 1 : n_rep

    for n_log = n_log_min : n_log_max

      n = 2^( n_log );

      seconds = wtime ( );

      x = rand ( n, 1 );

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
