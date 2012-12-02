function collatz_test01 ( )

%*****************************************************************************80
%
%% COLLATZ_TEST01 tests COLLATZ.
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
  test_num = 5;
  seed_test = [ 5, 6, 19, 27, 95 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_TEST01\n' );
  fprintf ( 1, '  COLLATZ computes the Collatz sequence for a given seed.\n' );

  for test = 1 : test_num

    seed = seed_test(test);

    s = collatz ( seed );
    n = length ( s );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Seed: %d\n', seed );
    fprintf ( 1, '  Sequence length: %d\n', n );
    fprintf ( 1, '\n' );

    for i = 1 : 10 : n
      for j = i : min ( i + 9, n )
        fprintf ( 1, '  %8d', s(j) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end
