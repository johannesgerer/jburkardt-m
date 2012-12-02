function image_quantization_test01 ( filename )

%*****************************************************************************80
%
%% IMAGE_QUANTIZATION_TEST01 tests GRAYSCALE_QUANTIZATION.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'IMAGE_QUANTIZATION_TEST01\n' );
  fprintf ( 1, '  Test GRAYSCALE_QUANTIZATION, which uses KMEANS to choose\n' );
  fprintf ( 1, '  a small number of grays to display a grayscale image.\n' );
%
%  Read the image from a file.
%
  g = imread ( filename );
  [ m, n ] = size ( g );
%
%  FIGURE 1: The original image.
%
  figure ( 1 )
  imshow ( g );
  title ( 'Original image' )
%
%  FIGURE 2: Grayscale histogram.
%
  p = double ( g );
  p = reshape ( p, m * n, 1 );

  figure ( 2 )
  hist ( p, 256 )
  title ( 'Histogram for original image' )
%
%  FIGURE 3: Make a version using 10 grayscales.
%
  k = 10;
  g2 = grayscale_quantization ( g, k );

  figure ( 3 )
  imshow ( g2 )
  title_string = sprintf ( 'Image using %d shades', k );
  title ( title_string )
%
%  FIGURE 4: Make a version with 3 grayscales.
%
  k = 3;
  g3 = grayscale_quantization ( g, k );

  figure ( 4 )
  imshow ( g3 )
  title_string = sprintf ( 'Image using %d shades', k );
  title ( title_string )

  return
end
