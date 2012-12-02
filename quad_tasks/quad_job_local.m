%% QUAD_JOB_LOCAL divides the quadrature problem into tasks.
%
%  Discussion:
%
%    Each task is given a portion of the interval [0,1] over which
%    to integrate.
%
%    Each task returns the estimated integral over its subinterval.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2010
%
%  Author:
%
%    John Burkardt
%
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_JOB_LOCAL\n' );
  fprintf ( 1, '  Set up and execute a job of independent tasks.\n' );
  fprintf ( 1, '  The computation of an integral over [0,1] is divided\n' );
  fprintf ( 1, '  into tasks integrating from A to B.\n' );
  fprintf ( 1, '  The integral estimate is the sum of the task results.\n' );
%
%  Define the job.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Define the job:\n' );

  job = createJob ( ...
    'configuration', 'local', ...
    'FileDependencies', { 'quad_task.m' } );

  task_num = 10;
  n = 100001;
  n_per_task = 1 + ( n - 1 ) / task_num;
%
%  Define the tasks that constitute the job.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Define %d tasks:\n', task_num );

  for task = 1 : task_num
    a = ( task - 1 ) / task_num;
    b =   task       / task_num;
    task_id = createTask ( job, @quad_task, 1, { n, a, b } );
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

  timestamp ( )
  wait ( job );
  timestamp ( )
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
%  Sum the results to get the estimate.
%
  quad = sum ( results(:,1) );
  exact = pi;
  err = abs ( quad - exact );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Exact integral = %f\n', exact );
  fprintf ( 1, '  Estimate =       %f\n', quad );
  fprintf ( 1, '  Error =          %e\n', err );
%
%  Clean up by freeing memory associated with the job.
%
  destroy ( job );
%
%  Terminate;
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_JOB_LOCAL:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
