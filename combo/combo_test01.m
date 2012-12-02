function combo_test01 ( )

%*****************************************************************************80
%
%% COMBO_TEST01 tests BAL_SEQ_ENUM, *_RANK, *_SUCCESSOR, *_UNRANK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMBO_TEST01\n' );
  fprintf ( 1, '  Balanced sequences:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  BAL_SEQ_ENUM enumerates,\n' );
  fprintf ( 1, '  BAL_SEQ_RANK ranks,\n' );
  fprintf ( 1, '  BAL_SEQ_SUCCESSOR lists,\n' );
  fprintf ( 1, '  BAL_SEQ_UNRANK unranks.\n' );
%
%  Enumerate.
%
  nseq = bal_seq_enum ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  For N = %d\n', n );
  fprintf ( 1, '  the number of balanced sequences is %d\n', nseq );
  fprintf ( 1, '\n' );
%
%  List.
%
  t = [];
  rank = -1;

  while ( 1 )

    rank_old = rank;

    [ t, rank ] = bal_seq_successor ( n, t, rank );

    if ( rank <= rank_old )
      break
    end

    fprintf ( 1, '    %3d  ', rank );
    for i = 1 : 2 * n
       fprintf ( 1, '%2d', t(i) );
    end
    fprintf ( 1, '\n' );

  end
%
%  Unrank.
%
  rank = floor ( nseq / 2 );

  t = bal_seq_unrank ( rank, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank = %d\n', rank );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The element of that rank is:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 2 * n
    fprintf ( 1, '%2d', t(i) );
  end
  fprintf ( 1, '\n' );
%
%  Rank.
%
  rank = bal_seq_rank ( n, t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The element to be ranked is:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 2 * n
    fprintf ( 1, '%2d', t(i) );
  end
  fprintf ( 1, '\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computed rank: %d\n', rank );

  return
end
