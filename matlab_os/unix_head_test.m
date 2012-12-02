%% UNIX_HEAD_TEST tests the UNIX facility for issuing operating system commands.
%
%  Discussion:
%
%    HEAD is a legal command on UNIX systems, which returns the first
%    lines of a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 July 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNIX_HEAD_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate a simple use of the "unix" command,\n' );
  fprintf ( 1, '  which allows MATLAB to invoke UNIX operating system commands.\n' );

  [ status, string ] = unix ( 'head unix_head_test.m' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Command status was %d\n', status );
  fprintf ( 1, '  Command output was %s\n', string );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Repeat the command, but add the -5 option.\n' );

  [ status, string ] = unix ( 'head -5 unix_head_test.m' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Command status was %d\n', status );
  fprintf ( 1, '  Command output was %s\n', string );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNIX_HEAD_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  
