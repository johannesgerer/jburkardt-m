function geometry_test1895 ( )

%*****************************************************************************80
%
%% TEST1895 tests SPHERE_UNIT_AREA_ND, SPHERE_UNIT_AREA_VALUES.
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
  fprintf ( 1, 'TEST1895:\n' );
  fprintf ( 1, '  SPHERE_UNIT_AREA_ND evaluates the area of the unit\n' );
  fprintf ( 1, '  sphere in N dimensions.\n' );
  fprintf ( 1, '  SPHERE_UNIT_AREA_VALUES returns some test values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     DIM_NUM    Exact          Computed\n' );
  fprintf ( 1, '             Area           Area\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, dim_num, area ] = sphere_unit_area_values ( n_data );

    if ( n_data == 0 )
      break
    end

    area2 = sphere_unit_area_nd ( dim_num );

    fprintf ( 1, '  %6d  %10f  %10f\n', dim_num, area, area2 );

  end

  return
end
