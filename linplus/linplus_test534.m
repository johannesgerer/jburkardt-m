function linplus_test534 ( )

%*****************************************************************************80
%
%% TEST534 tests R8S3_WRITE.
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
  n = 100;
  nz_num = 3 * n - 2;
  output_file = 'r8s3_matrix.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST534\n' );
  fprintf ( 1, '  For a R8S3 system,\n' );
  fprintf ( 1, '  R8S3_WRITE writes the matrix to a file.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N =         %d\n', n );
  fprintf ( 1, '  Matrix nonzeros NZ_NUM = %d\n', nz_num );

  isym = 0;
%
%  Set the matrix values.
%
  k = 0;
  for i = 1 : n
    k = k + 1;
    j = i;
    row(k) = i;
    col(k) = j;
    a(k) = 100 * i + j;
  end

  for i = 2 : n
    j = i - 1;
    k = k + 1;
    row(k) = i;
    col(k) = j;
    a(k) = 100 * i + j;
  end

  for i = 1 : n-1
    j = i + 1;
    k = k + 1;
    row(k) = i;
    col(k) = j;
    a(k) = 100 * i + j;
  end

  r8s3_print_some ( n, n, nz_num, isym, row, col, a, 1, 1, ...
    10, 10, '  Initial 10x10 block of R8S3 matrix:' );

  r8s3_write ( n, nz_num, isym, row, col, a, output_file );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8S3_WRITE wrote the matrix data to "%s"\n.', ...
    output_file );

  return
end
