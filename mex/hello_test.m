function hello_test ( )

%*****************************************************************************80
%
%% HELLO_TEST tests the HELLO program.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HELLO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate the use of MATLAB''s MEX compiler.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compile the C file "hello.c" with the command\n' );
  fprintf ( 1, '    mex hello.c\n' );

  mex hello.c

  fprintf ( 1, '  A compiled file called "hello.mexmaci64" has been created.\n' );
  fprintf ( 1, '  I''ll convince you of this by typing "ls".\n' );
  fprintf ( 1, '\n' );
  
  ls

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now, the command "hello ( )" will execute the\n' );
  fprintf ( 1, '  compiled file.\n' );

  hello ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now I will delete the "hello.mexmaci64" file.\n' );

  delete hello.mexmaci64
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HELLO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

