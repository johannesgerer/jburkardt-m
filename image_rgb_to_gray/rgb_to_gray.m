function gray = rgb_to_gray ( rgb, equal )

%*****************************************************************************80
%
%% RGB_TO_GRAY returns a grayscale version of an RGB image.
%
%  Discussion:
%
%    An RGB image is an (M,N,3) array.
%
%    A grayscale image is an (M,N) array.
%
%    A grayscale version of an RGB image can be made by averaging
%    the RGB components of each pixel.
%
%    A more sophisticated approach uses the luminance function:
%
%      GRAY = 0.2126 * R + 0.7152 * G + 0.0722 * B
%
%    which attempts to better model the contributions to brightness
%    of the different colors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, uint8 RGB(M,N,3), the original data.
%
%    Input, logical EQUAL, is TRUE (1) if the R, G and B channels
%    are to be assigned equal weight.  EQUAL is FALSE by default.
%
%    Output, uint8 GRAY(M,N), the grayscale version of the data.
%
  if ( nargin < 1 )
    error ( 'RGB_TO_GRAY - Fatal error! Missing RGB input argument.' )
  end

  if ( nargin < 2 )
    equal = 0;
  end

  if ( equal )
    v = [ 1, 1, 1 ]' / 3;
  else
    v = [ 0.2126, 0.7152, 0.0722 ]';
  end
%
%  This is really a matrix multiply, but the obvious equation
%    gray = rgb * v
%  is illegal according to MATLAB.
%
  gray = uint8 ( double ( rgb(:,:,1) ) * v(1) ...
               + double ( rgb(:,:,2) ) * v(2) ...
               + double ( rgb(:,:,3) ) * v(3) );

  return
end
