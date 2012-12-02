function geometry_test0325 ( )

%*****************************************************************************80
%
%% TEST0325 tests ICOS_SIZE, ICOS_SHAPE, SHAPE_PRINT_3D.
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
  fprintf ( 1, 'TEST0325\n' );
  fprintf ( 1, '  For the icosahedron,\n' );
  fprintf ( 1, '  ICOS_SIZE returns dimension information;\n' );
  fprintf ( 1, '  ICOS_SHAPE returns face and order information.\n' );
  fprintf ( 1, '  SHAPE_PRINT_3D prints this information.\n' );

  [ point_num, edge_num, face_num, face_order_max ] = icos_size ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points =   %d\n', point_num );
  fprintf ( 1, '  Number of edges =    %d\n', edge_num );
  fprintf ( 1, '  Number of faces =    %d\n', face_num );
  fprintf ( 1, '  Maximum face order = %d\n', face_order_max );

  [ point_coord, edge_point, face_order, face_point ] = icos_shape ( ...
    point_num, edge_num, face_num, face_order_max );

  shape_print_3d ( point_num, face_num, face_order_max, ...
    point_coord, face_order, face_point );

  return
end
