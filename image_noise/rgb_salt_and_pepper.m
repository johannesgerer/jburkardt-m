function rgb = rgb_salt_and_pepper ( rgb, level )

%*****************************************************************************80
%
%% RGB_SALT_AND_PEPPER adds salt-and-pepper noise to an RGB image.
%
%  Discussion:
%
%    This function creates noise in the R, G and B channels independently.
%
%    An alternative procedure would only set all or none of the R, G and
%    B values to extremes at any pixel, resulting in black or white
%    noise pixels.
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
%    Input, uint8 RGB(:,:,3), the image.
%
%    Input, real LEVEL, the level of noise to add, between 0.0 (none)
%    and 1.0 (all).
%
%    Output, uint8 RGB(:,:,3), the image with added noise.  A fraction of
%    about LEVEL of the values in the RGB array have been reset to 0 or 255.
%
  [ m, n, k ] = size ( rgb );

  r = rand ( m, n, k );

  i0 = find ( r <= level / 2 );
  rgb ( i0 ) = 0;

  i255 = find ( 1 - level / 2 <= r );
  rgb ( i255 ) = 255;

  return
end
