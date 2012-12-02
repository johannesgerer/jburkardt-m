%% HELLO_SCRIPT is a script to call HELLO_FUN.
%
%  Discussion:
%
%    The BATCH command runs scripts, not functions.  So we have to write
%    this short script if we want to work with BATCH!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2012
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HELLO_SCRIPT\n' );
  fprintf ( 1, '  Call HELLO_FUN to say hello %d times\n', n );

  tic
  hello_fun ( n );
  toc



