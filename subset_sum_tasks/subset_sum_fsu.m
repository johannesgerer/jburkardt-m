%% SUBSET_SUM_FSU uses the fsuClusterMatlab command to run the SUBSET_SUM computation.
%
%  Discussion:
%
%    The arguments to fsuClusterMatlab mean:
%
%    [] allows us to specify an output directory;
%    [] allows us to specify switches to the MOAB queue handler, such as more time.
%    's" indicates this is a "simple" (task) job;
%    'w' indicates that the MATLAB session should wait for completion;
%    4 is the number of processors requested;
%    @subset_sum_task indicates the function we want to execute;
%    args contains input arguments to each of the tasks.
%
%    The function "subset_sum_task" must correspond to a MATLAB M-file "subset_sum_task.m"
%    and that file must be in MATLAB's path.
%
%    The easiest way to ensure that the file is in MATLAB's path is to
%    create a subdirectory called "matlab" immediately below your home directory,
%    and place the function file there (as well as any other files needed by the job).
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBSET_SUM_FSU:\n' );
  fprintf ( 1, '  Use MATLAB''s task computing on the FSU HPC cluster.\n' );
  fprintf ( 1, '  Here, we try all possible combinations to find a\n' );
  fprintf ( 1, '  solution of a subset_sum problem.\n' );
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
%  Compute the number of combinations to check.
%
  combos = fix ( 2^length(weights) );
%
%  Divide the range [0, COMBOS-1] among the tasks.
%
  task_num = 4;

  args = {};
  endValue = -1;
  for task = 1 : task_num
    startValue = endValue + 1;
    endValue = ( task / task_num ) * combos - 1;
    args{task} = { weights, target, [startValue, endValue] };
  end
%
%  Run the job on the cluster.
%  Here, the number of tasks equals the number of workers requested.
%  But we are allowed to have MORE tasks than workers.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call fsuClusterMatlab\n' );

  results = fsuClusterMatlab ( [], [], 's', 'w', ...
    task_num, @subset_sum_task, args )
%
%  Display the results (if any) from the tasks.
%
  fprintf ( 1, '\n' );
  for task = 1 : task_num
    if ~isempty ( results{task,1} )
      fprintf ( 1, '  Task %d found the following solution:\n', task );
      disp ( 'weight indices'); disp(results{task,1});
      disp ( 'weight_values'); disp(results{task,2});
    else
      fprintf ( 1, '  Task %d did not find a solution.\n', task );
    end
  end
