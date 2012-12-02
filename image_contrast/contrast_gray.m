function gray_contrast = contrast_gray ( gray, s )

%*****************************************************************************80
%
%% CONTRAST_GRAY enhances the contrast in a grayscale image.
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
%    Input, uint8 GRAY(:,:), the original data.
%
%    Input, real S, the sharpness.  Normally, S is greater than 1.
%    S < 1, the image is blurred.
%    S = 1, the image is unchanged.
%    1 < S, the contrast is heightened.
%
%    Output, uint8 GRAY_CONTRAST(:,:), the image data after grayscale
%    enhancement.
%
  [ m, n ] = size ( gray );
  gray3d = zeros ( 8, m, n );
%
%  For pixel (I,J), GRAY3D(*,I,J) contains the 8 neighboring values.
%
  gray = double ( gray );

  gray3d(1,:,:) = circshift ( gray, [ -1, -1 ] );
  gray3d(2,:,:) = circshift ( gray, [ -1,  0 ] );
  gray3d(3,:,:) = circshift ( gray, [ -1,  1 ] );
  gray3d(4,:,:) = circshift ( gray, [  0, -1 ] );
  gray3d(5,:,:) = circshift ( gray, [  0,  1 ] );
  gray3d(6,:,:) = circshift ( gray, [  1, -1 ] );
  gray3d(7,:,:) = circshift ( gray, [  1,  0 ] );
  gray3d(8,:,:) = circshift ( gray, [  1,  1 ] );
%
%  Average the values.
%
  gray_average = sum ( gray3d ) / 8.0;
%
%  The SUM operation on an (L,M,N) array returns a (1,M,N) array.
%  We really need to work with a strictly 2D array, and this
%  is the best I can do to make MATLAB happy.  No doubt there's
%  a nifty way, too.
%
  gray_average_2d(1:m,1:n) = gray_average(1,1:m,1:n);
%
%  Compute the new value for the center pixel.
%
  gray_contrast = ( 1.0 - s ) * gray_average_2d(:,:) + s * gray;

  gray_contrast = uint8 ( gray_contrast );
%
%  The pixels on the boundary have been handled incorrectly.
%  A more careful treatment could correctly enhance their contrast too.
%  Instead, just restore them to their original values.
%
  gray_contrast(1,:) = gray(1,:);
  gray_contrast(m,:) = gray(m,:);
  gray_contrast(:,1) = gray(:,1);
  gray_contrast(:,n) = gray(:,n);

  return
end


