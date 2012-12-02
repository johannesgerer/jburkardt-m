function rgb_3x3 = image_denoise_rgb_3x3 ( rgb )

%*****************************************************************************80
%
%% IMAGE_DENOISE_RGB_3X3 filters out noise from an RGB image.
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
%    Input, uint8 RGB(:,:,3), the noisy RGB data.
%
%    Output, uint8 RGB_3X3(:,:,3), the RGB data for the filtered image.
%
  r = image_denoise_gray_3x3 ( rgb(:,:,1) );
  g = image_denoise_gray_3x3 ( rgb(:,:,2) );
  b = image_denoise_gray_3x3 ( rgb(:,:,3) );

  rgb_3x3 = zeros ( size ( rgb ) );

  rgb_3x3 = uint8 ( rgb_3x3 );

  rgb_3x3(:,:,1) = r(:,:);
  rgb_3x3(:,:,2) = g(:,:);
  rgb_3x3(:,:,3) = b(:,:);

  return
end
