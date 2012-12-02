function polpak_test045 ( )

%*****************************************************************************80
%
%% TEST045 tests PARTITION_COUNT_VALUES.
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
  fprintf ( 1, 'TEST045:\n' );
  fprintf ( 1, '  For the number of partitions of an integer,\n' );
  fprintf ( 1, '  PARTITION_COUNT_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N       Exact F\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = partition_count_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %8d  %8d\n', n, c );

  end

  return
end
