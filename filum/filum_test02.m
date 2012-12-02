function filum_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests FILE_CHAR_COUNT.
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
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  FILE_CHAR_COUNT counts the characters in a file.\n' );

  file_name = 'story.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Examining file:\n' );
  fprintf ( 1, '    "%s".', file_name );
  fprintf ( 1, '\n' );

  char_num = file_char_count ( file_name );
  fprintf ( 1, '  Number of characters in file: %d\n', char_num );

  return
end
