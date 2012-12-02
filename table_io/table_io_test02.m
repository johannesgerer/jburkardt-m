function table_io_test02 ( )

%*****************************************************************************80
%
%% TABLE_IO_TEST02 tests R8MAT_HEADER_READ, R8MAT_DATA_READ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 May 2005
%
%  Author:
%
%    John Burkardt
%
  input_filename = 'r8mat_05_00020.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  For an R8MAT file,\n' );
  fprintf ( 1, '  R8MAT_HEADER_READ reads the header information\n' );
  fprintf ( 1, '  (about the dimensions of the data);\n' );
  fprintf ( 1, '  R8MAT_DATA_READ reads the data.\n' );

  [ m, n ] = r8mat_header_read (  input_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of %s\n', input_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
  fprintf ( 1, '  Number of points N  = %d\n', n );

  table = r8mat_data_read (  input_filename, m, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in %s\n', input_filename );

  r8mat_print_some ( m, n, table, 1, 1, 5, 5, ...
    '  5x5 portion of data read from file:' );

  return
end
