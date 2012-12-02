%% CONTRAST2_POOL runs the contrast2 example interactively with MATLABPOOL.
%

%
%  Read a black and white image.
%
  x = imread ( 'surfsup.tif' );
%
%  Display the image.
%
  figure ( 1 )
  imshow ( x )
%
%  Filter the image on the client.
%
  xf = nlfilter ( x, [3,3], @contrast_enhance );
  xf = uint8 ( xf );
%
%  Display the filtered image.
%
  figure ( 2 )
  imshow ( xf )
%
%  You can save the filtered file.
%
  if ( 0 )
    imwrite ( xf, 'surfsup_filtered_spmd.tif', 'TIF' )
  end
%
%  Get 4 "labs" to work on the job.
%
  matlabpool open local 4
  y = contrast2_fun ( x );
  matlabpool close
%
%  Display the SPMD filtered image.
%  The bars that showed up in the contrast_spmd example should be gone now,
%  because the workers were able to share data.
%
  figure ( 3 )
  imshow ( y )
%
%  You can save the filtered file.
%
  if ( 0 )
    imwrite ( y, 'surfsup_filtered_spmd.tif', 'TIF' )
  end
%
%  Display the original, single filtered, and SPMD filtered versions.
%
  figure ( 4 );

  subplot ( 1, 3, 1 );
  imshow ( x );
  title ( 'Original image' );

  subplot ( 1, 3, 2 );
  imshow( xf );
  title( 'Filtered on Client' );

  subplot ( 1, 3, 3 );
  imshow ( y );
  title ( 'Filtered on 4 SPMD Workers' );
