%% PRIME_BATCH_LOCAL uses the BATCH command to run the PRIME code locally.
%
%  Discussion:
%
%    The PRIME code is a function, so first we must write a script
%    called PRIME_SCRIPT that runs the function.
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
  fprintf ( 1, 'PRIME_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run PRIME_SCRIPT locally.\n' );
%
%  BATCH defines the job and sends it for execution.
%
  my_job = batch ( 'prime_script', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'prime_fun' }, ...
    'Configuration', 'local', ...
    'matlabpool', 3 );
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
%  total = total number of primes.
%
  load ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Total number of primes = %d\n', total );
%
%  The DESTROY command cleans up data about the job we no longer need.
%
  destroy ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRIME_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
