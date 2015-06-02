function mono_total_random_test ( )

%*****************************************************************************80
%
%% MONO_TOTAL_RANDOM_TEST tests MONO_TOTAL_RANDOM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 November 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONO_TOTAL_RANDOM_TEST\n' );
  fprintf ( 1, '  MONO_TOTAL_RANDOM selects at random a monomial\n' );
  fprintf ( 1, '  in M dimensions of total degree N.\n' );

  m = 3;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Let M = %d\n', m );
  fprintf ( 1, '      N = %d\n', n );
  fprintf ( 1, '\n' );

  seed = 123456789;
  test_num = 5;

  for test = 1 : test_num

    [ x, rank, seed ] = mono_total_random ( m, n, seed );

    fprintf ( 1, '  %3d:', rank );
    for j = 1 : m
      fprintf ( 1, '  %1d', x(j) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
