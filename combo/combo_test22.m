function combo_test22 ( )

%*****************************************************************************80
%
%% COMBO_TEST22 tests PART_ENUM and PART_SUCCESSOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 8;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST22\n' );
  fprintf ( 1, '  PART_SUCCESSOR produces partitions of N,\n' );
  fprintf ( 1, '  PART_ENUM enumerates.\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Partitions of N = %d\n', n );
%
%  Enumerate.
%
  npartitions = part_enum ( n );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  For N = %d\n', n );
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

    [ npart, t, rank ] = part_successor ( n, npart, t, rank );

    if ( rank <= rank_old )
      break
    end

    fprintf ( 1, '  %4d  ', rank );
    for i = 1 : npart
      fprintf ( 1, '%3d', t(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
