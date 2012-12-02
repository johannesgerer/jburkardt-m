%% HEATED_PLATE_BATCH_LOCAL uses the BATCH command to run the HEATED_PLATE code locally.
%
%  Discussion:
%
%    The HEATED_PLATE code is a function, so first we must write a script
%    called HEATED_PLATE_SCRIPT that runs the function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 December 2010
%
%  Author:
%
%    John Burkardt
%
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEATED_PLATE_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run the HEATED_PLATE_SCRIPT locally.\n' );
%
%  BATCH defines the job and sends it for execution.
%
  my_job = batch ( 'heated_plate_script', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'heated_plate_fun' }, ...
    'Configuration', 'local', ...
    'matlabpool', 4 );
%
%  WAIT pauses the MATLAB session til the job completes.
%
  wait ( my_job );
%
%  DIARY displays any messages printed during execution.
%
  diary ( my_job );
%
%  LOAD makes the script's workspace available.
%  This function doesn't return any values to examine;
%  the results are in the file "solution.txt".
%
  load ( my_job );
%
%  The DESTROY command cleans up data about the job we no longer need.
%
  destroy ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEATED_PLATE_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
