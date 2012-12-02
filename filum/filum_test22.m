function filum_test22 ( )

%*****************************************************************************80
%
%% TEST22 tests FILE_ROW_COUNT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 November 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST22\n' );
  fprintf ( 1, '  FILE_ROW_COUNT counts the rows in a file.\n' );

  file_name = 'filum_prb_test.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Examining the file "%s"\n', file_name );

  row_num = file_row_count ( file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of rows = %d\n', row_num );

  return
end
