%% ODE_BATCH_LOCAL uses the BATCH command to run the ODE code locally.
%
%  Discussion:
%
%    The ODE code is a function, so first we must write a script
%    called ODE_SCRIPT that runs the function.
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
  fprintf ( 1, 'ODE_BATCH_LOCAL:\n' );
  fprintf ( 1, '  Run ODE_SCRIPT locally.\n' );
%
%  BATCH defines the job and sets it for execution.
%
  my_job = batch ( 'ode_script', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'ode_fun', 'ode_system' }, ...
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
%  LOAD makes the script's workspace available.
%
%  bVals = B values
%  kVals = K values
%  peakVals = peak values
%
  load ( my_job );
%
%  Display the results.
%
  ode_display ( bVals, kVals, peakVals );
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ODE_BATCH_LOCAL:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
