function geometry_test203235 ( )

%*****************************************************************************80
%
%% TEST203235 tests TETRAHEDRON_RHOMBIC_SIZE_3D and TETRAHEDRON_RHOMBIC_SHAPE_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 July 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST203235\n' );
  fprintf ( 1, '  For the cube,\n' );
  fprintf ( 1, '  TETRAHEDRON_RHOMBIC_SIZE_3D returns dimension information;\n' );
  fprintf ( 1, '  TETRAHEDRON_RHOMBIC_SHAPE_3D returns face and order information.\n' );
  fprintf ( 1, '  SHAPE_PRINT_3D prints this information.\n' );
%
%  Get the data sizes.
%
  [ point_num, edge_num, face_num, face_order_max ] = ...
    tetrahedron_rhombic_size_3d ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points =   %d\n', point_num );
  fprintf ( 1, '  Number of edges =    %d\n', edge_num );
  fprintf ( 1, '  Number of faces =    %d\n', face_num );
  fprintf ( 1, '  Maximum face order = %d\n', face_order_max );
%
%  Get the data.
%
  [ point_coord, face_order, face_point ] = ...
    tetrahedron_rhombic_shape_3d ( point_num, face_num, face_order_max );
%
%  Print the data.
%
  shape_print_3d ( point_num, face_num, face_order_max, ...
    point_coord, face_order, face_point );

  return
end
