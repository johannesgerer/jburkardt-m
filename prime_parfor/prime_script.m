%% PRIME_SCRIPT is a script to call PRIME_FUN.
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
%    22 May 2012
%
%  Author:
%
%    John Burkardt
%
  n = 10000000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRIME_SCRIPT\n' );
  fprintf ( 1, '  Call PRIME_FUN to count prime numbers from 1 to %d\n', n );

  tic
  total = prime_fun ( n );
  toc
