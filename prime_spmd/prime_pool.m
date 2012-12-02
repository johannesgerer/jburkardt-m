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
%    26 March 2010
%
%  Author:
%
%    John Burkardt
%
  n = 10000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRIME_POOL\n' );
  fprintf ( 1, '  Count prime numbers from 1 to %d\n', n );

  matlabpool open local 4

  total = prime_fun ( n );

  matlabpool close

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Total is %d\n', total );
