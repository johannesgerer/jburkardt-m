function [ vertex_coordinate, vertex_label, edge_vertex, edge_label, ...
  triangle_vertex, triangle_label, quadrilateral_vertex, ...
  quadrilateral_label, tetrahedron_vertex, tetrahedron_label, ...
  hexahedron_vertex, hexahedron_label ] = mesh_data_read ( filename, dim, ...
  vertices, edges, triangles, quadrilaterals, tetrahedrons, hexahedrons )

%*****************************************************************************80
%
%% MESH_READ reads a MESH file defining a mesh and returns the data.
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
%    Input, string FILENAME, the name of the MESH file.
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
%    Output, real VERTEX_COORDINATE(DIM,VERTICES), the coordinates
%    of each vertex.
%
%    Output, integer VERTEX_LABEL(VERTICES), a label for each vertex.
%
%    Output, integer EDGE_VERTEX(2,EDGES), the vertices that form each edge.
%
%    Output, integer EDGE_LABEL(EDGES), a label for each edge.
%
%    Output, integer TRIANGLE_VERTEX(3,TRIANGLES), the vertices that form
%    each triangle.
%
%    Output, integer TRIANGLE_LABEL(TRIANGLES), a label for each triangle.
%
%    Output, integer QUADRILATERAL_VERTEX(4,QUADRILATERALS), the vertices that
%    form each quadrilateral.
%
%    Output, integer QUADRILATERAL_LABEL(QUADRILATERALS), a label for
%    each quadrilateral.
%
%    Output, integer TETRAHEDRON_VERTEX(4,TETRAHEDRONS), the vertices that
%    form each tetrahedron.
%
%    Output, integer TETRAHEDRON_LABEL(TETRAHEDRONS), a label for
%    each tetrahedron.
%
%    Output, integer HEXAHEDRON_VERTEX(8,HEXAHEDRONS), the vertices that form
%    each hexahedron.
%
%    Output, integer HEXAHEDRON_LABEL(HEXAHEDRONS), a label for each hexahedron.
%

%
%  Initialize everything to nothing.
%
  vertex_coordinate = [];
  vertex_label = [];
  edge_vertex = [];
  edge_label = [];
  triangle_vertex = [];
  triangle_label = [];
  quadrilateral_vertex = [];
  quadrilateral_label = [];
  tetrahedron_vertex = [];
  tetrahedron_label = [];
  hexahedron_vertex = [];
  hexahedron_label = [];
%
%  Open the file.
%
  unit = fopen ( filename, 'rt' );

  if ( unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', filename );
    error ( 'MESH_DATA_READ - Error!' );
    return
  end
%
%  Read lines til you get alphanumerics and determine a "mode"
%
  line_num = 0;
  keyword = 'NONE';

  while ( 1 )

    text = fgetl ( unit );

    if ( text == -1 )
      break
    end

    line_num = line_num + 1;

    if ( s_len_trim ( text ) == 0 )
      keyword = 'NONE';
      continue
    end

    if ( text(1) == '#' )
      continue
    end
%
%  Remove initial blanks.
%

%
%  Expecting a keyword.
%
        if ( s_eqi ( text, 'CORNERS' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'DIMENSION' ) )

      keyword = 'DIMENSION';

    elseif ( s_eqi ( text, 'EDGES' ) )

      keyword = 'EDGES';

    elseif ( s_eqi ( text, 'END' ) )

      fprintf ( 1, '\n' );
      fprintf ( 1, '  END statement encountered.\n' );
      break

    elseif ( s_eqi ( text, 'HEXAHEDRA' ) || s_eqi ( text, 'HEXAHEDRONS' ) )

      keyword = 'HEXAHEDRONS';

    elseif ( s_begin ( text, 'MESHVERSIONFORMATTED' ) )

    elseif ( s_eqi ( text, 'NORMALATQUADRILATERALVERTICES' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'NORMALATTRIANGLEVERTICES' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'NORMALATVERTICES' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'NORMALS' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'QUADRILATERALS' ) )

      keyword = 'QUADRILATERALS';

    elseif ( s_eqi ( text, 'REQUIREDEDGES' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'REQUIREDVERTICES' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'RIDGES' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'TANGENTATEDGES' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'TANGENTS' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'TETRAHEDRA' ) || s_eqi ( text, 'TETRAHEDRONS' ) )

      keyword = 'TETRAHEDRONS';

    elseif ( s_eqi ( text, 'TRIANGLES' ) )

      keyword = 'TRIANGLES';

    elseif ( s_eqi ( text, 'VERTICES' ) )

      keyword = 'VERTICES';
%
%  Presumably, numeric data to be processed by keyword.
%
    elseif ( s_eqi ( keyword, 'DIMENSION' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
%       dim = value;
      end

      keyword = 'NONE';

    elseif ( s_eqi ( keyword, 'EDGES' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
%       edges = value;
      end

      keyword = 'EDGE_VERTEX';
      edge = 0;
      edge_vertex = zeros ( 2, edges );
      edge_label = zeros ( 1, edges );

    elseif ( s_eqi ( keyword, 'EDGE_VERTEX' ) )

      [ value, count ] = sscanf ( text, '%d  %d  %d' );

      edge = edge + 1;
      edge_vertex(1:2,edge) = value(1:2);
      edge_label(edge) = value(3);

    elseif ( s_eqi ( keyword, 'HEXAHEDRONS' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
%       hexahedrons = value;
      end

      keyword = 'HEXAHEDRON_VERTEX';
      hexahedron = 0;
      hexahedron_vertex = zeros ( 8, hexahedrons );
      hexahedron_label = zeros ( 1, hexahedrons );

    elseif ( s_eqi ( keyword, 'HEXAHEDRON_VERTEX' ) )

      [ value, count ] = sscanf ( text, '%d  %d  %d  %d  %d  %d  %d  %d  %d' );

      hexahedron = hexahedron + 1;
      hexahedron_vertex(1:8,hexahedron) = value(1:8);
      hexahedron_label(hexahedron) = value(9);

    elseif ( s_eqi ( keyword, 'QUADRILATERALS' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
%       quadrilaterals = value;
      end

      keyword = 'QUADRILATERAL_VERTEX';
      quadrilateral = 0;
      quadrilateral_vertex = zeros ( 4, quadrilateral );
      quadrilateral_label = zeros ( 1, quadrilateral );

    elseif ( s_eqi ( keyword, 'QUADRILATERAL_VERTEX' ) )

      [ value, count ] = sscanf ( text, '%d  %d  %d  %d  %d' );

      quadrilateral = quadrilateral + 1;
      quadrilateral_vertex(1:4,quadrilateral) = value(1:4);
      quadrilateral_label(quadrilateral) = value(5);

    elseif ( s_eqi ( keyword, 'TETRAHEDRONS' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
%       tetrahedrons = value;
      end

      keyword = 'TETRAHEDRON_VERTEX';
      tetrahedron = 0;
      tetrahedron_vertex = zeros ( 4, tetrahedron );
      tetrahedron_label = zeros ( 1, tetrahedron );

    elseif ( s_eqi ( keyword, 'TETRAHEDRON_VERTEX' ) )

      [ value, count ] = sscanf ( text, '%d  %d  %d  %d  %d' );

      tetrahedron = tetrahedron + 1;
      tetrahedron_vertex(1:4,tetrahedron) = value(1:4);
      tetrahedron_label(tetrahedron) = value(5);

    elseif ( s_eqi ( keyword, 'TRIANGLES' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
%       triangles = value;
      end

      keyword = 'TRIANGLE_VERTEX';
      triangle = 0;
      triangle_vertex = zeros ( 3, triangle );
      triangle_label = zeros ( 1, triangle );

    elseif ( s_eqi ( keyword, 'TRIANGLE_VERTEX' ) )

      [ value, count ] = sscanf ( text, '%d  %d  %d  %d' );

      triangle = triangle + 1;
      triangle_vertex(1:3,triangle) = value(1:3);
      triangle_label(triangle) = value(4);

    elseif ( s_eqi ( keyword, 'VERTICES' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
%       vertices = value;
      end

      keyword = 'VERTEX_COORDINATE';
      vertex = 0;
      vertex_coordinate = zeros ( dim, vertices );
      vertex_label = zeros ( 1, vertices );

    elseif ( s_eqi ( keyword, 'VERTEX_COORDINATE' ) )

      if ( dim == 2 )
        [ value, count ] = sscanf ( text, '%f  %f  %d' );
      elseif ( dim == 3 )
        [ value, count ] = sscanf ( text, '%f  %f  %f  %d' );
      end

      vertex = vertex + 1;
      vertex_coordinate(1:dim,vertex) = value(1:dim);
      vertex_label(vertex) = value(dim+1);

    elseif ( s_eqi ( keyword, 'SKIP' ) )

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'MESH_DATA_READ - Fatal error!\n' );
      fprintf ( 1, '  Could not find keyword while reading line %d:\n', line_num );
      fprintf ( 1, '"%s"\n', text );
      error ( 'MESH_DATA_READ - Fatal error!\n' );

    end
  end
%
%  Close the file.
%
  fclose ( unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read %d lines from "%s".\n', line_num, filename );

  return
end

