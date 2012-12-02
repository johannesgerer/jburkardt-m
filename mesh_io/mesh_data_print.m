function mesh_data_print ( dim, vertices, edges, triangles, quadrilaterals, ...
  tetrahedrons, hexahedrons, vertex_coordinate, vertex_label, edge_vertex, ...
  edge_label, triangle_vertex, triangle_label, quadrilateral_vertex, ...
  quadrilateral_label, tetrahedron_vertex, tetrahedron_label, ...
  hexahedron_vertex, hexahedron_label )

%*****************************************************************************80
%
%% MESH_DATA_PRINT prints mesh data.
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
%  Reference:
%
%    Pascal Frey,
%    MEDIT: An interactive mesh visualization software,
%    Technical Report RT-0253,
%    Institut National de Recherche en Informatique et en Automatique,
%    03 December 2001.
%
%  Parameters:
%
%    Input, integer DIM, the spatial dimension, which should be 2 or 3.
%
%    Input, integer VERTICES, the number of vertices.
%
%    Input, integer EDGES, the number of edges (may be 0).
%
%    Input, integer TRIANGLES, the number of triangles (may be 0).
%
%    Input, integer QUADRILATERALS, the number of quadrilaterals (may be 0).
%
%    Input, integer TETRAHEDRONS, the number of tetrahedrons (may be 0).
%
%    Input, integer HEXAHEDRONS, the number of hexahedrons (may be 0).
%
%    Input, real VERTEX_COORDINATE(DIM,VERTICES), the coordinates
%    of each vertex.
%
%    Input, integer VERTEX_LABEL(VERTICES), a label for each vertex.
%
%    Input, integer EDGE_VERTEX(2,EDGES), the vertices that form each edge.
%
%    Input, integer EDGE_LABEL(EDGES), a label for each edge.
%
%    Input, integer TRIANGLE_VERTEX(3,TRIANGLES), the vertices that form
%    each triangle.
%
%    Input, integer TRIANGLE_LABEL(TRIANGLES), a label for each triangle.
%
%    Input, integer QUADRILATERAL_VERTEX(4,QUADRILATERALS), the vertices that
%    form each quadrilateral.
%
%    Input, integer QUADRILATERAL_LABEL(QUADRILATERALS), a label for
%    each quadrilateral.
%
%    Input, integer TETRAHEDRON_VERTEX(4,TETRAHEDRONS), the vertices that
%    form each tetrahedron.
%
%    Input, integer TETRAHEDRON_LABEL(TETRAHEDRONS), a label for
%    each tetrahedron.
%
%    Input, integer HEXAHEDRON_VERTEX(8,HEXAHEDRONS), the vertices that form
%    each hexahedron.
%
%    Input, integer HEXAHEDRON_LABEL(HEXAHEDRONS), a label for each hexahedron.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Vertices:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : vertices
    for i = 1 : dim
      fprintf ( 1, '  %f', vertex_coordinate(i,j) );
    end
    fprintf ( 1, '  (%d)\n', vertex_label(j) );
  end

  if ( 0 < edges )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Edges:\n' );
    fprintf ( 1, '\n' );
    for j = 1 : edges
      fprintf ( 1, '  %d  %d  (%d)\n', edge_vertex(1:2,j), edge_label(j) );
    end
  end

  if ( 0 < triangles )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Triangles:\n' );
    fprintf ( 1, '\n' );
    for j = 1 : triangles
      fprintf ( 1, '  %d  %d  %d  (%d)\n', ...
        triangle_vertex(1:3,j), triangle_label(j) );
    end
  end

  if ( 0 < quadrilaterals )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Quadrilaterals:\n' );
    fprintf ( 1, '\n' );
    for j = 1 : quadrilaterals
      fprintf ( 1, '  %d  %d  %d  %d  (%d)\n', ...
        quadrilateral_vertex(1:4,j), quadrilateral_label(j) );
    end
  end

  if ( 0 < tetrahedrons )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Tetrahedrons:\n' );
    fprintf ( 1, '\n' );
    for j = 1 : tetrahedrons
      fprintf ( 1, '  %d  %d  %d  %d  (%d)\n', ...
        tetrahedron_vertex(1:4,j), tetrahedron_label(j) );
    end
  end

  if ( 0 < hexahedrons )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Hexahedrons:\n' );
    fprintf ( 1, '\n' );
    for j = 1 : hexahedrons
      fprintf ( 1, '  %d  %d  %d  %d  %d  %d  %d  %d  (%d)\n', ...
        hexahedron_vertex(1:8,j), hexahedron_label(j) );
    end
  end

  return
end
