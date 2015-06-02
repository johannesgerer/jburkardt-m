function monomial_test07 ( )

%*****************************************************************************80
%
%% MONOMIAL_TEST07 tests MONO_RANK_GRLEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONOMIAL_TEST07\n' );
  fprintf ( 1, '  MONO_RANK_GRLEX returns the rank of a monomial\n' );
  fprintf ( 1, '  under the grlex ordering, in the sequence\n' );
  fprintf ( 1, '  of all monomials in M dimensions of degree N or less.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Print a monomial sequence with ranks assigned.\n' );

  n = 4;
  m = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Let M = %d\n', m );
  fprintf ( 1, '      N = %d\n', n );
  fprintf ( 1, '\n' );

  x = [ 0, 0, 0 ];
  i = 1;

  while ( 1 )

    fprintf ( 1, '  %3d:', i );
    for j = 1 : m
      fprintf ( 1, '  %1d', x(j) );
    end
    fprintf ( 1, '\n' );

    if ( x(1) == n )
      break
    end

    x = mono_upto_next_grlex ( m, n, x );
    i = i + 1;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now, given a monomial, retrieve its rank in the sequence:\n' );
  fprintf ( 1, '  (Should get 1, 2, 4, 8, 16, 32, 64 and 128.)\n' );
  fprintf ( 1, '\n' );

  test_num = 8;
  x_test = [ ...
    0, 0, 0; ...
    1, 0, 0; ...
    0, 0, 1; ...
    0, 2, 0; ...
    1, 0, 2; ...
    0, 3, 1; ...
    3, 2, 1; ...
    5, 2, 1 ]';

  for test = 1 : test_num
    x(1:m) = x_test(1:m,test);
    rank = mono_rank_grlex ( m, x );
    fprintf ( 1, '  %3d:', rank );
    for j = 1 : m
      fprintf ( 1, '  %1d', x(j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
