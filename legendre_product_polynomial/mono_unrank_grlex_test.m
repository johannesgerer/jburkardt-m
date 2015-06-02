function monomial_test08 ( )

%*****************************************************************************80
%
%% MONOMIAL_TEST08 tests MONO_UNRANK_GRLEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 December 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONOMIAL_TEST08\n' );
  fprintf ( 1, ...
    '  MONO_UNRANK_GRLEX is given a rank, and returns the corresponding\n' );
  fprintf ( 1, '  monomial in the sequence of all monomials in M dimensions\n' );
  fprintf ( 1, '  in grlex order.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  For reference, print a monomial sequence with ranks.\n' );

  n = 4;
  m = 3;
  rank_max = mono_upto_enum ( m, n );

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
  fprintf ( 1, '  Now choose random ranks between 1 and %d:\n', rank_max )
  fprintf ( 1, '\n' );

  seed = 123456789;
  test_num = 5;

  for test = 1 : test_num

    [ rank, seed ] = i4_uniform_ab ( 1, rank_max, seed );    
    x = mono_unrank_grlex ( m, rank );

    fprintf ( 1, '  %3d:', rank );
    for j = 1 : m
      fprintf ( 1, '  %1d', x(j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
