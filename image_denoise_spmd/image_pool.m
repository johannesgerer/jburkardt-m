%% IMAGE_POOL demonstrates MATLAB's SPMD command for parallel programming.
%
%  Discussion:
%
%    The function reads in an image and adds noise to it.
%    It then divides the image up into R, G and B portions and expects
%    3 workers to filter the portions.
%    The function then returns the original, noisy, and filtered versions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 March 2010
%
%  Author:
%
%    John Burkardt
%    Gene Cliff
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'IMAGE_POOL\n' );
  fprintf ( 1, '  Demonstrate the use of MATLAB''s SPMD command\n' );
  fprintf ( 1, '  to carry out a parallel computation.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The client reads a noisy RGB image.\n' );
  fprintf ( 1, '  Each worker filters one color.\n' );
  fprintf ( 1, '  The client reassembles the data.\n' );
  fprintf ( 1, '\n' );

  n = 3;

  matlabpool ( 'open', 'local', n );

  [ x, y, z ] = image_fun ( );

  matlabpool close
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
