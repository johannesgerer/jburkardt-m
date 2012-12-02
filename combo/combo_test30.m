function combo_test30 ( )

%*****************************************************************************80
%
%% COMBO_TEST30 tests PRUEFER_*.
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
  fprintf ( 1, 'COMBO_TEST30\n' );
  fprintf ( 1, '  Pruefer codes:\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  PRUEFER_ENUM enumerates,\n' );
  fprintf ( 1, '  PRUEFER_RANK ranks,\n' );
  fprintf ( 1, '  PRUEFER_SUCCESSOR lists,\n' );
  fprintf ( 1, '  PRUEFER_UNRANK unranks.\n' );
%
%  Enumerate.
%
  ncode = pruefer_enum ( n );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  For N = %d\n', n );
  fprintf ( 1, '  the number of Pruefer codes is %d\n', ncode );
  fprintf ( 1, ' \n' );
%
%  List
%
  p = [];
  rank = -1;

  while ( 1 );

    rank_old = rank;

    [ p, rank ] = pruefer_successor ( n, p, rank );

    if ( rank <= rank_old )
      break
    end

    fprintf ( 1, '  %3d  ', rank );
    for i = 1 : n - 2
      fprintf ( 1, '%5d', p(i) );
    end
    fprintf ( 1, '\n' );

  end
%
%  Unrank.
%
  rank = floor ( ncode / 2 );

  p = pruefer_unrank ( rank, n );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The element of rank %d:\n', rank );
  fprintf ( 1, ' \n' );
  for i = 1 : n - 2
    fprintf ( 1, '%5d', p(i) );
  end
  fprintf ( 1, '\n' );
%
%  Rank.
%
  rank = pruefer_rank ( n, p );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The rank of the element is computed as %d:\n', rank );

  return
end
