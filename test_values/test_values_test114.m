function test_values_test114 ( )

%*****************************************************************************80
%
%% TEST114 demonstrates the use of PARTITION_COUNT_VALUES.
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
  fprintf ( 1, 'TEST114:\n' );
  fprintf ( 1, '  PARTITION_COUNT_VALUES returns values of \n' );
  fprintf ( 1, '  the integer partition count function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N         P(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = partition_count_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %10d\n', n, fn );

  end

  return
end
