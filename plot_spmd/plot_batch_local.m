%% PLOT_BATCH_LOCAL uses the BATCH command to run the PLOT code locally.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 April 2010
%
%  Author:
%
%    John Burkardt
%
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PLOT_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run PLOT_SCRIPT locally.\n' );
%
%  Set the number of workers in the pool.
%
  n = 7;
%
%  BATCH sends the script for execution.
%
  job = batch ( 'plot_script', ...
    'Configuration', 'local', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'plot_fun' }, ...
    'matlabpool', n );
%
%  WAIT pauses the MATLAB session til the job completes.
%
  wait ( job );
%
%  DIARY displays any messages printed during execution.
%
  diary ( job );
%
%  LOAD makes the script's workspace available.
%
%  X = output #1,.
%  Y = output #2,.
%
  load ( job );
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( job );
%
%  Plot the sine curve.
%
  color = [ 'r', 'g', 'b', 'c', 'y', 'm', 'k' ];

  figure

  hold on
  for i = 1 : n
    c = color ( mod ( i - 1, 7 ) + 1 );
    plot ( X(i,:), Y(i,:), c, 'LineWidth', 3 );
    plot ( [2*pi*i/n,2*pi*i/n], [-1,+1], 'k' );
  end

  xlabel ( 'X' )
  ylabel ( 'Y' )
  plot_title = sprintf ( 'Sine curve plotted by %d SPMD workers', n );
  title ( plot_title )

  hold off

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PLOT_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
