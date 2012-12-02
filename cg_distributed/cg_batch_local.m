%% CG_BATCH_LOCAL uses the BATCH command to run the CG code locally.
%
%  Discussion:
%
%    The CG code is a function, so first we must write a script
%    called CG_SCRIPT that runs the function.
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
  fprintf ( 1, 'CG_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run CG_SCRIPT locally.\n' );
%
%  BATCH sends the script for execution.
%
  job = batch ( 'cg_script', ...
    'Configuration', 'local', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'cg_fun' }, ...
    'matlabpool', 7 );
%
%  WAIT pauses MATLAB session til the job completes.
%
  wait ( job );
%
%  DIARY displays any messages printed during execution.
%
  diary ( job );
%
%  LOAD makes the script's workspace available.
%
%  zeta = estimated eigenvalue.
%  x = estimated eigenvector.
%
  load ( job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated eigenvalue = %f\n', zeta );
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( job );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CG_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
