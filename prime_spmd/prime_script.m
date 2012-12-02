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
%    27 March 2010
%
%  Author:
%
%    John Burkardt
%
  n = 10000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRIME_SCRIPT\n' );
  fprintf ( 1, '  Count prime numbers from 1 to %d\n', n );

  total = prime_fun ( n );
