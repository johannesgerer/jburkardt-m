function combo_test14 ( )

%*****************************************************************************80
%
%% COMBO_TEST14 tests KSUBSET_ENUM, _LEX_RANK, _LEX_SUCCESSOR, _LEX_UNRANK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
%
%  Author:
%
%    John Burkardt
%
  k = 3;
  n = 5;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST14\n' );
  fprintf ( 1, '  K-subsets of an N set,\n' );
  fprintf ( 1, '  using the lexicographic ordering:\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  KSUBSET_ENUM enumerates,\n' );
  fprintf ( 1, '  KSUBSET_LEX_RANK ranks,\n' );
  fprintf ( 1, '  KSUBSET_LEX_SUCCESSOR lists,\n' );
  fprintf ( 1, '  KSUBSET_LEX_UNRANK unranks.\n' );
%
%  Enumerate.
%
  nksub = ksubset_enum ( k, n );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  For N = %d\n', n );
  fprintf ( 1, '  the number of K subsets is %d\n', nksub );
  fprintf ( 1, ' \n' );
%
%  List
%
  t = [];
  rank = -1;

  while ( 1 )

    rank_old = rank;

    [ t, rank ] = ksubset_lex_successor ( k, n, t, rank );

    if ( rank <= rank_old )
      break
    end

    fprintf ( 1, '  %4d  ', rank );
    for i = 1 : k
      fprintf ( 1, '%5d', t(i) );
    end
    fprintf ( 1, '\n' );

  end
%
%  Unrank.
%
  rank = floor ( nksub / 2 );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The element of rank %d:\n', rank );

  t = ksubset_lex_unrank ( rank, k, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '        ' );
  for i = 1 : k
    fprintf ( 1, '%5d', t(i) );
  end
  fprintf ( 1, '\n' );
%
%  Rank.
%
  rank = ksubset_lex_rank ( k, n, t );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The rank of the element is computed as %d:\n', rank );

  return
end
