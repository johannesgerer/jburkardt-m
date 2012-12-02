function gray_news = image_denoise_gray_news ( gray )

%*****************************************************************************80
%
%% IMAGE_DENOISE_GRAY_NEWS filters out noise from a gray scale image.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, uint8 GRAY(:,:), the noisy grayscale data.
%
%    Output, uint8 GRAY_NEWS(:,:), the grayscale data for the filtered image.
%
  [ m, n ] = size ( gray );
  gray3d = zeros ( 5, m, n );
%
%  For pixel (I,J), GRAY3D(*,I,J) contains the current pixel value
%  and the four neighboring values.
%
  gray3d(1,:,:) =             gray;
  gray3d(2,:,:) = circshift ( gray, [  1,  0 ] );
  gray3d(3,:,:) = circshift ( gray, [ -1,  0 ] );
  gray3d(4,:,:) = circshift ( gray, [  0,  1 ] );
  gray3d(5,:,:) = circshift ( gray, [  0, -1 ] );
%
%  By taking the median of the 5 values, we hope to drop any noisy pixels.
%
  gray3d = median ( gray3d );
%
%  The MEDIAN command returned a 3D array with a first dimension of 1.
%  For convenience, we suppress the first dimension.
%
  gray_news(:,:) = gray3d(1,:,:);
%
%  GRAY is a UINT8 array.  The MEDIAN operation returned a DOUBLE value.
%  So we have to convert the array back to UINT8.
%
  gray_news = uint8 ( gray_news );

  return
end
