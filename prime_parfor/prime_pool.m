%% PRIME_POOL uses the MATLABPOOL command to run the PRIME code.
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
%    22 May 2012
%
%  Author:
%
%    John Burkardt
%
  matlabpool open local 4

  n = 10000000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRIME_POOL\n' );
  fprintf ( 1, '  Count prime numbers from 1 to %d\n', n );

  tic
  total = prime_fun ( n );
  toc

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Total is %d\n', total );

  matlabpool close
