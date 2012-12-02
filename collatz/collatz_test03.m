function collatz_test03 ( )

%*****************************************************************************80
%
%% COLLATZ_TEST03 tests COLLATZ_WRITE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_TEST03\n' );
  fprintf ( 1, '  COLLATZ_WRITE writes a Collatz sequence to a file.\n' );

  file_name = 'collatz_27.txt';
  seed = 27;
  s = collatz ( seed );
  n = length ( s );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Write the Collatz sequence with seed %d to "%s".\n', seed, file_name );

  collatz_write ( n, s, file_name );
  
  file_name = 'collatz_count.txt';
  
  n = 100;
  for seed = 1 : n
    c(seed) = collatz_count ( seed );
  end
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Write the Collatz count sequence from 1 to %d to "%s".\n', n, file_name );

  collatz_write ( n, c, file_name );

  return
end
