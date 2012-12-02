function gray = gray_salt_and_pepper ( gray, level )

%*****************************************************************************80
%
%% GRAY_SALT_AND_PEPPER adds salt-and-pepper noise to a grayscale image.
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
%    Input, uint8 GRAY(:,:), the image.
%
%    Input, real LEVEL, the level of noise to add, between 0.0 (none)
%    and 1.0 (all).
%
%    Output, uint8 GRAY(:,:), the image with added noise.  A fraction of
%    about LEVEL of the pixels have been reset to 0 or 255.
%
  [ m, n ] = size ( gray );

  r = rand ( m, n );

  i0 = find ( r <= level / 2 );
  gray ( i0 ) = 0;

  i255 = find ( 1 - level / 2 <= r );
  gray ( i255 ) = 255;

  return
end
