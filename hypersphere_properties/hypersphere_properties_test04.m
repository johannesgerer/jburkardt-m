function hypersphere_properties_test04 ( )

%*****************************************************************************80
%
%% HYPERSPHERE_PROPERTIES_TEST04 tests HYPERSPHERE_01_VOLUME.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERSPHERE_PROPERTIES_TEST04:\n' );
  fprintf ( 1, '  HYPERSPHERE_01_VOLUME evaluates the area of the unit\n' );
  fprintf ( 1, '  hypersphere in M dimensions.\n' );
  fprintf ( 1, '  HYPERSPHERE_01_VOLUME_VALUES returns some test values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       M      Exact       Computed\n' );
  fprintf ( 1, '              Volume      Volume\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, m, volume ] = hypersphere_01_volume_values ( n_data );

    if ( n_data == 0 )
      break
    end

    volume2 = hypersphere_01_volume ( m );

    fprintf ( 1, '  %6d  %10f  %10f\n', m, volume, volume2 );

  end

  return
end
