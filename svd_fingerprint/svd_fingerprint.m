function svd_fingerprint ( filename )

%*****************************************************************************80
%
%% SVD_FINGERPRINT compares a fingerprint to low rank SVD compressed versions.
%
%  Discussion:
%
%    The user supplies the name of a file containing the image of a fingerprint.
%
%    This is presumably a black and white MxN image.
%
%    The image data is converted to numeric form, and the SVD decomposition 
%    is computed.  It is possible to generate approximate versions of the
%    image for values 1 <= R <= min ( M, N ).
%
%    The program displays versions of the fingerprint for various values of R.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the name of the image file.
%
  a = imread ( filename );
%
%  Display the original.
%
  figure ( 1 )
  imshow ( a )
  title ( sprintf ( 'Original data, "%s"', filename ) );
%
%  Convert the image to double.
%
  a = double ( a );
%
%  Report the dimensions.
%
  [ m, n ] = size ( a );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Image rows M =     %d\n', m );
  fprintf ( 1, '  Image columns N =  %d\n', n );
  fprintf ( 1, '  Image pixels M*N = %d\n', m * n );
%
%  Compute the SVD.
%
  [ u, s, v ] = svd ( a );
%
%  Compute the sum of the singular values.
%
  s_vec = diag ( s );
  s_sum = sum ( s_vec );
%
%  Plot the eigenvalues.
%
  figure ( 2 )
  x = 1 : min ( m, n );
  y = diag ( s );
  plot ( x, y, 'Linewidth', 2 );
  grid
  title ( 'Singular values' )
  hold off
  pause
%
%  Create and display a sequence of low rank approximations.
%
  r_vec = [ 1, 2, 5, 10, 20, 40 ];

  for i = 1 : 6
    r = r_vec(i);
    b = svd_bw ( m, n, r, u, s, v );
    imshow ( b );
    comp = ( m * r + r + r * n ) / ( m * n );
    psum = sum ( s_vec(1:r) ) / s_sum;
    title ( sprintf ( 'Approximation using %d vectors.', r ) )
    fprintf ( 1, '  Compression = %f, Partial sum = %f\n', comp, psum );
    pause
  end

  return
end
