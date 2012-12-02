%% HELLO_BATCH_LOCAL uses the BATCH command to run the HELLO code locally.
%
%  Discussion:
%
%    The HELLO code is a function, so first we must write a script
%    called HELLO_SCRIPT that runs the function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2011
%
%  Author:
%
%    John Burkardt
%
  clear

  workers = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HELLO_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run HELLO_SCRIPT locally.\n' );
%
%  The BATCH command sends the script for execution.
%
  my_job = batch ( 'hello_script', ...
    'Configuration', 'local', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'hello_fun' }, ...
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
%  Here is where we would ordinarily use the LOAD command
%  to make the script's workspace available.
%  This job does not produce any data in the workspace,
%  so no LOAD is needed.
%
%  load ( my_job );
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HELLO_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
