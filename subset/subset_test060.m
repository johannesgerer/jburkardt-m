function subset_test060 ( )

%*****************************************************************************80
%
%% TEST060 tests I4_PARTITION_NEXT2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST060\n' );
  fprintf ( 1, '  I4_PARTITION_NEXT2 produces partitions of an integer.\n' );
  fprintf ( 1, '\n' );

  npart = 0;
  a = [];
  mult = [];
  more = 0;

  while ( 1 )

    [ npart, a, mult, more ] = i4_partition_next2 ( n, npart, a, mult, more );

    i4_partition_print ( n, npart, a, mult );

    if ( ~more )
      break
    end

  end

  return
end
