function rgb_news = image_denoise_rgb_news ( rgb )

%*****************************************************************************80
%
%% IMAGE_DENOISE_RGB_NEWS filters out noise from an RGB image.
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
%    Output, uint8 RGB_NEWS(:,:,3), the RGB data for the filtered image.
%
  r = image_denoise_gray_news ( rgb(:,:,1) );
  g = image_denoise_gray_news ( rgb(:,:,2) );
  b = image_denoise_gray_news ( rgb(:,:,3) );

  rgb_news = zeros ( size ( rgb ) );

  rgb_news = uint8 ( rgb_news );

  rgb_news(:,:,1) = r(:,:);
  rgb_news(:,:,2) = g(:,:);
  rgb_news(:,:,3) = b(:,:);

  return
end
