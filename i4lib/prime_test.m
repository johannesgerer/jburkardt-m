function prime_test ( )

%*****************************************************************************80
%
%% PRIME_TEST tests PRIME.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 December 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRIME_TEST\n' );
  fprintf ( 1, '  PRIME returns primes from a table.\n' );

  n = -1;
  prime_max = prime ( n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of primes stored is %d\n', prime_max );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    Prime(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 10
    fprintf ( 1, '  %4d  %6d\n', i, prime(i) );
  end
  fprintf ( 1, '\n' );
  for i = prime_max - 10 : prime_max
    fprintf ( 1, '  %4d  %6d\n', i, prime(i) );
  end
  
  return
end
