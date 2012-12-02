function pgma_io_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests PGMA_WRITE.
%
%  Discussion:
%
%    This example makes a sort of grayscale checkerboard.
%
%    The gray scale values were computed by the routine
%    GRAYSCALE_RGB in the COLORS library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 June 2010
%
%  Author:
%
%    John Burkardt
%
  ncol = 300;
  ngray = 11;
  nrow = 300;
  file_name = 'pgma_io_test03.ascii.pgm';

  gray = [ 0.000, 0.291, 0.434, 0.540, 0.629, ...
           0.706, 0.774, 0.837, 0.895, 0.949, ...
           1.000 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  PGMA_WRITE writes an ASCII PGM file.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, we make a sort of grayscale\n' );
  fprintf ( 1, '  checkerboard.\n' );

  for i = 1 : nrow
    for j = 1 : ncol
      k = ( i - 1 + j - 1 ) * ngray / min ( nrow, ncol );
      k = floor ( 1 + mod ( k, ngray ) );
      g(i,j) = floor ( 255.0E+00 * gray(k) );
    end
  end

  pgma_write ( file_name, g );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created the file %s.\n', file_name );

  return
end
