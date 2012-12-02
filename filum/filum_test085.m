function filum_test085 ( )

%*****************************************************************************80
%
%% TEST085 tests FILE_LINE_WIDTH.
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
  fprintf ( 1, 'TEST085\n' );
  fprintf ( 1, '  FILE_LINE_WIDTH counts the longest line in a file.\n' );

  file_name = 'story.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Examining file:\n' );
  fprintf ( 1, '    "%s".', file_name );
  fprintf ( 1, '\n' );

  line_width = file_line_width ( file_name );
  fprintf ( 1, '  Longest line length: %d\n', line_width );

  return
end
