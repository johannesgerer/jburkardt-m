function subset_test062 ( )

%*****************************************************************************80
%
%% TEST062 tests I4_PARTITION_RANDOM.
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
  n = 8;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST062\n' );
  fprintf ( 1, '  I4_PARTITION_RANDOM generates a random partition.\n' );
  fprintf ( 1, '  I4_PARTITION_COUNT2 computes a needed table.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;
%
%  Get the partition table.
%
  table = i4_partition_count2 ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of partitions of N\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N    Number of partitions\n' );
  fprintf ( 1, '\n' );

  for j = 1 : n
    fprintf ( 1, '  %4d    %6d\n', j, table(j) );
  end

  fprintf ( 1, '\n' );

  for i = 1 : 5

    [ a, mult, npart, seed ] = i4_partition_random ( n, table, seed );

    i4_partition_print ( n, npart, a, mult );

  end

  return
end
