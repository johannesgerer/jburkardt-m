function combo_test42 ( )

%*****************************************************************************80
%
%% COMBO_TEST42 tests TREE_ENUM, TREE_RANK, TREE_SUCCESSOR, TREE_UNRANK.
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
  n = 4;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST42\n' );
  fprintf ( 1, '  Trees:\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  TREE_ENUM enumerates,\n' );
  fprintf ( 1, '  TREE_RANK ranks,\n' );
  fprintf ( 1, '  TREE_SUCCESSOR lists,\n' );
  fprintf ( 1, '  TREE_UNRANK unranks.\n' );
%
%  Enumerate.
%
  tree_num = tree_enum ( n );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  For N = %d\n', n );
  fprintf ( 1, '  the number of trees is %d\n', tree_num );
  fprintf ( 1, ' \n' );
%
%  List
%
  t = [];
  rank = -1;

  while ( 1 );

    rank_old = rank;

    [ t, rank ] = tree_successor ( n, t, rank );

    if ( rank <= rank_old )
      break
    end

    fprintf ( 1, '%5d  ', rank );
    for j = 1 : n - 1
      fprintf ( 1, '%5d', t(1,j) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '       ' );
    for j = 1 : n - 1
      fprintf ( 1, '%5d', t(2,j) );
    end
    fprintf ( 1, '\n' );

  end
%
%  Unrank.
%
  rank = floor ( tree_num / 2 );

  t = tree_unrank ( rank, n );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The element of rank %d:\n', rank );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '%5d  ', rank );
  for j = 1 : n - 1
    fprintf ( 1, '%5d', t(1,j) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '       ' );
  for j = 1 : n - 1
    fprintf ( 1, '%5d', t(2,j) );
  end
  fprintf ( 1, '\n' );
%
%  Rank.
%
  rank = tree_rank ( n, t );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The rank of the element is computed as %d:\n', rank );

  return
end
