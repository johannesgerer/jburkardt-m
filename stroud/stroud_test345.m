function stroud_test345 ( )

%*****************************************************************************80
%
%% TEST345 tests SPHERE_UNIT_VOLUME_ND, SPHERE_UNIT_VOLUME_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST345:\n' );
  fprintf ( 1, '  SPHERE_UNIT_VOLUME_ND evaluates the area of the unit\n' );
  fprintf ( 1, '  sphere in N dimensions.\n' );
  fprintf ( 1, '  SPHERE_UNIT_VOLUME_VALUES returns some test values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     dim_num    Exact          Computed\n' );
  fprintf ( 1, '                Volume         Volume\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, dim_num, volume ] = sphere_unit_volume_values ( n_data );

    if ( n_data == 0 )
      break
    end

    volume2 = sphere_unit_volume_nd ( dim_num );

    fprintf ( 1, '  %8d  %10.6f  %10.6f\n', dim_num, volume, volume2 );

  end

  return
end
