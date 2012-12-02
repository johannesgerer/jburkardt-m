function g = grayscale_quantization ( g, k )

%*****************************************************************************80
%
%% GRAYSCALE_QUANTIZATION quantizes a grayscale image.
%
%  Discussion:
%
%    MATLAB's KMEANS function is used to determine K grayscale shades and
%    to assign each pixel one of the new shades.
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
%  Parameters:
%
%    Input, uint8 G(M,N), a grayscale image.
%
%    Input, integer K, the number of distinct grayscale levels to be used
%    in the output image.
%
%    Output, uint8 G(M,N), a copy of the input grayscale image which
%    has been modified to use only K grayscale levels.
%

%
%  Get the shape of G.
%
  [ m, n ] = size ( g );
%
%  P is a numeric copy of G.  It starts as an array.
%
  p = double ( g );
%
%  KMEANS works with vectors, so we must reshape P.
%
  p = reshape ( p, m * n, 1 );
%
%  Report the number of unique grayscales.
%
  g_num = length ( unique ( p ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Input image uses %d distinct shades.\n', g_num );
%
%  KMEANS finds K representative values C for the data in P.
%  The representative for P(I) is PTOC(C(I)).
%
  [ c, ptoc ] = kmeans ( p, k );
%
%  Since KMEANS returns real numbers, we prefer to round them
%  immediately, even before sending them back into a UINT8 array.
%
  ptoc = round ( ptoc );

  fprintf ( 1,' \n' );
  fprintf ( 1, '  Selected shades:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : k
    fprintf ( 1, '  %3d\n', ptoc(i) );
  end
%
%  Replace vector entries by their representatives.
%
  p = ptoc(c);
%
%  Reshape the vector P to an array.
%
  p = reshape ( p, m, n );
%
%  Convert the array P to an unsigned 8-bit integer array.
%
  g = uint8 ( p );

  return
end
