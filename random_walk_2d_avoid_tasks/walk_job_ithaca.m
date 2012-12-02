%% WALK_JOB_ITHACA solves the random walk computation as multiple tasks.
%
%  Discussion:
%
%    Each random walk is given a unique seed to initialize the random number
%    generator, and is allowed to take up to STEP_MAX steps as it tries to
%    make a self-avoiding walk on a 2D lattice.
%
%    Each task returns the number of steps it actually took, and its final
%    distance from the origin.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2010
%
%  Author:
%
%    John Burkardt
%
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'WALK_JOB_ITHACA\n' );
  fprintf ( 1, '  Set up and execute a job of independent tasks.\n' );
  fprintf ( 1, '  Each task tries to construct a self avoiding random walk\n' );
  fprintf ( 1, '  of length STEP_MAX, in 2D, using a given input seed.\n' );
  fprintf ( 1, '  Each task returns STEP_NUM, how many steps it took,\n' );
  fprintf ( 1, '  and DIST, how far it got.\n' );
%
%  Define the job.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Define the job:\n' );

  job = createJob ( ...
    'configuration', 'ithaca_2009b', ...
    'FileDependencies', { 'walk_task.m' } );

  walk_num = 100;
  step_max = 200;
%
%  Define the tasks that constitute the job.
%
  task_num = walk_num;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Define %d tasks:\n', task_num );

  for task = 1 : task_num
    seed = 123456789 + task;
    task_id = createTask ( job, @walk_task, 2, { step_max, seed } );
  end
%
%  Submit the job.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Submit the job:\n' );

  submit ( job );
%
%  Wait for results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wait for job to finish:\n' );

  timestamp ( );
  wait ( job );
  timestamp ( );
%
%  The following commands will capture and print error messages
%  from the tasks, if something bad occurs.
%
  errmsgs = get ( job.Tasks, {'ErrorMessage'} );
  nonempty = ~cellfun ( @isempty, errmsgs );
  celldisp ( errmsgs(nonempty) );
%
%  Retrieve the output from all tasks.
%
  results = getAllOutputArguments ( job );
%
%  The output is a cell array.
%  We much prefer a MATLAB matrix!
%
  results = cell2mat ( results );
%
%  Plot steps versus distance squared.
%
  step_num = results(:,1);
  dist2 = results(:,2).^2;

  figure ( 1 )
  plot ( step_num, dist2, 'o', 'LineWidth', 2 );
  xlabel ( 'Number of steps' )
  ylabel ( 'Distance Squared' )
  title ( 'Distance Squared per Number of Steps' )
%
%  Get a least squares fit to Log(S) versus Log(D2).
%
  ls = log ( step_num );
  ld = log ( dist2 );
  c = polyfit ( ls, ld, 1 );
  log_fit = c(1) * ls + c(2);
  plot ( ls, ld, 'bo', ls, log_fit, 'r-', 'LineWidth', 2 )
  xlabel ( 'Log of Steps' )
  ylabel ( 'Log of Squared Distance' )
  title ( 'Least Squares fit to Log Distance Squared per Log Number of Steps' )
%
%  Clean up by freeing memory associated with the job.
%
  destroy ( job );
%
%  Terminate;
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WALK_JOB_ITHACA:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
