function mesh_write ( filename, dim, vertices, edges, triangles, ...
  quadrilaterals, tetrahedrons, hexahedrons, vertex_coordinate, ...
  vertex_label, edge_vertex, edge_label, triangle_vertex, triangle_label, ...
  quadrilateral_vertex, quadrilateral_label, tetrahedron_vertex, ...
  tetrahedron_label, hexahedron_vertex, hexahedron_label );

%*****************************************************************************80
%
%% MESH_WRITE writes mesh data to a MESH file.
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
%    Input, string FILENAME, the name of the file to be created.
%    Ordinarily, the name should include the extension ".mesh".
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
  output = fopen ( filename, 'wt' );

  fprintf ( output, 'MeshVersionFormatted 1\n' );
  fprintf ( output, '#  Created by mesh_write.m\n' );
%
%  Dimension information.
%
  fprintf ( output, '\n' );
  fprintf ( output, 'Dimension\n' );
  fprintf ( output, '%d\n', dim );
%
%  Vertices.
%
  fprintf ( output, '\n' );
  fprintf ( output, 'Vertices\n' );
  fprintf ( output, '%d\n', vertices );
  for j = 1 : vertices
    for i = 1 : dim
      fprintf ( output, '  %f', vertex_coordinate(i,j) );
    end
    fprintf ( output, '  %d\n', vertex_label(j) );
  end
%
%  Edges.
%
  if ( 0 < edges )
    fprintf ( output, '\n' );
    fprintf ( output, 'Edges\n' );
    fprintf ( output, '%d\n', edges );
    for j = 1 : edges
      for i = 1 : 2
        fprintf ( output, '  %d', edge_vertex(i,j) );
      end
      fprintf ( output, '  %d\n', edge_label(j) );
    end
  end
%
%  Triangles.
%
  if ( 0 < triangles )
    fprintf ( output, '\n' );
    fprintf ( output, 'Triangles\n' );
    fprintf ( output, '%d\n', triangles );
    for j = 1 : triangles
      for i = 1 : 3
        fprintf ( output, '  %d', triangle_vertex(i,j) );
      end
      fprintf ( output, '  %d\n', triangle_label(j) );
    end
  end
%
%  Quadrilaterals.
%
  if ( 0 < quadrilaterals )
    fprintf ( output, '\n' );
    fprintf ( output, 'Quadrilaterals\n' );
    fprintf ( output, '%d\n', quadrilaterals );
    for j = 1 : quadrilaterals
      for i = 1 : 4
        fprintf ( output, '  %d', quadrilateral_vertex(i,j) );
      end
      fprintf ( output, '  %d\n', quadrilateral_label(j) );
    end
  end
%
%  Tetrahedron.
%
  if ( 0 < tetrahedrons )
    fprintf ( output, '\n' );
    fprintf ( output, 'Tetrahedra\n' );
    fprintf ( output, '%d\n', tetrahedrons );
    for j = 1 : tetrahedrons
      for i = 1 : 4
        fprintf ( output, '  %d', tetrahedron_vertex(i,j) );
      end
      fprintf ( output, '  %d\n', tetrahedron_label(j) );
    end
  end
%
%  Hexahedron.
%
  if ( 0 < hexahedrons )
    fprintf ( output, '\n' );
    fprintf ( output, 'Hexahedra\n' );
    fprintf ( output, '%d\n', hexahedrons );
    for j = 1 : hexahedrons
      for i = 1 : 8
        fprintf ( output, '  %d', hexahedron_vertex(i,j) );
      end
      fprintf ( output, '  %d\n', hexahedron_label(j) );
    end
  end
%
%  End.
%
  fprintf ( output, '\n' );
  fprintf ( output, 'End\n' );

  fclose ( output );

  return
end