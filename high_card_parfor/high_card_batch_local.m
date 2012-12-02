%% HIGH_CARD_BATCH_LOCAL uses the BATCH command to run the HIGH_CARD code locally.
%
%  Discussion:
%
%    The HIGH_CARD code is a function, so first we must write a script
%    called HIGH_CARD_SCRIPT that runs the function.
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
  fprintf ( 1, 'HIGH_CARD_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run HIGH_CARD_SCRIPT locally.\n' );
%
%  The BATCH command sends the script for execution.
%
  my_job = batch ( 'high_card_script', ...
    'Configuration', 'local', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'high_card_fun' }, ...
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
%  The HIGH_CARD function returns a vector called P.
%  We can plot that vector here.
%
  load ( my_job );
%
%  Plot the results.
%
  high_card_display ( m, p );
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HIGH_CARD_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
