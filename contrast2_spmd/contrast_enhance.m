function y = contrast_enhance ( x )

%*****************************************************************************80
%
%% CONTRAST_ENHANCE applies contrast enhancement to a pixel.
%
%  Discussion:
%
%    This function accepts a (2N+1)x(2N+1) array representing a pixel
%    neighborhood, and computes a value for the center pixel according to
%    a contrast enhancement algorithm. 
%

%
%  Convert image data from UINT8 to DOUBLE.
%
  x = double ( x );
%
%  Get the size of the array.
%
  [ a, b ] = size ( x );
%
%  Get N.
% 
  n = ( a - 1 ) / 2;
%
%  Calculate the average value.
%
  x_average = sum ( sum ( x(:,:) ) ) / ( 2 * n + 1 ) / ( 2 * n + 1 );
%
%  The constant C should be chosen to be greater than 1;
%
  c = 3.0;
%
%  Compute the new value for the center pixel.
%
  y = ( 1.0 - c ) * x_average + c * x(n+1,n+1);

  return
end


