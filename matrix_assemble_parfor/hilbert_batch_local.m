%% HILBERT_BATCH_LOCAL uses the BATCH command to run the HILBERT code locally.
%
%  Discussion:
%
%    The HILBERT code is a function, so first we must write a script
%    called HILBERT_SCRIPT that runs the function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2012
%
%  Author:
%
%    John Burkardt
%
  clear

  workers = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HILBERT_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run HILBERT_SCRIPT locally.\n' );
%
%  The BATCH command sends the script for execution.
%
  my_job = batch ( 'hilbert_script', ...
    'Configuration', 'local', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'hilbert_fun' }, ...
    'matlabpool', workers );
%
%  WAIT pauses the MATLAB session til the job completes.
%
  wait ( my_job );
%
%  DIARY displays any messages printed during execution.
%
  diary ( my_job );
%
%  The LOAD command makes the script's workspace available.
%  The script created the array "a", so let's ask for its size
%  just to show that it really was created.
%
  load ( my_job );

  size ( a )
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HILBERT_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
