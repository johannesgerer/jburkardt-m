function sphere_grid_test08 ( )

%*****************************************************************************80
%
%% SPHERE_GRID_TEST08 tests SPHERE_GRID_T3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 August 2010
%
%  Author:
%
%    John Burkardt
%
  lat_num = 3;
  long_num = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_GRID_TEST08\n' );
  fprintf ( 1, '  SPHERE_GRID_T3 computes a grid\n' );
  fprintf ( 1, '  of T3 triangular elements on a sphere in 3D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of latitudes is  %d\n', lat_num );
  fprintf ( 1, '  Number of longitudes is %d\n', long_num );

  triangle_node = sphere_grid_t3 ( lat_num, long_num );

  triangle_num = 2 * ( lat_num + 1 ) * long_num;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of triangles is %d\n', triangle_num );

  i4mat_transpose_print ( 3, triangle_num, triangle_node, ...
    '  Triangle vertices:' );

  return
end
