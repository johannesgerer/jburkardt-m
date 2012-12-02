function [ x, y, z ] = image_fun ( )

%*****************************************************************************80
%
%% IMAGE_FUN processes an image using SPMD.
%
%  Discussion:
%
%    Only 3 SPMD workers should be allocated, one each for the
%    R, G, and B components of the image.
%
%    The image "balloons.tif" is read in by the client, and distributed.
%    This RGB image is stored as a (:,:,3) array, and by default, is
%    distributed by the last dimension.  That means the first three workers
%    get the R, G and B arrays and if there are more workers they get nothing.
%
%    Each worker applies the MEDFILT2 operation to its data.
%
%    The client then assembles the filtered R, G, and B data back into
%    a (:,:,3) array and returns that as the output argument.
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
%
%  Parameters:
%
%    Output, uint8 X(:,:,3), the RGB data for the original image.
%
%    Output, uint8 Y(:,:,3), the RGB data for the noisy image.
%
%    Output, uint8 Z(:,:,3), the RGB data for the filtered image.
%

%
%  Read an image X.
%  This happens to be a color image, and is stored as 480x640x3 array.
%
  x = imread ( 'balloons.tif' );
%
%  Create an image Y by adding "salt and pepper" noise to X.
%
  y = imnoise ( x, 'salt & pepper', 0.30 );
%
%  Make YD, a distributed version of Y, by copying a separate
%  portion of Y to each worker.
%
  yd = distributed ( y );
%
%  Each worker creates YL, a name for its portion of the array.
%  It then applies the median filter to YL, using a 3x3 block of
%  data around each pixel.
%
  spmd
    yl = getLocalPart ( yd );
    yl = medfilt2 ( yl, [ 3 3 ] );
  end
%
%  The client retrieves the data from each worker.
%  Assuming three workers were used, and the data was divided by
%  the last dimension (R,G,B), then the three pieces are
%  tacked together as follows:
%
  z        = yl{1};
  z(:,:,2) = yl{2};
  z(:,:,3) = yl{3};

  return
end
