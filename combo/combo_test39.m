function combo_test39 ( )

%*****************************************************************************80
%
%% COMBO_TEST39 tests SUBSET_COLEX_RANK, _COLEX_SUCCESSOR, _COLEX_UNRANK, _ENUM.
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
  n = 5;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST39\n' );
  fprintf ( 1, '  All subsets of a set,\n' );
  fprintf ( 1, '  using the colexicographic ordering:\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  SUBSET_COLEX_RANK ranks,\n' );
  fprintf ( 1, '  SUBSET_COLEX_SUCCESSOR lists,\n' );
  fprintf ( 1, '  SUBSET_COLEX_UNRANK unranks.\n' );
  fprintf ( 1, '  SUBSET_ENUM enumerates.\n' );
%
%  Enumerate.
%
  nsub = subset_enum ( n );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  For N = %d\n', n );
  fprintf ( 1, '  the number of subsets is %d\n', nsub );
  fprintf ( 1, ' \n' );
%
%  List
%
  t = [];
  rank = -1;

  while ( 1 )

    rank_old = rank;

    [ t, rank ] = subset_colex_successor ( n, t, rank );

    if ( rank <= rank_old )
      break
    end

    fprintf ( 1, '  %4d  ', rank );
    for i = 1 : n
      fprintf ( 1, '%5d', t(i) );
    end
    fprintf ( 1, '\n' );

  end
%
%  Unrank.
%
  rank = floor ( nsub / 3 );

  t = subset_colex_unrank ( rank, n );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The element of rank %d:\n', rank );
  fprintf ( 1, ' \n' );
  for i = 1 : n
    fprintf ( 1, '%5d', t(i) );
  end
  fprintf ( 1, '\n' );
%
%  Rank.
%
  rank = subset_colex_rank ( n, t );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The rank of the element is computed as %d:\n', rank );

  return
end
