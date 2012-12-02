%% OPT_BATCH_LOCAL uses the BATCH command to run the OPT code locally.
%
%  Discussion:
%
%    The OPT code is a function, so first we must write a script
%    called OPT_SCRIPT that runs the function.
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
  fprintf ( 1, 'OPT_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run OPT_SCRIPT locally.\n' );
%
%  BATCH sends the script for execution.
%
  my_job = batch ( 'opt_script', ...
    'Configuration', 'local', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'opt_fun' }, ...
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
%  LOAD makes the script's workspace available:
%
%  z_star = optimal control.
%  PAR = problem parameters.
%  exit = positive if calculation was successful.
%
  load ( my_job );
%
%  On successful conclusion, display the plot.
%
  if ( 0 <= exit && isfield ( PAR, 'plot' ) )
    feval ( PAR.plot, z_star, PAR )
  end

%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'OPT_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );