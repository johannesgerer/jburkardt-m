function table_io_test04 ( )

%*****************************************************************************80
%
%% TABLE_IO_TEST04 tests I4MAT_HEADER_READ, I4MAT_DATA_READ.
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
  input_filename = 'i4mat_05_00020.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  For an I4MAT file,\n' );
  fprintf ( 1, '  I4MAT_HEADER_READ reads the header information\n' );
  fprintf ( 1, '  (about the dimensions of the data);\n' );
  fprintf ( 1, '  I4MAT_DATA_READ reads the data.\n' );

  [ m, n ] = i4mat_header_read (  input_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of %s\n', input_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
  fprintf ( 1, '  Number of points N  = %d\n', n );

  table = i4mat_data_read (  input_filename, m, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in %s\n', input_filename );

  i4mat_print_some ( m, n, table, 1, 1, 5, 5, ...
    '  5x5 portion of data read from file:' );

  return
end
