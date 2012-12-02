function mesh_io_test02 ( )

%*****************************************************************************80
%
%% MESH_IO_TEST02 creates a MESH dataset and writes it to a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 December 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESH_IO_TEST02:\n' );
  fprintf ( 1, '  Create a tetrahedronal mesh and write it to a file.\n' );

  [ dim, vertices, edges, triangles, quadrilaterals, tetrahedrons, ...
    hexahedrons, vertex_coordinate, vertex_label, edge_vertex, edge_label, ...
    triangle_vertex, triangle_label, quadrilateral_vertex, ...
    quadrilateral_label, tetrahedron_vertex, tetrahedron_label, ...
    hexahedron_vertex, hexahedron_label ] = cyl248 ( );

  filename = 'cyl248.mesh';

  mesh_write ( filename, dim, vertices, edges, triangles, quadrilaterals, ...
    tetrahedrons, hexahedrons, vertex_coordinate, vertex_label, edge_vertex, ...
    edge_label, triangle_vertex, triangle_label, quadrilateral_vertex, ...
    quadrilateral_label, tetrahedron_vertex, tetrahedron_label, ...
    hexahedron_vertex, hexahedron_label );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created the file "%s".\n', filename );

  return
end