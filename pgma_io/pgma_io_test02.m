function pgma_io_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests PGMA_READ.
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
  file_name = 'pgma_io_test02.ascii.pgm';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  PGMA_READ reads an ASCII PGMA file.\n' );

  pgma_write_test ( file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PGMA_WRITE_TEST created some data for us.\n' );

  gray = pgma_read ( file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PGMA_READ was able to read the ASCII PGMA file.\n' );

  [ nrow, ncol ] = size ( gray );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of rows =    %d\n', nrow );
  fprintf ( 1, '  Number of columns = %d\n', ncol );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample data:\n' );
  fprintf ( 1, '\n' );

  for k = 1 : 10
    i = floor ( ( ( 10 - k ) * 1 + ( k - 1 ) * nrow ) / ( 10 - 1 ) );
    j = floor ( ( ( 10 - k ) * 1 + ( k - 1 ) * ncol ) / ( 10 - 1 ) );
    fprintf ( 1, '%4d  %4d  %6d\n', i, j, gray(i,j) );
  end

  return
end
