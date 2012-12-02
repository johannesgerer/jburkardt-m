function combo_test20 ( )

%*****************************************************************************80
%
%% COMBO_TEST20 tests NPART_ENUM and NPART_SF_SUCCESSOR;
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
  fprintf ( 1, 'COMBO_TEST20\n' );
  fprintf ( 1, '  Partitions of N with NPART parts\n' );
  fprintf ( 1, '  in standard form:\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  NPART_ENUM enumerates,\n' );
  fprintf ( 1, '  NPART_SF_LEX_SUCCESSOR lists.\n' );
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

    [ t, rank ] = npart_sf_lex_successor ( n, npart, t, rank );

    if ( rank <= rank_old )
      break
    end

    fprintf ( 1, '  %4d  ', rank );
    for i = 1 : npart
      fprintf ( 1, '%5d', t(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
