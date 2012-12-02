%% SATISFY_BATCH_LOCAL uses the BATCH command to run the SATISFY code locally.
%
%  Discussion:
%
%    The SATISFY code is a function, so first we must write a script
%    called SATISFY_SCRIPT that runs the function.
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
  fprintf ( 1, 'SATISFY_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run SATISFY_SCRIPT locally\n' );
%
%  BATCH defines the job and sends it for execution.
%
  my_job = batch ( 'satisfy_script', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'satisfy_fun' }, ...
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
%  solutions = the solutions array.
%
  load ( my_job );

  [ solution_num, n ] = size ( solutions );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of variables was %d\n', n );
  fprintf ( 1, '  Number of solutions found was %d\n', solution_num );
  for i = 1 : solution_num
    fprintf ( 1, '  %2d:  ', i );
    for j = 1 : n
      fprintf ( 1, '%2d', solutions(i,j) );
    end
    fprintf ( 1, '\n' );
  end
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( my_job );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SATISFY_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
