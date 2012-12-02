%% WALK_FSU uses the fsuClusterMatlab command to run the WALK computation.
%
%  Discussion:
%
%    The arguments to fsuClusterMatlab mean:
%
%    [] allows us to specify an output directory;
%    [] allows us to specify switches to the MOAB queue handler, such as more time.
%    's' indicates this is a "simple" (task) job;
%    'w' indicates that the MATLAB session should wait for completion;
%    task_num is the number of processors requested;
%    @walk_task indicates the function we want to execute;
%    args contains input arguments to each of the tasks.
%
%    The function "walk_task" must correspond to a MATLAB M-file "walk_task.m"
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
%    02 April 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WALK_FSU:\n' );
  fprintf ( 1, '  Use MATLAB''s task computing on the FSU HPC cluster.\n' );
  fprintf ( 1, '  Here, we carry out 100 random walks of at most 200 steps.\n' );
  fprintf ( 1, '  If the walk crosses itself, it is terminated.\n' );
  fprintf ( 1, '  We are interested in the steps taken versus distance squared.\n' );

  task_num = 100;
  step_max = 200;

  args = {};
  for task = 1 : task_num
    seed = 123456789 + task;
    args{task} = { step_max, seed };
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call fsuClusterMatlab\n' );

  results = fsuClusterMatlab ( [], [], 's', 'w', task_num, @walk_task, args );
%
%  Convert output cell array to numeric array.
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
  figure ( 2 )
  ls = log ( step_num );
  ld = log ( dist2 );
  c = polyfit ( ls, ld, 1 );
  log_fit = c(1) * ls + c(2);
  plot ( ls, ld, 'bo', ls, log_fit, 'r-', 'LineWidth', 2 )
  xlabel ( 'Log of Steps' )
  ylabel ( 'Log of Squared Distance' )
  title ( 'Least Squares fit to Log Distance Squared per Log Number of Steps' )

