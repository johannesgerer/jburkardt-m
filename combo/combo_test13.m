function combo_test13 ( )

%*****************************************************************************80
%
%% COMBO_TEST13 tests KSUBSET_COLEX_RANK, _SUCCESSOR, _UNRANK, _ENUM.
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
  fprintf ( 1, 'COMBO_TEST13\n' );
  fprintf ( 1, '  K-subsets of an N set,\n' );
  fprintf ( 1, '  using the colexicographic ordering:\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  KSUBSET_COLEX_RANK ranks,\n' );
  fprintf ( 1, '  KSUBSET_COLEX_SUCCESSOR lists,\n' );
  fprintf ( 1, '  KSUBSET_COLEX_UNRANK unranks.\n' );
  fprintf ( 1, '  KSUBSET_ENUM enumerates,\n' );
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

  while ( 1 );

    rank_old = rank;

    [ t, rank ] = ksubset_colex_successor ( k, n, t, rank );

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

  t = ksubset_colex_unrank ( rank, k, n );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The element of rank %d:\n', rank );
  fprintf ( 1, ' \n' );
  i4vec_print ( k, t, '  The element:' );
%
%  Rank.
%
  rank = ksubset_colex_rank ( k, n, t );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The rank of the element is computed as %d:\n', rank );

  return
end
