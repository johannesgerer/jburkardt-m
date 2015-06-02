function triangle_to_fem ( prefix )

%*****************************************************************************80
%
%% MAIN is the main program for TRIANGLE_TO_MEDIT.
%
%  Discussion:
%
%    TRIANGLE_TO_MEDIT converts mesh data from TRIANGLE to MEDIT format.
%
%  Usage:
%
%    triangle_to_medit prefix
%
%    where 'prefix' is the common filename prefix:
%
%    * 'prefix'.node contains the triangle node coordinates,
%    * 'prefix'.ele contains the triangle element node connectivity.
%    * 'prefix'.mesh will contain the MEDIT mesh file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 October 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_TO_MEDIT\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Read a mesh description created by TRIANGLE:\n' );
  fprintf ( 1, '  * "prefix".node, node coordinates.\n' );
  fprintf ( 1, '  * "prefix".ele, element connectivity.\n' );
  fprintf ( 1, '  Write a corresponding MEDIT mesh file.\n' );
  fprintf ( 1, '  * "prefix".mesh.\n' );
%
%  Get the filename prefix.
%
  if ( nargin < 1 )

    prefix = input ( 'Enter the filename prefix:  ' );

  end
%
%  Create the filenames.
%
  triangle_node_filename = strcat ( prefix, '.node' );
  triangle_element_filename = strcat ( prefix, '.ele' );
  medit_filename = strcat ( prefix, '.mesh' );
%
%  Read the triangle node size information.
%
  [ node_num, m, node_att_num, node_marker_num ] = node_size_read ( ...
    triangle_node_filename );
%
%  Read the triangle element size information.
%
  [ element_num, element_order, element_att_num ] = element_size_read ( ...
    triangle_element_filename );
%
%  Report sizes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Size information from TRIANGLE files:\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
  fprintf ( 1, '  Number of nodes NODE_NUM = %d\n', node_num );
  fprintf ( 1, '  NODE_ATT_NUM = %d\n', node_att_num );
  fprintf ( 1, '  NODE_MARKER_NUM = %d\n', node_marker_num );
  fprintf ( 1, '  Number of elements ELEMENT_NUM = %d\n', element_num );
  fprintf ( 1, '  Element order ELEMENT_ORDER = %d\n', element_order );
  fprintf ( 1, '  ELEMENT_ATT_NUM = %d\n', element_att_num );
%
%  Read data.
%
  [ node_x, node_att, node_marker ] = node_data_read ( ...
    triangle_node_filename, node_num, m, node_att_num, node_marker_num );

  [ element_node, element_att ] = element_data_read ( ...
    triangle_element_filename, element_num, element_order, element_att_num );
%
%  Write the MEDIT data.
%
  dim = 2;
  vertices = node_num;
  edges = 0;
  triangles = element_num;
  quadrilaterals = 0;
  tetrahedrons = 0;
  hexahedrons = 0;
  vertex_coordinate(1:2,1:vertices) = node_x(1:2,1:vertices);
  vertex_label(1:vertices) = node_marker(1:vertices);
  edge_vertex = [];
  edge_label = [];
  triangle_vertex(1:3,1:triangles) = element_node(1:3,1:triangles);
  triangle_label(1:triangles) = 0;
  quadrilateral_vertex = [];
  quadrilateral_label = [];
  tetrahedron_vertex = [];
  tetrahedron_label = [];
  hexahedron_vertex = [];
  hexahedron_label = [];

  mesh_write ( medit_filename, dim, vertices, edges, triangles, quadrilaterals, ...
    tetrahedrons, hexahedrons, vertex_coordinate, vertex_label, edge_vertex, ...
    edge_label, triangle_vertex, triangle_label, quadrilateral_vertex, ...
    quadrilateral_label, tetrahedron_vertex, tetrahedron_label, ...
    hexahedron_vertex, hexahedron_label );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_TO_MEDIT:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ element_node, element_att ] = element_data_read ( ...
  element_filename, element_num, element_order, element_att_num )

%*****************************************************************************80
%
%% ELEMENT_DATA_READ reads the data from an element file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ELEMENT_FILENAME, the name of the file.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer ELEMENT_ATT_NUM, number of element attributes 
%    listed on each node record.
%
%    Output, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), 
%    the indices of the nodes that make up each element.
%
%    Output, real ELEMENT_ATT(ELEMENT_ATT_NUM,ELEMENT_NUM), the 
%    attributes of each element.
%
  element = 0;

  input = fopen ( element_filename, 'rt' );

  if ( input < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ELEMENT_DATA_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'ELEMENT_DATA_READ - Fatal error!' );
  end
%
%  Create format.
%
  format = '%d';
  for i = 1 : element_order
    format = strcat ( format, '%d' );
  end
  for i = 1 : element_att_num
    format = strcat ( format, '%g' );
  end
%
%  Create arrays.
%
  element_node = zeros ( element_order, element_num );
  element_att = zeros ( element_att_num, element_num );
%
%  Read values and place in the arrays.
%
  while ( 1 )

    text = fgets ( input );

    if ( text == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ELEMENT_DATA_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'ELEMENT_DATA_READ - Fatal error!' );
    end

    if ( s_len_trim ( text ) == 0 )
      continue
    end

    if ( text(1) == '#' )
      continue
    end
%
%  Ignore the dimension line.
%
    if ( element == 0 )

    else

      [ value, count ] = sscanf ( text, format );

      if ( count < 1 + element_order + element_att_num )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'ELEMENT_DATA_READ - Fatal error!\n' );
        fprintf ( 1, '  Line did not have enough data.\n' );
        error ( 'ELEMENT_DATA_READ - Fatal error!' );
      end

      j = 1;

      for i = 1 : element_order
        j = j + 1;
        element_node(i,element) = value(j);
      end

      for i = 1 : element_att_num
        element_att(i,element) = value(j);
      end

    end

    element = element + 1;

    if ( element_num < element )
      break
    end

  end

  fclose ( input );

  return
end
function [ element_num, element_order, element_att_num ] = ...
  element_size_read ( element_filename )

%*****************************************************************************80
%
%% ELEMENT_SIZE_READ reads the header information from an element file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ELEMENT_FILENAME, the name of the 
%    element file.
%
%    Output, integer ELEMENT_NUM, the number of elements.
%
%    Output, integer ELEMENT_ORDER, the order of the elements.
%
%    Output, integer ELEMENT_ATT_NUM, the number of 
%    element attributes.
%
  input = fopen ( element_filename, 'rt' );

  if ( input < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ELEMENT_SIZE_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'ELEMENT_SIZE_READ - Fatal error!' );
  end

  while ( 1 )

    text = fgets ( input );

    if ( text == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ELEMENT_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'ELEMENT_SIZE_READ - Fatal error!' );
    end

    if ( s_len_trim ( text ) == 0 )
      continue
    end

    if ( text(1) == '#' )
      continue
    end

    [ value, count ] = sscanf ( text, '%d%d%d%d' );

    if ( count < 3 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ELEMENT_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Header line did not have 3 value integers.\n' );
      error ( 'ELEMENT_SIZE_READ - Fatal error!' );
    end

    element_num = value(1);
    element_order = value(2);
    element_att_num = value(3);

    break

  end

  fclose ( input );

  return
end
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
function [ node_coord, node_att, node_marker ] = node_data_read ( ...
  node_filename, node_num, node_dim, node_att_num, node_marker_num )

%*****************************************************************************80
%
%% NODE_DATA_READ reads the data from a node file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2014
%
%  Author:
%
%    John Burkardt
%
% Parameters:
%
%   Input, string NODE_FILENAME, the name of the node file.
%
%   Input, integer NODE_NUM, the number of nodes.
%
%   Input, integer NODE_DIM, the spatial dimension.
%
%   Input, integer NODE_ATT_NUM, number of node attributes 
%   listed on each node record.
%
%   Input, integer NODE_MARKER_NUM, 1 if every node record 
%   includes a final boundary marker value.
%
%   Output, real NODE_COORD(NODE_DIM,NODE_NUM), the nodal 
%   coordinates.
%
%   Output, real NODE_ATT(NODE_ATT_NUM,NODE_NUM), the nodal 
%   attributes.
%
%   Output, integer NODE_MARKER(NODE_MARKER_NUM,NODE_NUM), the 
%   node markers.
%
  node = 0;

  input = fopen ( node_filename, 'rt' );

  if ( input < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NODE_DATA_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'NODE_DATA_READ - Fatal error!' );
  end
%
%  Create format.
%
  format = '%d';
  for i = 1 : node_dim
    format = strcat ( format, '%g' );
  end
  for i = 1 : node_att_num
    format = strcat ( format, '%g' );
  end
  for i = 1 : node_marker_num
    format = strcat ( format, '%d' );
  end
%
%  Create arrays.
%
  node_coord = zeros ( node_dim, node_num );
  node_att = zeros ( node_att_num, node_num );
  node_marker = zeros ( node_marker_num, node_num );
%
%  Read values and place in the arrays.
%
  while ( 1 )

    text = fgets ( input );

    if ( text == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'NODE_DATA_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'NODE_DATA_READ - Fatal error!' );
    end

    if ( s_len_trim ( text ) == 0 )
      continue
    end

    if ( text(1) == '#' )
      continue
    end
%
%  Ignore the dimension line.
%
    if ( node == 0 )

    else

      [ value, count ] = sscanf ( text, format );

      if ( count < 1 + node_dim + node_att_num + node_marker_num )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'NODE_DATA_READ - Fatal error!\n' );
        fprintf ( 1, '  Line did not have enough data.\n' );
        error ( 'NODE_DATA_READ - Fatal error!' );
      end

      j = 1;

      for i = 1 : node_dim
        j = j + 1;
        node_coord(i,node) = value(j);
      end

      for i = 1 : node_att_num
        j = j + 1;
        node_att(i,node) = value(j);
      end

      for i = 1 : node_marker_num
        j = j + 1;
        node_marker(i,node) = value(j);
      end

    end

    node = node + 1;

    if ( node_num < node )
      break
    end

  end

  fclose ( input );

  return
end
function [ node_num, node_dim, node_att_num, node_marker_num ] = ...
  node_size_read ( node_filename )

%*****************************************************************************80
%
%% NODE_SIZE_READ reads the header information from a node file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_FILENAME, the name of the node file.
%
%    Output, integer NODE_NUM, the number of nodes.
%
%    Output, integer NODE_DIM, the spatial dimension.
%
%    Output, integer NODE_ATT_NUM, number of node attributes 
%    listed on each node record.
%
%    Output, integer NODE_MARKER_NUM, 1 if every node record 
%    includes a final boundary marker value.
%
  input = fopen ( node_filename, 'rt' );

  if ( input < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NODE_SIZE_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'NODE_SIZE_READ - Fatal error!' );
  end

  while ( 1 )

    text = fgets ( input );

    if ( text == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'NODE_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'NODE_SIZE_READ - Fatal error!' );
    end

    if ( s_len_trim ( text ) == 0 )
      continue
    end

    if ( text(1) == '#' )
      continue
    end

    [ value, count ] = sscanf ( text, '%d%d%d%d' );

    if ( count < 4 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'NODE_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Header line did not have 4 value integers.\n' );
      error ( 'NODE_SIZE_READ - Fatal error!' );
    end

    node_num = value(1);
    node_dim = value(2);
    node_att_num = value(3);
    node_marker_num = value(4);

    break

  end

  fclose ( input );

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
