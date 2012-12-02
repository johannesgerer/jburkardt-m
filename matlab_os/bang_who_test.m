%% BANG_WHO_TEST tests the BANG facility for issuing operating system commands.
%
%  Discussion:
%
%    WHO is a legal command on UNIX systems, and returns a list of the
%    users currently logged in.
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
  fprintf ( 1, 'BANG_WHO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate a simple use of the ! command,\n' );
  fprintf ( 1, '  which allows MATLAB to invoke operating system commands.\n' );

  ! who

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BANG_WHO_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  
