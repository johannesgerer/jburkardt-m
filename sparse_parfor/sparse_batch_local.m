%% SPARSE_BATCH_LOCAL uses the BATCH command to run the SPARSE code locally.
%
%  Discussion:
%
%    The SPARSE code is a function, so first we must write a script
%    called SPARSE_SCRIPT that runs the function.
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
  fprintf ( 1, 'SPARSE_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run SPARSE_SCRIPT locally.\n' );
%
%  The BATCH command sends the script for execution.
%
  my_job = batch ( 'sparse_script', ...
    'Configuration', 'local', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'sparse_fun' }, ...
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
%  Here is where we can use the LOAD command
%  to make the script's workspace available.
%  The SPARSE function returns a matrix called A_sparse.
%
  load ( my_job );
%
%  Get the size of the matrix, just to verify it is here.
%
  size ( A_sparse );
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
