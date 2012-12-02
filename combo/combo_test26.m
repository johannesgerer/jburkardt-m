function combo_test26 ( )

%*****************************************************************************80
%
%% COMBO_TEST26 tests PARTN_ENUM, PARTN_SUCCESSOR and PART_SF_CONJUGATE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMBO_TEST26\n' );
  fprintf ( 1, '  Partitions of N with maximum element NMAX:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PARTN_SUCCESSOR lists;\n' );
  fprintf ( 1, '  PARTN_ENUM enumerates.\n' );

  nmax = 4;
%
%  Enumerate.
%
  npartitions = partn_enum ( n, nmax );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  For N = %d\n', n );
  fprintf ( 1, '  and NMAX = %d\n', nmax );
  fprintf ( 1, '  the number of partitions is %d\n', npartitions );
  fprintf ( 1, ' \n' );
%
%  List.
%
  npart = 0;
  t = [];
  rank = -1;

  while ( 1 )

    rank_old = rank;

    [ npart, t, rank ] = partn_successor ( n, nmax, npart, t, rank );

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
%  List conjugates.
%
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Repeat, but list RSF conjugated partitions.\n' );
  fprintf ( 1, ' \n' );

  npart = 0;
  t = [];
  rank = -1;

  while ( 1 )

    rank_old = rank;

    [ npart, t, rank ] = partn_successor ( n, nmax, npart, t, rank );

    if ( rank <= rank_old )
      break
    end

    [ npart2, b ] = part_sf_conjugate ( n, npart, t );
    b = i4vec_reverse ( npart2, b );

    fprintf ( 1, '  %4d  ', rank );
    for i = 1 : npart2
      fprintf ( 1, '%5d', b(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
