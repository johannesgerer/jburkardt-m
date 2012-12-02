function geometry_test1955 ( )

%*****************************************************************************80
%
%% TEST1955 tests SPHERE_UNIT_VOLUME_ND, SPHERE_UNIT_VOLUME_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1955:\n' );
  fprintf ( 1, '  SPHERE_UNIT_VOLUME_ND evaluates the area of the unit\n' );
  fprintf ( 1, '  sphere in N dimensions.\n' );
  fprintf ( 1, '  SPHERE_UNIT_VOLUME_VALUES returns some test values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     DIM_NUM    Exact          Computed\n' );
  fprintf ( 1, '             Volume         Volume\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, dim_num, volume ] = sphere_unit_volume_values ( n_data );

    if ( n_data == 0 )
      break
    end

    volume2 = sphere_unit_volume_nd ( dim_num );

    fprintf ( 1, '  %6d  %10f  %10f\n', dim_num, volume, volume2 );

  end

  return
end
