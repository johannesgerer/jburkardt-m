%% CELL_JOB_LOCAL sets up a job of tasks making animation frames.
%
%  Discussion:
%
%    There are 10 TIF files, constituting a time sequence of images
%    of cells under a microscope.
%
%    Each file is to be processed in such a way that the cells are
%    detected and indicated by a white boundary.
%
%    The processed data is then to be saved in a new TIF file.
%
%    The processing of each file is independent of the others.
%    This means that MATLAB's batch processing facility can be used,
%    involving one job of 10 tasks.
%
%    This example is based on a MathWorks example script and data files.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2010
%
%  Author:
%
%    John Burkardt
%
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CELL_JOB_LOCAL\n' );
  fprintf ( 1, '  Set up and execute a job of independent tasks.\n' );
  fprintf ( 1, '  Each task opens a TIF file that is an image of cells,\n' );
  fprintf ( 1, '  marks the border of each cell in white,\n' );
  fprintf ( 1, '  and writes the modified image to a new TIF file.\n' );
%
%  There are exactly 10 frames.
%
%  We could set this value explicitly:
%
  if ( 0 )

    frame_total = 10;
%
%  but here is a way to count the files automatically.
%
  else
    p = which ( 'AT3_1m4_01.tif' );
    filelist = dir ( [ fileparts(p) filesep 'AT3_1m4_*.tif' ] );
    frame_total = length ( { filelist.name } );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  There are %d files to process.\n', frame_total );
  fprintf ( 1, '  The first file is called          "AT3_1m4_01.tif",\n' );
  fprintf ( 1, '  and its processed version will be "BT3_1m4_01.tif".\n' );
%
%  Define the job.
%  Our image files are on the local machine, so our processing must also
%  be here.
%
  work_directory = '/Users/burkardt/public_html/m_src/cell_detection_tasks';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Define the job:\n' );

  job = createJob ( ...
    'configuration', 'local', ...
    'FileDependencies', { 'cell_task.m' } );
%
%  Define the tasks that constitute the job.
%  The value of TASK is enough to identify the file to be processed.
%
  task_num = frame_total;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Define %d tasks:\n', task_num );
  fprintf ( 1, '  Working directory is "%s".\n', work_directory );

  for task = 1 : task_num
    task_id = createTask ( job, @cell_task, 0, { work_directory, task } );
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
%  There are no output arguments from the tasks.  Otherwise, we
%  would gather and inspect them here.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The individual frame files have been created.\n' );
%
%  Clean up by freeing memory associated with the job.
%
  destroy ( job );
%
%  Terminate;
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CELL_JOB_LOCAL:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
