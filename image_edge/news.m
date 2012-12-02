function news ( filename, thresh )

%*****************************************************************************80
%
%% NEWS demonstrates the NEWS stencil for edge detection.
%
%  Discussion:
%
%    Given a black and white image A, which we regard as an M by N array
%    of pixels, we want to produce an array E of the same shape, which
%    contains information describing the location of edges.
%
%    A simple algorithm for trying to detect edges in an array that
%    represents an image is the NEWS scheme.  For each pixel A(C),
%    we consider its North, East, West, and South pixel neighbors.  The
%    indexing of arrays and images do not correspond, so we will use
%    these directions instead:
%
%             A(N)
%              |
%              |
%      A(W)---A(C)---A(E)
%              |
%              |
%             A(S)
%
%    Entry E(C) of the edge array will be computed by
%
%      E(C) = abs ( A(N) - A(S) ) + abs ( A(E) - A(W) )
%
%    Pixels of A that represent edges will tend to have high values
%    of E, while pixels that are interior to a region of roughly the
%    same shade will tend to have low values.
%
%    Thus, an edge detection scheme would use the NEWS stencil to
%    compute the E array, determine E_MAX, the maximum entry in E,
%    choose some threshold value E_THRESH, and declare pixel A(I,J)
%    to be associated with an edge whenever E(I,J) is greater than E_THRESH.
%
%    In this program, we demonstrate the NEWS stencil using a PGM
%    grayscale image of coins.  At the end, we use the edge information
%    to produce a color image in which the edges of the coins have been
%    outlined in red.
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
%    Input, string FILENAME, the name of the file containing the image.
%    The image should be a grayscale image, not color!
%
%    Input, integer THRESH, the threshhold for the edge detection.
%    0 <= THRESH <= 255 is required.  A value of 50 is the default.
%    Higher values are more selective.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NEWS\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate the NEWS stencil for edge detection\n' );
  fprintf ( 1, '  in images.\n' );

  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    filename = input ( 'Enter the name of the image file:  ' );
  end

  if ( nargin < 2 )
    thresh = 50;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reading "%s".\n', filename );
%
%  Read the file into "A".
%
  a = imread ( filename );
%
%  Get the size of the array.
%  We'll use it later when we add a border to the data.
%
  [ m, n ] = size ( a );
%
%  Display the input image.
%
  figure ( 1 )
  imshow ( a );
  title ( 'Initial image' )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Figure 1:\n' );
  fprintf ( 1, ' This is the original gray scale image.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Press return.\n' );
  pause
%
%  For neatness, we add a border of zeros to the image,
%  then fill in the border by copying the nearby original values.
%  This will be our M+2 by N+2 data array B.
%
  b = zeros ( m + 2, n + 2 );
  b(2:m+1,2:n+1) = double ( a );

  b(1,  2:n+1) = b(2,2:n+1);
  b(m+2,2:n+1) = b(m+1,2:n+1);

  b(2:m+1,1)   = b(2:m+1,2);
  b(2:m+1,n+2) = b(2:m+1,n+1);

  b(1,1)       = ( b(1,2)     + b(2,1)     ) / 2.0;
  b(m+2,1)     = ( b(m+2,2)   + b(m+1,1)   ) / 2.0;
  b(1,n+2)     = ( b(1,n+1)   + b(2,n+2)   ) / 2.0;
  b(m+2,n+2)   = ( b(m+2,n+1) + b(m+1,n+2) ) / 2.0;

  figure ( 2 )
  imshow ( uint8 ( b ) );
  title ( 'Same image, with a 1-pixel border.' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Figure 2:\n' );
  fprintf ( 1, '  We have added a border of 1-pixel thickness.\n' );
  fprintf ( 1, '  Now all the pixels in the original picture \n' );
  fprintf ( 1, '  have a 3x3 pixel neighborhood.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Press return.\n' );
  pause
%
%  Apply the NEWS Operator.  We don't process the boundary pixels.
%
%  The stencil we use is:
%
%   |  0 +1  0 |     |  0  0   0 |
%   |  0  0  0 |  +  | -1  0  +1 |
%   |  0 -1  0 |     |  0  0   0 |
%
  e(2:m+1,2:n+1) = abs ( - b(1:m,2:n+1) + b(3:m+2,2:n+1) ) ...
                 + abs ( - b(2:m+1,1:n) + b(2:m+1,3:n+2) );
%
%  The values in E must be rescaled to run from 0 to 255
%  if we are going to display them.
%
  emin = min ( min ( e ) );
  emax = max ( max ( e ) );
  e = round ( 255 * ( e - emin ) / ( emax - emin ) );

  figure ( 3 )
  imshow ( uint8 ( e ) );
  title ( 'All the E data.' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Figure 3:\n' );
  fprintf ( 1, '  We computed the value of E for each pixel,\n' );
  fprintf ( 1, '  and scaled it to [0,255].\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Press return.\n' );
  pause
%
%  Threshold the data.
%
  e = 255 * ( thresh < e );

  figure ( 4 )
  imshow ( uint8 ( e ) );
  title ( 'E data above the threshold.' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Figure 4:\n' );
  fprintf ( 1, '  We zeroed all the pixels with a value of E\n' );
  fprintf ( 1, '  less than the threshold of %d\n', thresh )
  fprintf ( 1, '  so the edges show up better.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Press return.\n' );
  pause
%
%  Reverse the image.
%
  e_reverse = 255 - e;

  figure ( 5 )
  imshow ( uint8 ( e_reverse ) );
  title ( 'E data above the threshold (reverse video).' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Figure 5:\n' );
  fprintf ( 1, '  Black lines on white background are MUCH easier\n' );
  fprintf ( 1, '  to read.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Press return.\n' );
  pause
%
%  Make an RGB image of the gray picture, with red highlights.
%
  e2 = max ( e(2:m+1,2:n+1), double ( a ) );
  a2 = uint8 ( e2 );

  r = a2;
  g = a;
  b = a;

  rgb = cat ( 3, r, g, b );

  figure ( 6 )
  imshow ( rgb );
  title ( 'Original gray data, with edges in red.' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Figure 6:\n' );
  fprintf ( 1, '  This is actually an RGB "color" image.\n' );
  fprintf ( 1, '  This way, we can show the detected edges in red.\n' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NEWS:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
