function rgb_contrast = contrast_gray ( rgb, s )

%*****************************************************************************80
%
%% CONTRAST_RGB enhances the contrast in an RGB image.
%
%  Discussion:
%
%    The current contrast at pixel (I,J) is the difference between
%    its value P(I,J) and the average AVERAGE(I,J) of its eight
%    immediate neighbors.
%
%    The enhanced image replaces each pixel value by:
%
%      p(i,j) <= s * p(i,j) + ( 1 - s ) * average(i,j)
%
%    where C is the contrast parameter.
%
%    Since this operation assumes a 1-pixel deep layer around each
%    processed pixel, the border pixels can't be handled in quite the
%    same way.  To avoid strange artifacts, the border pixels are kept
%    at their input values, although a more careful algorithm could
%    enhance their contrast as well.
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
%    Input, uint8 RGB(:,:,3), the original data.
%
%    Input, real S, the sharpness.  Normally, S is greater than 1.
%    S < 1, the image is blurred.
%    S = 1, the image is unchanged.
%    1 < S, the contrast is heightened.
%
%    Output, uint8 RGB_CONTRAST(:,:,3), the data after contrast enhancement.
%
  r = contrast_gray ( rgb(:,:,1), s );
  g = contrast_gray ( rgb(:,:,2), s );
  b = contrast_gray ( rgb(:,:,3), s );

  rgb_contrast = zeros ( size ( rgb ) );

  rgb_contrast = uint8 ( rgb_contrast );

  rgb_contrast(:,:,1) = r(:,:);
  rgb_contrast(:,:,2) = g(:,:);
  rgb_contrast(:,:,3) = b(:,:);

  return
end
