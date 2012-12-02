function st_io_test01 ( )

%*****************************************************************************80
%
%% ST_IO_TEST01 tests ST_HEADER_WRITE and ST_DATA_WRITE.
%
%  Discussion:
%
%    The matrix is:
%
%      11  12   0   0  15
%      21  22   0   0   0
%       0   0  33   0  35
%       0   0   0  44   0
%      51   0  53   0  55
%
%    The index vectors are 1 based, and so have to be converted to
%    0-base before being written.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2008
%
%  Author:
%
%    John Burkardt
%
  nrow = 5;
  ncol = 5;
  nnzero = 11;
  a = [ 51.0, 12.0, 11.0, 33.0, 15.0, 53.0, 55.0, 22.0, 35.0, 44.0, 21.0 ]';
  col = [ 1, 2, 1, 3, 5, 3, 5, 2, 5, 4, 1 ];
  row = [ 5, 1, 1, 3, 1, 5, 5, 2, 3, 4, 2 ];
  output_filename = 'a5by5.st';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_IO_TEST01\n' );
  fprintf ( 1, '  ST_HEADER_WRITE writes the header of an ST file;\n' );
  fprintf ( 1, '  ST_DATA_WRITE writes the data of an ST file.\n' );

  base1 = 1;
  base0 = 0;
  row = st_rebase ( base1, base0, nnzero, row );
  col = st_rebase ( base1, base0, nnzero, col );

  st_header_print ( nrow, ncol, nnzero )

  st_data_print ( nrow, ncol, nnzero, row, col, a, ...
    '  TEST01 matrix data to be written to a file:' );

  st_header_write ( output_filename, nrow, ncol, nnzero );

  st_data_write ( output_filename, nrow, ncol, nnzero, row, col, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_IO_TEST01\n' );
  fprintf ( 1, '  Wrote the matrix data to "%s".\n', output_filename );

  return
end
