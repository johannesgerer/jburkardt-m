function i4_partition_distinct_count_test ( )

%*****************************************************************************80
%
%% I4_PARTITION_DISTINCT_COUNT_TEST tests I4_PARTITION_DISTINCT_COUNT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_PARTITION_DISTINCT_COUNT_TEST:\n' );
  fprintf ( 1, '  For the number of partitions of an integer\n' );
  fprintf ( 1, '  into distinct parts,\n' );
  fprintf ( 1, '  I4_PARTITION_DISTINCT_COUNT computes any value;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N       Exact F    Q(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = partition_distinct_count_values ( n_data );

    if ( n_data == 0 )
      break
    end

    c2 = i4_partition_distinct_count ( n );

    fprintf ( 1, '  %8d  %8d  %8d\n', n, c, c2 );

  end

  return
end

