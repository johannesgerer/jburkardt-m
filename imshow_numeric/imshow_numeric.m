function imshow_numeric ( A )

%*****************************************************************************80
%
%% IMSHOW_NUMERIC displays a numeric 2D array as a grayscale image.
%
%  Discussion:
%
%    A numeric 2D array, typically of type "double", cannot be displayed by
%    the Image Processing Toolbox function imshow.
%
%    This is because the data is of the wrong type (signed real numbers 
%    rather than unsigned integers) and generally also in an unsuitable 
%    range.  Typical image data might range from 0 to 255, for instance.
%
%    This function makes a quick and simple conversion of numeric data to
%    a format of the appropriate type and range for display by imshow,
%    and displays the data as a grayscale image.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(M,N), the numeric array to be displayed.
%
  a_min = min ( min ( A ) );
  a_max = max ( max ( A ) );

  if ( a_min == a_max ) 
    A = 127;
  else
    A = floor ( 255 * ( A - a_min ) / ( a_max - a_min ) );
  end

  A = uint8 ( A );

  imshow ( A );

  return
end
