function test01 ( input_filename )

%*****************************************************************************80
%
%% TEST01 tests LATINIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 December 2006
%
%  Author:
%
%    John Burkardt
%

%
%  Get the row and column dimensions of the dataset.
%
  [ m, n ] = r8mat_header_read (  input_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', input_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
  fprintf ( 1, '  Number of points N  = %d\n', n );
%
%  Read the array.
%
  table = r8mat_data_read ( input_filename, m, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', input_filename );

  r8mat_transpose_print_some ( m, n, table, 1, 1, 5, 5, ...
    '  Small portion of data read from file:' );
%
%  Latinize the array.
%
  table_latin = r8mat_latinize ( m, n, table );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Latinized the data.\n' );
%
%  Print out a small sample of the array.
%
  r8mat_transpose_print_some ( m, n, table_latin, 1, 1, 5, 5, ...
    '  Small portion of Latinized data:' );
%
%  Make up a name for the output file that is likely to be related
%  to the input file name, and unique.
%
  output_filename = file_name_ext_swap ( input_filename, 'latin.txt' );
%
%  Write the latinized array to a file.
%
  r8mat_write ( output_filename, m, n, table_latin );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the latinized data to "%s".\n', output_filename );

  return
end
