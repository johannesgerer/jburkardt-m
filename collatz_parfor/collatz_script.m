%% COLLATZ_SCRIPT is a script to call COLLATZ_FUN.
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
  n = 10000000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_SCRIPT:\n' );
  fprintf ( 1, '  Call COLLATZ_FUN to compute the maximum Collatz sequence length.\n' );

  tic
  j_max = collatz_fun ( n );
  toc



