%% HELLO_POOL uses the MATLABPOOL command to run the HELLO code.
%
%  Discussion:
%
%    Output printed by the function appears directly on the screen.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2011
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  workers = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HELLO_POOL\n' );
  fprintf ( 1, '  Call HELLO_FUN to say hello %d times using %d workers.\n', n, workers );

  matlabpool ( 'open', 'local', workers )

  tic
  hello_fun ( n );
  toc

  matlabpool ( 'close' )
