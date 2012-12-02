function combo_test40 ( )

%*****************************************************************************80
%
%% COMBO_TEST40 tests SUBSET_ENUM, _LEX_RANK, _LEX_SUCCESSOR, _LEX_UNRANK.
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
  fprintf ( 1, 'COMBO_TEST40\n' );
  fprintf ( 1, '  All subsets of a set,\n' );
  fprintf ( 1, '  using the lexicographic ordering:\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  SUBSET_ENUM enumerates,\n' );
  fprintf ( 1, '  SUBSET_LEX_RANK ranks,\n' );
  fprintf ( 1, '  SUBSET_LEX_SUCCESSOR lists,\n' );
  fprintf ( 1, '  SUBSET_LEX_UNRANK unranks.\n' );
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

    [ t, rank ] = subset_lex_successor ( n, t, rank );

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

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Seek the element of rank %d:\n', rank );

  t = subset_lex_unrank ( rank, n );
  i4vec_print ( n, t, '  The element:' );
%
%  Rank.
%
  rank = subset_lex_rank ( n, t );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The rank of the element is computed as %d:\n', rank );

  return
end
