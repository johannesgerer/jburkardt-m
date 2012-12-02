function filum_test06 ( )

%*****************************************************************************80
%
%% FILUM_TEST06 tests FILE_EXIST.
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
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  FILE_EXIST is true if a file exists.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Exist?    FILE_NAME\n' );
  fprintf ( 1, '\n' );

  file_name = 'filum_test.m';
  fprintf ( 1, '  %d  %s\n', file_exist ( file_name ), file_name );

  file_name = 'filum.html';
  fprintf ( 1, '  %d  %s\n', file_exist ( file_name ), file_name );

  file_name = 'rabbit.txt';
  fprintf ( 1, '  %d  %s\n', file_exist ( file_name ), file_name );

  file_name = 'make.money.fast';
  fprintf ( 1, '  %d  %s\n', file_exist ( file_name ), file_name );

  return
end
