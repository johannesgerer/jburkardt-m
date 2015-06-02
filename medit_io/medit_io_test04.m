function medit_io_test04 ( filename )

%*****************************************************************************80
%
%% MEDIT_IO_TEST04 reads a MESH dataset and prints its data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 November 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MEDIT_IO_TEST04\n' );
  fprintf ( 1, '  Read a mesh file and print its data.\n' );
%
%  Read sizes.
%
  [ dim, vertices, edges, triangles, quadrilaterals, tetrahedrons, ...
    hexahedrons ] = mesh_size_read ( filename );

  [ vertex_coordinate, vertex_label, edge_vertex, edge_label, ...
    triangle_vertex, triangle_label, quadrilateral_vertex, ...
    quadrilateral_label, tetrahedron_vertex, tetrahedron_label, ...
    hexahedron_vertex, hexahedron_label ] = mesh_data_read ( filename, ...
    dim, vertices, edges, triangles, quadrilaterals, tetrahedrons, ...
    hexahedrons );
%
%  Print information.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Header information for "%s":\n', filename );

  mesh_data_print ( dim, vertices, edges, triangles, quadrilaterals, ...
    tetrahedrons, hexahedrons, vertex_coordinate, vertex_label, ...
    edge_vertex, edge_label, triangle_vertex, triangle_label, ...
    quadrilateral_vertex, quadrilateral_label, tetrahedron_vertex, ...
    tetrahedron_label, hexahedron_vertex, hexahedron_label );

  return
end
