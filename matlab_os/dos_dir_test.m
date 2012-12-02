%% DOS_DIR_TEST tests the DOS facility for issuing operating system commands.
%
%  Discussion:
%
%    DIR is a legal command on MS/DOS systems, and returns a list of the
%    files in the current directory.
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
  fprintf ( 1, 'DOS_DIR_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate a simple use of the "dos" command,\n' );
  fprintf ( 1, '  which allows MATLAB to invoke MS/DOS operating system commands.\n' );

  [ status, string ] = dos ( 'dir' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Command status was %d\n', status );
  fprintf ( 1, '  Command output was %s\n', string );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Repeat the command, but add the -ECHO option.\n' );

  [ status, string ] = dos ( 'dir', '-echo' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Command status was %d\n', status );
  fprintf ( 1, '  Command output was %s\n', string );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now repeat command, but with a final ampersand.\n' );

  [ status, string ] = dos ( 'dir &' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Command status was %d\n', status );
  fprintf ( 1, '  Command output was %s\n', string );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DOS_DIR_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  
