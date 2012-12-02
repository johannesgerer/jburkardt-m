%% COLLATZ_BATCH_LOCAL uses the BATCH command to run the COLLATZ code locally.
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
%    23 May 2012
%
%  Author:
%
%    John Burkardt
%
  workers = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_BATCH_LOCAL\n' );
  fprintf ( 1, '  Call COLLATZ_SCRIPT to run the Collatz problem locally.\n' );
%
%  BATCH defines the job and submits it.
%
  my_job = batch ( 'collatz_script', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'collatz_fun' }, ...
    'Configuration', 'local', ...
    'matlabpool', workers );
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
  fprintf ( 1, 'COLLATZ_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
