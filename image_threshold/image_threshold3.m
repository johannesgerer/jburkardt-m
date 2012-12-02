function gray = image_threshold3 ( gray, a, b )

%*****************************************************************************80
%
%% IMAGE_THRESHOLD3 resets gray pixels to white based on a threshold.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, uint8 GRAY(:,:), the original data.
%
%    Input, uint8 A, B, the threshold values.  Pixels of value less
%    than A or greater than B are reset to white.  0 <= A <= B <= 255
%
%    Output, uint8 GRAY(:,:), the thresholded image data.
%
  i = find ( gray < a );
  j = find ( b < gray );

  gray(i) = 255;
  gray(j) = 255;

  return
end


