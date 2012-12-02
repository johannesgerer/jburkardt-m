%% FACE_BATCH_LOCAL uses the BATCH command to run the code locally.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2010
%
%  Author:
%
%    Gene Cliff, John Burkardt
%
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FACE_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run FACE_SCRIPT locally.\n' );
%
%  Set the number of workers.
%
  n = 4;
%
%  BATCH sends the script for execution.
%
  job = batch ( 'face_script', ...
    'Configuration', 'local', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'face_fun', 'GRID.mat' }, ...
    'matlabpool', n );
%
%  WAIT pauses the MATLAB session til the job completes.
%
  wait ( job );
%
%  DIARY displays any messages printed during execution.
%
  diary ( job );
%
%  LOAD makes the script's workspace available.
%
%  y = output #1.
%
  load ( job );

  face_num = size ( F_conn, 2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of triangles on boundary is %d\n', face_num );
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( job );
%
%  Load the MAT file containing the grid coordinates as the variable
%  "Grid" and the element connectivity as the variable "e_conn".
%
  load GRID;
%
%  Display the surface triangulation.
%
  i_pl = setdiff ( 1:3, ii );

  triplot ( F_conn', Grid(:, i_pl(1)), Grid(:, i_pl(2)) );

  if ( ii == 1 )
    title ( 'Triangular faces on X boundary plane' );
    xlabel ( '- Y axis -' );
    ylabel ( '- Z axis -' );
  elseif ( ii == 2 )
    xlabel ( '- X axis -' );
    title ( 'Triangular faces on Y boundary plane' );
    ylabel ( '- Z axis -' );
  elseif ( ii == 3 )
    xlabel ( '- X axis -' );
    ylabel ( '- Y axis -' );
    title ( 'Triangular faces on Z boundary plane' );
  end

  axis equal
  axis tight
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FACE_BATCH_LOCAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
