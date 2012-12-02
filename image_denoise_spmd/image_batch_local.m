%% IMAGE_BATCH_LOCAL uses the BATCH command to run the IMAGE code locally.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 April 2010
%
%  Author:
%
%    John Burkardt
%
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'IMAGE_BATCH_LOCAL\n' );
  fprintf ( 1, '  Run IMAGE_SCRIPT locally\n' );
%
%  Set the number of workers in the pool.
%
  n = 3;
%
%  BATCH sends the script for execution.
%
  job = batch ( 'image_script', ...
    'Configuration', 'local', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'image_fun', 'balloons.tif' }, ...
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
%  LOAD makes the script's workspace avaiable.
%
%  x = output #1.
%  y = output #2.
%  z = output #3.
%
  load ( job );
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( job );
%
%  Display the original, noisy, and filtered versions.
%
  figure;

  subplot ( 1, 3, 1 );
  imshow ( x );
  title ( 'Original image' );

  subplot ( 1, 3, 2 );
  imshow( y );
  title( 'Noisy Image' );

  subplot ( 1, 3, 3 );
  imshow ( z );
  title ( 'Median Filtered Image' );
