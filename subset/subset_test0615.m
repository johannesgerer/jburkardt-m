function subset_test0615 ( )

%*****************************************************************************80
%
%% TEST0615 tests I4_PARTITION_COUNT2, I4_PARTITION_COUNT_VALUES.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0615\n' );
  fprintf ( 1, '  I4_PARTITION_COUNT2 counts partitions of an integer.\n' );
  fprintf ( 1, '  I4_PARTITION_COUNT_VALUES returns some exact values.\n' );

  n_data = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '   N     Exact     Count\n' );
  fprintf ( 1, '\n' );

  while ( 1 )

    [ n_data, n, p ] = i4_partition_count_values ( n_data );

    if ( n_data == 0 )
      break
    end

    p2 = i4_partition_count2 ( n );
 
    fprintf ( 1, '  %4d  %8d  %8d\n', n, p, p2(n+1) );

  end

  return
end
