function medit_to_fem ( prefix )

%*****************************************************************************80
%
%% MAIN is the main program for TRIANGLE_TO_FEM.
%
%  Discussion:
%
%    MEDIT_TO_FEM converts mesh data from MEDIT to FEM format.
%
%  Usage:
%
%    medit_to_fem prefix
%
%    where 'prefix' is the common filename prefix:
%
%    * 'prefix'.mesh is the MEDIT mesh file.
%    * 'prefix'_nodes.txt will contain the node coordinates.
%    * 'prefix'_elements.txt will contain the element node connectivity.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 November 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MEDIT_TO_FEM\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Read a mesh description created by MEDIT\n' );
  fprintf ( 1, '  * "prefix".mesh.\n' );
  fprintf ( 1, '  Write two simple FEM files listing nodes and elements.\n' );
  fprintf ( 1, '  * "prefix"_nodes.txt, node coordinates.\n' );
  fprintf ( 1, '  * "prefix"_elements.txt, element connectivity.\n' );
%
%  Get the filename prefix.
%
  if ( nargin < 1 )

    prefix = input ( 'Enter the filename prefix:  ' );

  end
%
%  Create the filenames.
%
  medit_filename = strcat ( prefix, '.mesh' );
  fem_node_filename = strcat ( prefix, '_nodes.txt' );
  fem_element_filename = strcat ( prefix, '_elements.txt' );
%
%  Read MEDIT sizes.
%
  [ dim, vertices, edges, triangles, quadrilaterals, tetrahedrons, ...
    hexahedrons ] = mesh_size_read ( medit_filename );
%
%  Report sizes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of dimensions = %d\n', dim );
  fprintf ( 1, '  Number of vertices = %d\n', vertices );
  fprintf ( 1, '  Number of edges = %d\n', edges );
  fprintf ( 1, '  Number of triangles = %d\n', triangles );
  fprintf ( 1, '  Number of quadrilaterals = %d\n', quadrilaterals );
  fprintf ( 1, '  Number of tetrahedrons = %d\n', tetrahedrons );
  fprintf ( 1, '  Number of hexahedrons = %d\n', hexahedrons );
%
%  Read MEDIT data.
%
  [ vertex_coordinate, vertex_label, edge_vertex, edge_label, ...
    triangle_vertex, triangle_label, quadrilateral_vertex, ...
    quadrilateral_label, tetrahedron_vertex, tetrahedron_label, ...
    hexahedron_vertex, hexahedron_label ] = mesh_data_read ( medit_filename, ...
    dim, vertices, edges, triangles, quadrilaterals, tetrahedrons, ...
    hexahedrons );
%
%  Choose the FEM data.
%
%  We need to assume that there is only one element type.
%  If there are elements of multiple dimension, take the highest.
%
  m = dim;
  node_num = vertices;
  r8mat_write ( fem_node_filename, dim, vertices, vertex_coordinate );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created node coordinate file "%s"\n', fem_node_filename );

  if ( 0 < hexahedrons && dim == 3 )

    element_order = 8;
    element_num = hexahedrons;
    i4mat_write ( fem_element_filename, element_order, element_num, ...
      hexahedron_vertex );

  elseif ( 0 < tetrahedrons && dim == 3 )

    element_order = 4;
    element_num = tetrahedrons;
    i4mat_write ( fem_element_filename, element_order, element_num, ...
      tetrahedron_vertex );

  elseif ( 0 < quadrilaterals && dim == 2 )

    element_order = 4;
    element_num = quadrilaterals;
    i4mat_write ( fem_element_filename, element_order, element_num, ...
      quadrilateral_vertex );

  elseif ( 0 < triangles && dim == 2 )

    element_order = 3;
    element_num = triangles;
    i4mat_write ( fem_element_filename, element_order, element_num, ...
      triangle_vertex );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'MEDIT_TO_FEM - Fatal error!\n' );
    fprintf ( 1, '  Unexpected combination of spatial dimension\n' );
    fprintf ( 1, '  and number of nonzero objects.\n' );
    error ( 'MEDIT_TO_FEM - Fatal error!' );

  end

  fprintf ( 1, '  Created element connectivity file "%s"\n', ...
    fem_element_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MEDIT_TO_FEM:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function c = ch_cap ( c )

%*****************************************************************************80
%
%% CH_CAP capitalizes a single character.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the character to capitalize.
%
%    Output, character C, the capitalized character.
%
  if ( 'a' <= c && c <= 'z' )
    c = c + 'A' - 'a';
  end

  return
end
function truefalse = ch_eqi ( c1, c2 )

%*****************************************************************************80
%
%% CH_EQI is a case insensitive comparison of two characters for equality.
%
%  Example:
%
%    CH_EQI ( 'A', 'a' ) is TRUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C1, C2, the characters to compare.
%
%    Output, logical TRUEFALSE, is TRUE (1) if the characters are equal.
%
  FALSE = 0;
  TRUE = 1;

  if ( ch_cap ( c1 ) == ch_cap ( c2 ) )
    truefalse = TRUE;
  else
    truefalse = FALSE;
  end

  return
end
function i4mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% I4MAT_WRITE writes an I4MAT file.
%
%  Discussion:
%
%    An I4MAT is an array of I4's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, integer TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'I4MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %d', round ( table(i,j) ) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
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
function [ dim, vertices, edges, triangles, quadrilaterals, tetrahedrons, ...
  hexahedrons ] = mesh_size_read ( filename )

%*****************************************************************************80
%
%% MESH_SIZE_READ reads a MESH file defining a mesh and returns sizes only.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2010
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
%    Output, integer DIM, the spatial dimension, which should be 2 or 3.
%
%    Output, integer VERTICES, the number of vertices.
%
%    Output, integer EDGES, the number of edges (may be 0).
%
%    Output, integer TRIANGLES, the number of triangles (may be 0).
%
%    Output, integer QUADRILATERALS, the number of quadrilaterals (may be 0).
%
%    Output, integer TETRAHEDRONS, the number of tetrahedrons (may be 0).
%
%    Output, integer HEXAHEDRONS, the number of hexahedrons (may be 0).
%

%
%  Initialize everything to nothing.
%
  dim = 0;
  vertices = 0;
  edges = 0;
  triangles = 0;
  quadrilaterals = 0;
  tetrahedrons = 0;
  hexahedrons = 0;
%
%  Open the file.
%
  unit = fopen ( filename, 'rt' );

  if ( unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_SIZE_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', filename );
    error ( 'MESH_SIZE_READ - Error!' );
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
        dim = value;
      end

      keyword = 'NONE';

    elseif ( s_eqi ( keyword, 'EDGES' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
        edges = value;
      end

      keyword = 'EDGE_VERTEX';

    elseif ( s_eqi ( keyword, 'EDGE_VERTEX' ) )

      [ value, count ] = sscanf ( text, '%d  %d  %d' );

    elseif ( s_eqi ( keyword, 'HEXAHEDRONS' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
        hexahedrons = value;
      end

      keyword = 'HEXAHEDRON_VERTEX';

    elseif ( s_eqi ( keyword, 'HEXAHEDRON_VERTEX' ) )

      [ value, count ] = sscanf ( text, '%d  %d  %d  %d  %d  %d  %d  %d  %d' );

    elseif ( s_eqi ( keyword, 'QUADRILATERALS' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
        quadrilaterals = value;
      end

      keyword = 'QUADRILATERAL_VERTEX';

    elseif ( s_eqi ( keyword, 'QUADRILATERAL_VERTEX' ) )

      [ value, count ] = sscanf ( text, '%d  %d  %d  %d  %d' );

    elseif ( s_eqi ( keyword, 'TETRAHEDRONS' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
        tetrahedrons = value;
      end

      keyword = 'TETRAHEDRON_VERTEX';

    elseif ( s_eqi ( keyword, 'TETRAHEDRON_VERTEX' ) )

      [ value, count ] = sscanf ( text, '%d  %d  %d  %d  %d' );

    elseif ( s_eqi ( keyword, 'TRIANGLES' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
        triangles = value;
      end

      keyword = 'TRIANGLE_VERTEX';

    elseif ( s_eqi ( keyword, 'TRIANGLE_VERTEX' ) )

      [ value, count ] = sscanf ( text, '%d  %d  %d  %d' );

    elseif ( s_eqi ( keyword, 'VERTICES' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
        vertices = value;
      end

      keyword = 'VERTEX_COORDINATE';

    elseif ( s_eqi ( keyword, 'VERTEX_COORDINATE' ) )

      if ( dim == 2 )
        [ value, count ] = sscanf ( text, '%f  %f  %d' );
      elseif ( dim == 3 )
        [ value, count ] = sscanf ( text, '%f  %f  %f  %d' );
      end

    elseif ( s_eqi ( keyword, 'SKIP' ) )

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'MESH_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Could not find keyword while reading line %d:\n', line_num );
      fprintf ( 1, '"%s"\n', text );
      error ( 'MESH_SIZE_READ - Fatal error!\n' );

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
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
%  Alternative print statements include:
%
%     fprintf ( output_unit, '  %24.16e', table(i,j) );
%     fprintf ( output_unit, '  %14.6e', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %g', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function value = s_begin ( s1, s2 )

%*****************************************************************************80
%
%% S_BEGIN is TRUE if one string matches the beginning of the other.
%
%  Discussion:
%
%    The strings are compared, ignoring blanks and capitalization.
%
%  Example:
%
%     S1              S2      S_BEGIN
%
%    'Bob'          'BOB'     TRUE
%    '  B  o b '    ' bo b'   TRUE
%    'Bob'          'Bobby'   TRUE
%    'Bobo'         'Bobb'    FALSE
%    ' '            'Bob'     FALSE    (Do not allow a blank to match
%                                       anything but another blank string.)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character S1(*), S2(*), the strings to be compared.
%
%    Output, logical S_BEGIN, is TRUE if the strings match up to
%    the end of the shorter string, ignoring case.
%
  len1 = s_len_trim ( s1 );
  len2 = s_len_trim ( s2 );
%
%  If either string is blank, then both must be blank to match.
%  Otherwise, a blank string matches anything, which is not
%  what most people want.
%
  if ( len1 == 0 || len2 == 0 )

    if ( len1 == 0 && len2 == 0 )
      value = 1;
    else
      value = 0;
    end

    return

  end

  i1 = 0;
  i2 = 0;
%
%  Find the next nonblank in S1.
%
  while ( 1 )

    while ( 1 )

      i1 = i1 + 1;

      if ( len1 < i1 )
        value = 1;
        return
      end

      if ( s1(i1) ~= ' ' )
        break
      end

    end
%
%  Find the next nonblank in S2.
%
    while ( 1 )

      i2 = i2 + 1;

      if ( len2 < i2 )
        value = 1;
        return
      end

      if ( s2(i2) ~= ' ' )
        break
      end

    end
%
%  If the characters match, get the next pair.
%
    if ( ~ch_eqi ( s1(i1), s2(i2) ) )
      break
    end

  end

  value = 0;

  return
end
function value = s_eqi ( s1, s2 )

%*****************************************************************************80
%
%% S_EQI is a case insensitive comparison of two strings for equality.
%
%  Example:
%
%    S_EQI ( 'Anjana', 'ANJANA' ) is TRUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, S2, the strings to compare.
%
%    Output, logical VALUE, is TRUE if the strings are equal.
%
  len1 = length ( s1 );
  len2 = length ( s2 );
  lenc = min ( len1, len2 );

  for i = 1 : lenc

    c1 = ch_cap ( s1(i) );
    c2 = ch_cap ( s2(i) );

    if ( c1 ~= c2 )
      value = 0;
      return
    end

  end

  for i = lenc + 1 : len1
    if ( s1(i) ~= ' ' )
      value = 0;
      return
    end
  end

  for i = lenc + 1 : len2
    if ( s2(i) ~= ' ' )
      value = 0;
      return
    end
  end

  value = 1;

  return
end
function len = s_len_trim ( s )

%*****************************************************************************80
%
% S_LEN_TRIM returns the length of a character string to the last nonblank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be measured.
%
%    Output, integer LENGTH, the length of the string up to the last nonblank.
%
  len = length ( s );

  while ( 0 < len )
    if ( s(len) ~= ' ' )
      return
    end
    len = len - 1;
  end

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
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
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
