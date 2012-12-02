%% SYSTEM_MORE_TEST tests the UNIX facility for issuing operating system commands.
%
%  Discussion:
%
%    MORE is a legal command on both UNIX and DOS systems, which prints out
%    part of a file.
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
  fprintf ( 1, 'SYSTEM_MORE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate a simple use of the "system" command,\n' );
  fprintf ( 1, '  which allows MATLAB to invoke operating system commands.\n' );

  [ status, string ] = system ( 'more system_more_test.m' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Command status was %d\n', status );
  fprintf ( 1, '  Command output was %s\n', string );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SYSTEM_MORE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  
