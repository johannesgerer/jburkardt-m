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
%    31 March 2010
%
%  Author:
%
%    John Burkardt
%
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run QUAD_SCRIPT locally.\n' );
%
%  BATCH sends the script for execution.
%
  job = batch ( 'quad_script', ...
    'Configuration', 'local', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'quad_fun' }, ...
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
%  value = estimated integral.
%
  load ( job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated integral = %f\n', value );
  fprintf ( 1, '  Exact integral    is %f\n', pi );
  fprintf ( 1, '  Error is             %e\n', abs ( value - pi ) );
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( job );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );