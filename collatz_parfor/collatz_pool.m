%% COLLATZ_POOL uses the MATLABPOOL command to run the COLLATZ code.
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
%    27 March 2010
%
%  Author:
%
%    John Burkardt
%
  matlabpool open local 4

  n = 10000000;

  tic
  j_max = collatz_fun ( n );
  toc

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Searched integers 1 through %d\n', n );
  fprintf ( 1, '  Longest Collatz sequence had length %d\n', j_max );

  matlabpool close

