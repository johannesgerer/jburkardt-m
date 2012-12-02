%% CELL_FSU uses the fsuClusterMatlab command to run the CELL computation.
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
%    @cell_task indicates the function we want to execute;
%    args contains input arguments to each of the tasks.
%
%    The function "cell_task" must correspond to a MATLAB M-file "cell_task.m"
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
  fprintf ( 1, 'CELL_FSU:\n' );
  fprintf ( 1, '  Use MATLAB''s task computing on the FSU HPC cluster.\n' );
  fprintf ( 1, '  Here, we want to apply an image processing operation\n' );
  fprintf ( 1, '  (identify edges) to each of 10 biological images.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The first image file is AT3_1m4_01.tif.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is a current directory listing:\n' );
  ls

  task_num = 10;
%
%  All we need to tell a task is its index.  That tells it what image to work on.
%
  directory = '/panfs/storage.local/gunz/home/jburkardt/matlab/cell_detection_tasks';

  args = {};
  for task = 1 : task_num
    args{task} = { directory, task };
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call fsuClusterMatlab\n' );

  results = fsuClusterMatlab ( [], [], 's', 'w', task_num, @cell_task, args );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  If the operation was successful, then 10 new image files\n' );
  fprintf ( 1, '  have been created in the working directory.\n' );
  fprintf ( 1, '  BT3_1m4_01.tif will be the processed version of AT3_1m4_01.tif\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is a current directory listing:\n' );
  ls
