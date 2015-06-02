function medit_io_test01 ( )

%*****************************************************************************80
%
%% MEDIT_IO_TEST01 creates a MESH dataset and writes it to a file.
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
  fprintf ( 1, 'MEDIT_IO_TEST01:\n' );
  fprintf ( 1, '  Create a hexahedral mesh and write it to a file.\n' );

  [ dim, vertices, edges, triangles, quadrilaterals, tetrahedrons, ...
    hexahedrons, vertex_coordinate, vertex_label, edge_vertex, edge_label, ...
    triangle_vertex, triangle_label, quadrilateral_vertex, ...
    quadrilateral_label, tetrahedron_vertex, tetrahedron_label, ...
    hexahedron_vertex, hexahedron_label ] = hexahexa_2x2x2 ( );

  filename = 'hexahexa_2x2x2.mesh';

  mesh_write ( filename, dim, vertices, edges, triangles, quadrilaterals, ...
    tetrahedrons, hexahedrons, vertex_coordinate, vertex_label, edge_vertex, ...
    edge_label, triangle_vertex, triangle_label, quadrilateral_vertex, ...
    quadrilateral_label, tetrahedron_vertex, tetrahedron_label, ...
    hexahedron_vertex, hexahedron_label );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created the file "%s".\n', filename );

  return
end

