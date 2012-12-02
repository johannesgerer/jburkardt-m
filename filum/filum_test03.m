function filum_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests FILE_COLUMN_COUNT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  FILE_COLUMN_COUNT counts the columns in a file.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  It is assumed that the file contains a number of lines,\n' );
  fprintf ( 1, '  with each line containing the same number of words.\n' );
  fprintf ( 1, '  The task is to determine the number of words in a line,\n' );
  fprintf ( 1, '  that is, the number of "columns" of text.\n' );

  file_name = 'filum_prb_4by5.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Examining the file "%s"\n', file_name );

  column_num = file_column_count ( file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of columns = %d\n', column_num );

  return
end
