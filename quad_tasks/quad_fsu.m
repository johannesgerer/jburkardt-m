%% QUAD_FSU uses the fsuClusterMatlab command to run the QUAD computation.
%
%  Discussion:
%
%    The arguments to fsuClusterMatlab mean:
%
%    [] allows us to specify an output directory;
%    [] allows us to specify switches to the MOAB queue handler, such as more time.
%    's' indicates this is a "simple" (task) job;
%    'w' indicates that the MATLAB session should wait for completion;
%    task_num is the number of tasks;
%    @quad_task indicates the function we want to execute;
%    args contains input arguments to each of the tasks.
%
%    The function "quad_task" must correspond to a MATLAB M-file "quad_task.m"
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
%    02 April 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_FSU:\n' );
  fprintf ( 1, '  Use MATLAB''s task computing on the FSU HPC cluster.\n' );
  fprintf ( 1, '  Here, we estimate an integral over an interval by\n' );
  fprintf ( 1, '  dividing the interval into subintervals.\n' );

  n = 100001;
  a = 0.0;
  b = 1.0;

  task_num = 4;
  n_task = 1 + floor ( ( n - 1 ) / task_num );

  args = {};
  for task = 1 : task_num
    a_task = ( task - 1 ) / task_num;
    b_task =   task       / task_num;
    args{task} = { n_task, a_task, b_task };
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call fsuClusterMatlab:\n' );

  results = fsuClusterMatlab ( [], [], 's', 'w', task_num, @quad_task, args )
%
%  Convert RESULTS, which is a TASK_NUMx1 cell array, to
%  an ordinary MATLAB numeric array.
%
  results = cell2mat ( results );
%
%  Now we can use the SUM command to get our result.
%
  q = sum ( results );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Quadrature result is %f\n', q );
