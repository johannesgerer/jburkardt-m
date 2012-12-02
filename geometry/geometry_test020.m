function geometry_test020 ( )

%*****************************************************************************80
%
%% TEST020 tests CUBE_SIZE_3D, CUBE_SHAPE_3D, SHAPE_PRINT_3D.
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
  fprintf ( 1, 'TEST020\n' );
  fprintf ( 1, '  For the cube,\n' );
  fprintf ( 1, '  CUBE_SIZE_3D returns dimension information;\n' );
  fprintf ( 1, '  CUBE_SHAPE_3D returns face and order information.\n' );
  fprintf ( 1, '  SHAPE_PRINT_3D prints this information.\n' );

  [ point_num, edge_num, face_num, face_order_max ] = cube_size_3d ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points =   %d\n', point_num );
  fprintf ( 1, '  Number of edges =    %d\n', edge_num );
  fprintf ( 1, '  Number of faces =    %d\n', face_num );
  fprintf ( 1, '  Maximum face order = %d\n', face_order_max );

  [ point_coord, face_order, face_point ] = cube_shape_3d ( ...
    point_num, face_num, face_order_max );

  shape_print_3d ( point_num, face_num, face_order_max, ...
    point_coord, face_order, face_point );

  return
end
