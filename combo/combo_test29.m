function combo_test29 ( )

%*****************************************************************************80
%
%% COMBO_TEST29 tests PERM_ENUM, _TJ_RANK, _TJ_SUCCESSOR, _TJ_UNRANK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMBO_TEST29\n' );
  fprintf ( 1, '  Permutations of the integers,\n' );
  fprintf ( 1, '  using the Trotter-Johnson ordering:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PERM_ENUM enumerates,\n' );
  fprintf ( 1, '  PERM_TJ_RANK ranks,\n' );
  fprintf ( 1, '  PERM_TJ_SUCCESSOR lists,\n' );
  fprintf ( 1, '  PERM_TJ_UNRANK unranks.\n' );
%
%  Enumerate.
%
  nperm = perm_enum ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  For N = %d\n', n );
  fprintf ( 1, '  the number of permutations is %d\n', nperm );
  fprintf ( 1, '\n' );
%
%  List
%
  p = [];
  rank = -1;

  while ( 1 )

    rank_old = rank;

    [ p, rank ] = perm_tj_successor ( n, p, rank );

    if ( rank <= rank_old )
      break
    end

    fprintf ( 1, '%4d:', rank );
    for i = 1 : n
      fprintf ( 1, '%5d', p(i) );
    end
    fprintf ( 1, '\n' );

  end
%
%  Unrank.
%
  rank = floor ( nperm / 2 );

  p = perm_tj_unrank ( rank, n );

  title = sprintf ( '  The element of rank %d:', rank );

  perm_print ( n, p, title );
%
%  Rank.
%
  rank = perm_tj_rank ( n, p );

  perm_print ( n, p, '  The rank of the element:' )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  is computed to be %d.\n', rank );

  return
end
