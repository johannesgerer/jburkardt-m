function table_io_test03 ( )

%*****************************************************************************80
%
%% TABLE_IO_TEST03 tests I4MAT_WRITE.
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
  output_filename = 'i4mat_05_00020.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  I4MAT_WRITE writes an I4MAT file.\n' );

  table = i4mat_indicator ( m, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
  fprintf ( 1, '  Number of points N  = %d\n', n );

  i4mat_print_some ( m, n, table, 1, 1, 5, 5, ...
    '  5x5 portion of the data written to file:' );

  i4mat_write ( output_filename, m, n, table );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the file "%s".\n', output_filename );

  return
end
