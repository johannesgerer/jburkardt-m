function partition_distinct_count_values_test ( )

%*****************************************************************************80
%
%% PARTITION_DISTINCT_COUNT_VALUES_TEST tests PARTITION_DISTINCT_COUNT_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PARTITION_DISTINCT_COUNT_VALUES_TEST:\n' );
  fprintf ( 1, '  PARTITION_DISTINCT_COUNT_VALUES returns values of\n' );
  fprintf ( 1, '  the integer distinct partition count function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N         Q(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = partition_distinct_count_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %10d\n',  n, fn );

  end

  return
end
