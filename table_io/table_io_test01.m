function table_io_test01 ( )

%*****************************************************************************80
%
%% TABLE_IO_TEST01 tests R8MAT_WRITE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2010
%
%  Author:
%
%    John Burkardt
%
  n = 20;
  m = 5;
  output_filename = 'r8mat_05_00020.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  R8MAT_WRITE writes an R8MAT file.\n' );

  table = r8mat_indicator ( m, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
  fprintf ( 1, '  Number of points N  = %d\n', n );

  r8mat_print_some ( m, n, table, 1, 1, 5, 5, ...
    '  5x5 portion of the data written to file:' );

  r8mat_transpose_print_some ( m, n, table, 1, 1, 5, 5, ...
    '  5x5 portion of the TRANSPOSED data:' );

  r8mat_write ( output_filename, m, n, table );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the file "%s".\n', output_filename );

  return
end
