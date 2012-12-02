function y = contrast_enhance ( x )

%*****************************************************************************80
%
%% CONTRAST_ENHANCE applies contrast enhancement to a pixel.
%
%  Discussion:
%
%    This function accepts an array representing a pixel
%    neighborhood, and computes a value for the center pixel according to
%    a contrast enhancement algorithm. 
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
%    Input, uint8 X(N,N), the pixel values.
%
%    Output, double Y, the new value to be assigned to the pixel
%    at X((N+1)/2,(N+1)/2) for enhanced contrast.
%

%
%  Convert image data from UINT8 to DOUBLE.
%
  x = double ( x );
%
%  Get the size of the array.
%
  n = size ( x, 1 );
%
%  Calculate the average value.
%
  x_average = sum ( sum ( x(:,:) ) ) / n / n;
%
%  The constant S should be chosen to be greater than 1;
%
  s = 3.0;
%
%  Compute the new value for the center pixel.
%
  y = ( 1.0 - s ) * x_average + s * x((n+1)/2,(n+1)/2);

  return
end


