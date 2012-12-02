%% COLLATZ_BATCH_ITHACA uses the BATCH command to run the COLLATZ code on the VT ITHACA cluster.
%
%  Discussion:
%
%    The COLLATZ code is a function, so first we must write a script
%    called COLLATZ_SCRIPT that runs the function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2010
%
%  Author:
%
%    John Burkardt
%
  clear all

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_BATCH_ITHACA\n' );
  fprintf ( 1, '  Run the Collatz problem on Ithaca.\n' );
%
%  BATCH defines the job and submits it.
%
  my_job = batch ( 'collatz_script', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'collatz_fun' }, ...
    'Configuration', 'ithaca_2009b', ...
    'CurrentDirectory', '/home/burkardt/matlab', ...
    'matlabpool', 4 );
%
%  WAIT pauses MATLAB session til the job completes.
%
  wait ( my_job );
%
%  DIARY displays messages printed during execution.
%
  diary ( my_job );
%
%  LOAD makes the workspace of the job accessible.
%
%  The variable we are interested in is called JMAX.
%
  load ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum path length = %d\n', j_max );
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_BATCH_ITHACA\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
