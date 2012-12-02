function combo_test23 ( )

%*****************************************************************************80
%
%% COMBO_TEST23 tests PART_SUCCESSOR and PART_SF_CONJUGATE.
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
  n = 8;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST23\n' );
  fprintf ( 1, '  PART_SUCCESSOR produces partitions of N,\n' );
  fprintf ( 1, '  PART_SF_CONJUGATE produces the conjugate of a partition.\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Partitions of N = %d\n', n );
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

    fprintf ( 1, '  %3d   ', rank );
    for i = 1 : npart
      fprintf ( 1, '%3d', t(i) );
    end
    fprintf ( 1, '\n' );

    [ npartb, b ] = part_sf_conjugate ( n, npart, t );

    fprintf ( 1, '  Con   ', rank );
    for i = 1 : npartb
      fprintf ( 1, '%3d', b(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
