function geometry_test0238 ( )

%*****************************************************************************80
%
%% TEST0238 tests DUAL_SIZE_3D;
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
  fprintf ( 1, 'TEST0238\n' );
  fprintf ( 1, '  DUAL_SIZE_3D finds the "sizes" of the dual of a\n' );
  fprintf ( 1, '    polyhedron;\n' );
%
%  Get the CUBE shape.
%
  [ point_num1, edge_num1, face_num1, face_order_max1 ] = ...
    cube_size_3d ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The cube:\n' );
  fprintf ( 1, '    Number of vertices: %d\n', point_num1 );
  fprintf ( 1, '    Number of edges:    %d\n', edge_num1 );
  fprintf ( 1, '    Number of faces   : %d\n', face_num1 );
  fprintf ( 1, '    Maximum face order: %d\n', face_order_max1 );

  [ point_coord1, face_order1, face_point1 ] = ...
    cube_shape_3d ( point_num1, face_num1, face_order_max1 ); 

  [ point_num2, edge_num2, face_num2, face_order_max2 ] = dual_size_3d ( ...
    point_num1, edge_num1, face_num1, face_order_max1, point_coord1, ...
    face_order1, face_point1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The dual of the cube:\n' );
  fprintf ( 1, '    Number of vertices: %d\n', point_num2 );
  fprintf ( 1, '    Number of edges:    %d\n', edge_num2 );
  fprintf ( 1, '    Number of faces   : %d\n', face_num2 );
  fprintf ( 1, '    Maximum face order: %d\n', face_order_max2 );
%
%  Get the DODECAHEDRON shape.
%
  [ point_num1, edge_num1, face_num1, face_order_max1 ] = ...
    dodec_size_3d ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The dodecahedron:\n' );
  fprintf ( 1, '    Number of vertices: %d\n', point_num1 );
  fprintf ( 1, '    Number of edges:    %d\n', edge_num1 );
  fprintf ( 1, '    Number of faces   : %d\n', face_num1 );
  fprintf ( 1, '    Maximum face order: %d\n', face_order_max1 );

  [ point_coord1, face_order1, face_point1 ] = ...
    dodec_shape_3d ( point_num1, face_num1, face_order_max1 ); 

  [ point_num2, edge_num2, face_num2, face_order_max2 ] = dual_size_3d ( ...
    point_num1, edge_num1, face_num1, face_order_max1, point_coord1, ...
    face_order1, face_point1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The dual of the dodecahedron:\n' );
  fprintf ( 1, '    Number of vertices: %d\n', point_num2 );
  fprintf ( 1, '    Number of edges:    %d\n', edge_num2 );
  fprintf ( 1, '    Number of faces   : %d\n', face_num2 );
  fprintf ( 1, '    Maximum face order: %d\n', face_order_max2 );
%
%  Get the ICOSAHEDRON shape.
%
  [ point_num1, edge_num1, face_num1, face_order_max1 ] = icos_size ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The icosahedron:\n' );
  fprintf ( 1, '    Number of vertices: %d\n', point_num1 );
  fprintf ( 1, '    Number of edges:    %d\n', edge_num1 );
  fprintf ( 1, '    Number of faces   : %d\n', face_num1 );
  fprintf ( 1, '    Maximum face order: %d\n', face_order_max1 );

  [ point_coord1, edge_point1, face_order1, face_point1 ] = ...
    icos_shape ( point_num1, edge_num1, face_num1, face_order_max1 ); 

  [ point_num2, edge_num2, face_num2, face_order_max2 ] = dual_size_3d ( ...
    point_num1, edge_num1, face_num1, face_order_max1, point_coord1, ...
    face_order1, face_point1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The dual of the icosahedron:\n' );
  fprintf ( 1, '    Number of vertices: %d\n', point_num2 );
  fprintf ( 1, '    Number of edges:    %d\n', edge_num2 );
  fprintf ( 1, '    Number of faces   : %d\n', face_num2 );
  fprintf ( 1, '    Maximum face order: %d\n', face_order_max2 );
%
%  Get the OCTAHEDRON shape.
%
  [ point_num1, edge_num1, face_num1, face_order_max1 ] = ...
    octahedron_size_3d ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The octahedron:\n' );
  fprintf ( 1, '    Number of vertices: %d\n', point_num1 );
  fprintf ( 1, '    Number of edges:    %d\n', edge_num1 );
  fprintf ( 1, '    Number of faces   : %d\n', face_num1 );
  fprintf ( 1, '    Maximum face order: %d\n', face_order_max1 );

  [ point_coord1, face_order1, face_point1 ] = ...
    octahedron_shape_3d ( point_num1, face_num1, face_order_max1 ); 

  [ point_num2, edge_num2, face_num2, face_order_max2 ] = dual_size_3d ( ...
    point_num1, edge_num1, face_num1, face_order_max1, point_coord1, ...
    face_order1, face_point1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The dual of the octahedron:\n' );
  fprintf ( 1, '    Number of vertices: %d\n', point_num2 );
  fprintf ( 1, '    Number of edges:    %d\n', edge_num2 );
  fprintf ( 1, '    Number of faces   : %d\n', face_num2 );
  fprintf ( 1, '    Maximum face order: %d\n', face_order_max2 );
%
%  Get the SOCCER BALL shape.
%
  [ point_num1, edge_num1, face_num1, face_order_max1 ] = ...
    soccer_size_3d ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The soccer ball:\n' );
  fprintf ( 1, '    Number of vertices: %d\n', point_num1 );
  fprintf ( 1, '    Number of edges:    %d\n', edge_num1 );
  fprintf ( 1, '    Number of faces   : %d\n', face_num1 );
  fprintf ( 1, '    Maximum face order: %d\n', face_order_max1 );

  [ point_coord1, face_order1, face_point1 ] = ...
    soccer_shape_3d ( point_num1, face_num1, face_order_max1 ); 

  [ point_num2, edge_num2, face_num2, face_order_max2 ] = dual_size_3d ( ...
    point_num1, edge_num1, face_num1, face_order_max1, point_coord1, ...
    face_order1, face_point1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The dual of the "soccer ball":\n' );
  fprintf ( 1, '    Number of vertices: %d\n', point_num2 );
  fprintf ( 1, '    Number of edges:    %d\n', edge_num2 );
  fprintf ( 1, '    Number of faces   : %d\n', face_num2 );
  fprintf ( 1, '    Maximum face order: %d\n', face_order_max2 );
%
%  Get the TETRAHEDRON shape.
%
  [ point_num1, edge_num1, face_num1, face_order_max1 ] = ...
    tetrahedron_size_3d ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The tetrahedron:\n' );
  fprintf ( 1, '    Number of vertices: %d\n', point_num1 );
  fprintf ( 1, '    Number of edges:    %d\n', edge_num1 );
  fprintf ( 1, '    Number of faces   : %d\n', face_num1 );
  fprintf ( 1, '    Maximum face order: %d\n', face_order_max1 );

  [ point_coord1, face_order1, face_point1 ] = ...
    tetrahedron_shape_3d ( point_num1, face_num1, face_order_max1 ); 

  [ point_num2, edge_num2, face_num2, face_order_max2 ] = dual_size_3d ( ...
    point_num1, edge_num1, face_num1, face_order_max1, point_coord1, ...
    face_order1, face_point1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The dual of the tetrahedron:\n' );
  fprintf ( 1, '    Number of vertices: %d\n', point_num2 );
  fprintf ( 1, '    Number of edges:    %d\n', edge_num2 );
  fprintf ( 1, '    Number of faces   : %d\n', face_num2 );
  fprintf ( 1, '    Maximum face order: %d\n', face_order_max2 );

  return
end
