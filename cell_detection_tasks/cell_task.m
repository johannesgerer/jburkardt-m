function cell_task ( work_directory, index )

%*****************************************************************************80
%
%% CELL_TASK carries out the task of detecting cells in one image.
%
%  Discussion:
%
%    This function opens a particular file, reads the image data it contains,
%    applies an image processing operation to the data, and writes the
%    processed image to a new file.
%
%    The first input file will have the name 'AT3_1m4_01.tif' and the
%    first output file will have the name 'BT3_1m4_01.tif'.
%
%    The input images are gray-scale microscropic photographs of a
%    number of cells.
%
%    The image processing is intended to detect the edges of the cells
%    and to highlight them with a white line.
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
%  Parameters:
%
%    Input, string WORK_DIRECTORY, the directory where the files are.
%
%    Input, integer INDEX, the index of the file to be processed by this task.
%

%
%  Move to the working directory.
%
  cd ( work_directory )
%
%  The name of the input file is by inserting the frame index
%  into a standard string.  The format we use guarantees that
%  small integers are left-padded with zeros.
%
  filename_input = sprintf ( 'AT3_1m4_%02d.tif', index );
%
%  Get the image data.
%
  I = imread ( filename_input );
%
%  The EDGE function is used to seek edges in an intensity (gray scale)
%  image.  'Sobel' is one method of doing this.
%  On the first call, we are interested in getting the threshold value.
%
%  Use |edge| and the Sobel operator to calculate the threshold
% value.
%
%  Using the ~ symbol to indicate that the given output quantity
%  is not to be stored does not work in older versions of MATLAB.

  [ ~, threshold ] = edge ( I, 'sobel' );
%
%  Now we adjust the threshold value and call EDGE again, but this
%  time we ignore the output threshold, we only want the binary mask.
%
  threshold = 0.5 * threshold;
  [ BW, ~ ] = edge ( I, 'sobel', threshold );
%
%  Create vertical and horizontal flat linear structural
%  elements of length 3.
%
  se90 = strel ( 'line', 3, 90 );
  se0 = strel ( 'line', 3, 0 );
%
%  Dilate the image.
%
  BWdilate = imdilate ( BW, [ se90 se0 ] );
%
%  Suppress light structures connected to the border.
%
  BWnobord = imclearborder ( BWdilate, 4 );
%
%  Remove small objects (of less than 200 pixels).
%
  BWopen = bwareaopen ( BWnobord, 200 );
%
%  Perform binary closure (dilation + erosion).
%
  BWclose = bwmorph ( BWopen, 'close' );
%
%  Fill holes in the image.
%
  BWfill = imfill ( BWclose, 'holes' );
%
%  Find the pixels that represent the perimeters of objects in the
%  black and white image.
%
  BWoutline = bwperim ( BWfill );
%
%  Form the new image by starting with the original image, and then marking
%  the cell perimeters with white (color 255).
%
  segmentedCells = I;
  segmentedCells(BWoutline) = 255;
%
%  Create the output filename.
%
  filename_output = sprintf ( 'BT3_1m4_%02d.tif', index );
%
%  Write the file.
%
  imwrite ( segmentedCells, filename_output, 'tif' );

  return
end
