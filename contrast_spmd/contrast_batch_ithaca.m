%% CONTRAST_BATCH_ITHACA uses the BATCH command to run the CONTRAST code on the Ithaca cluster.
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
  fprintf ( 1, 'CONTRAST_BATCH_ITHACA\n' );
  fprintf ( 1, '  Run CONTRAST_SCRIPT on Ithaca.\n' );
%
%  Read a black and white image and filter it locally.
%
  x = imread ( 'surfsup.tif' );
  xf = nlfilter ( x, [3,3], @contrast_enhance );
  xf = uint8 ( xf );
%
%  Set the number of workers.
%
  n = 4;
%
%  BATCH sends the script for execution.
%
  job = batch ( 'contrast_script', ...
    'Configuration', 'ithaca_2009b', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'contrast_fun', 'contrast_enhance', 'surfsup.tif' }, ...
    'CurrentDirectory', '/home/burkardt/matlab', ...
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
%
%  DESTROY cleans up data about the job we no longer need.
%
  destroy ( job );
%
%  Display the original, single filtered, and SPMD filtered versions.
%
  figure ( 1 );

  subplot ( 1, 3, 1 );
  imshow ( x );
  title ( 'Original image' );

  subplot ( 1, 3, 2 );
  imshow( xf );
  title( 'Filtered on Client' );

  subplot ( 1, 3, 3 );
  imshow ( y );
  title ( 'Filtered on 4 SPMD Workers' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CONTRAST_BATCH_ITHACA\n' );
  fprintf ( 1, '  Normal end of execution.\n' );