%% SUBSET_SUM_JOB_LOCAL distributes trials of subset_sum problem to multiple tasks.
%
%  Discussion:
%
%    Each task is given a portion of the range of possible combinations to check.
%
%    Each task returns a result that works or empty values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 May 2012
%
%  Author:
%
%    John Burkardt
%
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBSET_SUM_JOB_LOCAL\n' );
  fprintf ( 1, '  Set up and execute a job of independent tasks.\n' );
  fprintf ( 1, '  We seek a subset of weights that sum to a given target.\n' );
  fprintf ( 1, '  Each task examines a specific range of subsets.\n' );
%
%  Define the problem data.
%
  target = 2463098;

  weights = [ ...
    518533, 1037066, 2074132, 1648264, 796528, ...
   1593056,  686112, 1372224,  244448, 488896, ...
    977792, 1955584, 1411168,  322336, 644672, ...
   1289344,   78688,  157376,  314752, 629504, ...
   1259008 ];
%
%  Create the job.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Define the job:\n' );

  job = createJob ( ...
    'configuration', 'local', ...
    'FileDependencies', { 'subset_sum_task.m' } );
%
%  Compute the number of combinations to check.
%
  combos = fix ( 2^length(weights) );
%
%  Divide the range [0, COMBOS-1] among the tasks.
%
  task_num = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Define %d tasks:\n', task_num );

  endValue = -1;

  for task = 1 : task_num

    startValue = endValue + 1;
    endValue = ( task / task_num ) * combos - 1;

    task_id = createTask ( job, @subset_sum_task, 2, ...
                          { weights, target, [startValue, endValue] } );
  end
%
%  Submit the job.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Submit the job:\n' );

  submit ( job );
%
%  Wait for the job to finish.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wait for the job:\n' );
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
%  Retrieve the results from all the tasks.
%
  results = getAllOutputArguments ( job );
%
%  Display the results (if any) from the tasks.
%
  fprintf ( 1, '\n' );
  for task = 1 : task_num
    if ~isempty ( results{task,1} )
      disp ( 'weights');       disp(results{task,1});
      disp ( 'weight_values'); disp(results{task,2});
    end
  end
%
%  Clean up by freeing memory associated with the job.
%
  destroy ( job );
%
%  Terminate;
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBSET_SUM_JOB_LOCAL:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

