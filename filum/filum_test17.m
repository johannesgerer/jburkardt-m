function filum_test17 ( )

%*****************************************************************************80
%
%% TEST17 tests FILE_PARA_COUNT.
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
  fprintf ( 1, 'TEST17\n' );
  fprintf ( 1, '  FILE_PARA_COUNT counts the paragraphs in a file.\n' );

  filename = 'story.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Examining file:\n' );
  fprintf ( 1, '    "%s".', filename );
  fprintf ( 1, '\n' );

  para_num = file_para_count ( filename );
  fprintf ( 1, '  Number of paragraphs: %d\n', para_num );

  return
end
