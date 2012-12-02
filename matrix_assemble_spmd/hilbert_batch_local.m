%% HILBERT_BATCH_LOCAL uses the BATCH command to run the HILBERT code locally.
%
%  Discussion:
%
%    The HILBERT code is a function, so first we must write a script
%    called HILBERT_SCRIPT that runs the function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2011
%
%  Author:
%
%    John Burkardt
%
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HILBERT_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run HILBERT_SCRIPT locally.\n' );
%
%  BATCH sends the script for execution.
%
  job = batch ( 'hilbert_script', ...
    'Configuration', 'local', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'hilbert_fun' }, ...
    'matlabpool', 7 );
%
%  WAIT pauses MATLAB session til the job completes.
%
  tic
  wait ( job );
  toc
%
%  DIARY displays any messages printed during execution.
%
  diary ( job );
%
%  LOAD makes the script's workspace available.
%
%  "a" is the computed matrix.
%
  load ( job );

  a_sum = sum ( sum ( a ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sum of entries = %f\n', a_sum );
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( job );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HILBERT_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
