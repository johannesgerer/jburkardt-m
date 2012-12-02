%% QUAD_BATCH_LOCAL uses the BATCH command to run the QUAD code locally.
%
%  Discussion:
%
%    The QUAD code is a function, so first we must write a script
%    called QUAD_SCRIPT that runs the function.
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
  fprintf ( 1, 'QUAD_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run QUAD_SCRIPT locally.\n' );
%
%  The BATCH command sends the script for execution.
%
  my_job = batch ( 'quad_script', ...
    'Configuration', 'local', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'quad_fun' }, ...
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
%  LOAD makes the script's workspace available:
%
%  value = estimated integral.
%
  load ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated integral = %f\n', value );
  fprintf ( 1, '  Exact integral    is %f\n', pi );
  fprintf ( 1, '  Error is             %e\n', abs ( value - pi ) );
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
