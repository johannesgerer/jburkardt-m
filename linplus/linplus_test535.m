function linplus_test535 ( )

%*****************************************************************************80
%
%% TEST535 tests R8S3_READ, R8S3_READ_SIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  input_file = 'r8s3_matrix.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST535\n' );
  fprintf ( 1, '  For a R8S3 system,\n' );
  fprintf ( 1, '  R8S3_READ_SIZE reads the size of the matrix.\n' );
  fprintf ( 1, '  R8S3_READ reads the matrix.\n' );

  [ n, nz_num ] = r8s3_read_size ( input_file );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8S3_READ_SIZE reports matrix size data:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N =         %d\n', n );
  fprintf ( 1, '  Matrix nonzeros NZ_NUM = %d\n', nz_num );

  [ row, col, a ] = r8s3_read ( input_file, n, nz_num );

  isym = 0;

  r8s3_print_some ( n, n, nz_num, isym, row, col, a, 1, 1, ...
    10, 10, '  Initial 10x10 block of recovered R8S3 matrix:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Deleting the matrix data file "%s"\n', input_file );

  return
end
