function gray = image_threshold ( gray, a )

%*****************************************************************************80
%
%% IMAGE_THRESHOLD resets gray pixels to black or white based on a threshold.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, uint8 GRAY(:,:), the original data.
%
%    Input, uint8 A, the threshold value.  Pixels of value A or less
%    are reset to black.  0 <= A <= 255
%
%    Output, uint8 GRAY(:,:), the image data, whose pixels are now black
%    or white.
%
  i = find ( gray <= a );
  j = find ( a < gray );

  gray(i) = 0;
  gray(j) = 255;

  return
end


