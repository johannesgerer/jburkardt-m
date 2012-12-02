function combo_test18 ( )

%*****************************************************************************80
%
%% COMBO_TEST18 tests NPART_ENUM, _RSF_LEX_RANK, _RSF_LEX_SUCCESSOR, _RSF_LEX_UNRANK.
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
  npart = 3;
  n = 12;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST18\n' );
  fprintf ( 1, '  Partitions of N with NPART parts\n' );
  fprintf ( 1, '  in reverse standard form:\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  NPART_ENUM enumerates,\n' );
  fprintf ( 1, '  NPART_RSF_LEX_RANK ranks,\n' );
  fprintf ( 1, '  NPART_RSF_LEX_SUCCESSOR lists;\n' );
  fprintf ( 1, '  NPART_RSF_LEX_UNRANK unranks.\n' );
%
%  Enumerate.
%
  npartitions = npart_enum ( n, npart );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  For N = %d\n', n );
  fprintf ( 1, '  and NPART = %d\n', npart );
  fprintf ( 1, '  the number of partitions is %d\n', npartitions );
  fprintf ( 1, ' \n' );
%
%  List.
%
  t = [];
  rank = -1;

  while ( 1 )

    rank_old = rank;

    [ t, rank ] = npart_rsf_lex_successor ( n, npart, t, rank );

    if ( rank <= rank_old )
      break
    end

    fprintf ( 1, '  %4d  ', rank );
    for i = 1 : npart
      fprintf ( 1, '%5d', t(i) );
    end
    fprintf ( 1, '\n' );

  end
%
%  Unrank.
%
  rank = floor ( npartitions / 3 );

  t = npart_rsf_lex_unrank ( rank, n, npart );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The element of rank %d:\n', rank );
  fprintf ( 1, ' \n' );
  i4vec_print ( npart, t, '  The element:' );
%
%  Rank.
%
  rank = npart_rsf_lex_rank ( n, npart, t );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The rank of the element is computed as %d:\n', rank );

  return
end
