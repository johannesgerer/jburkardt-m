function polpak_test0218 ( )

%*****************************************************************************80
%
%% TEST0218 tests COLLATZ_COUNT and COLLATZ_COUNT_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0218:\n' );
  fprintf ( 1, '  COLLATZ_COUNT_MAX(N) counts the length of the\n' );
  fprintf ( 1, '  longest Collatz sequence from 1 to N.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         N     I_MAX     J_MAX\n' );
  fprintf ( 1, '\n' );

  n = 10;

  while ( n <= 100000 )

    [ i_max, j_max ] = collatz_count_max ( n );

    fprintf ( 1, '  %8d  %8d  %8d\n', n, i_max, j_max );

    n = n * 10;

  end

  return
end
