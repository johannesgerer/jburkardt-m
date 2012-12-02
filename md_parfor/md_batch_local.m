%% MD_BATCH_LOCAL uses the BATCH command to run the MD code locally.
%
%  Discussion:
%
%    The MD code is a function, so first we must write a script
%    called MD_SCRIPT that runs the function.
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
  workers = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MD_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run MD_SCRIPT locally.\n' );
%
%  BATCH defines the job and submits it.
%
  my_job = batch ( 'md_script', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'md_fun' }, ...
    'Configuration', 'local', ...
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
%  LOAD makes the job's workspace available.
%
%  pe     = potential energy.
%  ke     = kinetic energy.
%  e_lost = relative energy loss.
%
  load ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Potential energy      = %f\n', pe );
  fprintf ( 1, '  Kinetic energy        = %f\n', ke );
  fprintf ( 1, '  Relative energy error = %e\n', e_lost );
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MD_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
