function ice_to_mesh ( prefix )

%*****************************************************************************80
%
%% ICE_TO_MESH reads ICE data from a NETCDF file and writes to a MESH file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string PREFIX, the filename prefix.  The input file is
%    assumed to be "prefix.nc" and the output file will be "prefix.mesh".
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ICE_TO_MESH:\n' );
  fprintf ( 1, '  Read ICE data from NETCDF file, write to MESH file.\n' );
%
%  Check the input argument.
%
  if ( nargin < 1 )
    prefix = input ( '  Enter filename prefix: ' );
  end
%
%  Create the file names.
%
  filename_nc  = strcat ( prefix, '.nc' );
  filename_mesh = strcat ( prefix, '.mesh' );
%
%  Read the data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reading NETCDF file "%s".\n', filename_nc );

  [ dim, vertices, vertex_coordinate, vertex_label, edges, ...
    edge_vertex, edge_label, triangles, triangle_vertex, triangle_label, ...
    quadrilaterals, quadrilateral_vertex, quadrilateral_label, tetrahedrons, ...
    tetrahedron_vertex, tetrahedron_label, hexahedrons, hexahedron_vertex, ...
    hexahedron_label ] = ice_read ( filename_nc );
%
%  Print the data.
%
  if ( vertices < 250 )

    ice_print ( dim, vertices, vertex_coordinate, ...
      vertex_label, edges, edge_vertex, edge_label, triangles, triangle_vertex, ...
      triangle_label, quadrilaterals, quadrilateral_vertex, ...
      quadrilateral_label, tetrahedrons, tetrahedron_vertex, tetrahedron_label, ...
      hexahedrons, hexahedron_vertex, hexahedron_label );

  end
%
%  Write the data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Writing MESH file "%s".\n', filename_mesh );

  mesh_write ( filename_mesh, dim, vertices, vertex_coordinate, ...
    vertex_label, edges, edge_vertex, edge_label, triangles, triangle_vertex, ...
    triangle_label, quadrilaterals, quadrilateral_vertex, ...
    quadrilateral_label, tetrahedrons, tetrahedron_vertex, tetrahedron_label, ...
    hexahedrons, hexahedron_vertex, hexahedron_label );

  fprintf ( 1, '  Conversion completed.\n' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ICE_TO_MESH:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( ) ;

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
function ice_print ( dim, vertices, vertex_coordinate, vertex_label, ...
  edges, edge_vertex, edge_label, triangles, triangle_vertex, ...
  triangle_label, quadrilaterals, quadrilateral_vertex, quadrilateral_label, ...
  tetrahedrons, tetrahedron_vertex, tetrahedron_label, hexahedrons, ...
  hexahedron_vertex, hexahedron_label )

%*****************************************************************************80
%
%% ICE_PRINT prints an ICE grid dataset.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2010
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
%    Input, real VERTEX_COORDINATE(DIM,VERTICES), the coordinates
%    of each vertex.
%
%    Input, integer VERTEX_LABEL(VERTICES), a label for each vertex.
%
%    Input, integer EDGES, the number of edges (may be 0).
%
%    Input, integer EDGE_VERTEX(2,EDGES), the vertices that form each edge.
%
%    Input, integer EDGE_LABEL(EDGES), a label for each edge.
%
%    Input, integer TRIANGLES, the number of triangles (may be 0).
%
%    Input, integer TRIANGLE_VERTEX(3,TRIANGLES), the vertices that form
%    each triangle.
%
%    Input, integer TRIANGLE_LABEL(TRIANGLES), a label for each triangle.
%
%    Input, integer QUADRILATERALS, the number of quadrilaterals (may be 0).
%
%    Input, integer QUADRILATERAL_VERTEX(4,QUADRILATERALS), the vertices that
%    form each quadrilateral.
%
%    Input, integer QUADRILATERAL_LABEL(QUADRILATERALS), a label for
%    each quadrilateral.
%
%    Input, integer TETRAHEDRONS, the number of tetrahedrons (may be 0).
%
%    Input, integer TETRAHEDRON_VERTEX(4,TETRAHEDRONS), the vertices that
%    form each tetrahedron.
%
%    Input, integer TETRAHEDRON_LABEL(TETRAHEDRONS), a label for
%    each tetrahedron.
%
%    Input, integer HEXAHEDRONS, the number of hexahedrons (may be 0).
%
%    Input, integer HEXAHEDRON_VERTEX(8,HEXAHEDRONS), the vertices that form
%    each hexahedron.
%
%    Input, integer HEXAHEDRON_LABEL(HEXAHEDRONS), a label for each hexahedron.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of dimensions = %d\n', dim );
  fprintf ( 1, '  Number of vertices = %d\n', vertices );
  fprintf ( 1, '  Number of edges = %d\n', edges );
  fprintf ( 1, '  Number of triangles = %d\n', triangles );
  fprintf ( 1, '  Number of quadrilaterals = %d\n', quadrilaterals );
  fprintf ( 1, '  Number of tetrahedrons = %d\n', tetrahedrons );
  fprintf ( 1, '  Number of hexahedrons = %d\n', hexahedrons );

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
function [ dim, vertices, vertex_coordinate, vertex_label, edges, ...
  edge_vertex, edge_label, triangles, triangle_vertex, triangle_label, ...
  quadrilaterals, quadrilateral_vertex, quadrilateral_label, tetrahedrons, ...
  tetrahedron_vertex, tetrahedron_label, hexahedrons, hexahedron_vertex, ...
  hexahedron_label ] = ice_read ( filename )

%*****************************************************************************80
%
%% ICE_READ reads an ICE grid dataset from a NETCDF file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2010
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
%    Input, string FILENAME, the name of the file to be read.
%    Ordinarily, the name should include the extension ".nc".
%
%    Output, integer DIM, the spatial dimension, which should be 2 or 3.
%
%    Output, integer VERTICES, the number of vertices.
%
%    Output, real VERTEX_COORDINATE(DIM,VERTICES), the coordinates
%    of each vertex.
%
%    Output, integer VERTEX_LABEL(VERTICES), a label for each vertex.
%
%    Output, integer EDGES, the number of edges (may be 0).
%
%    Output, integer EDGE_VERTEX(2,EDGES), the vertices that form each edge.
%
%    Output, integer EDGE_LABEL(EDGES), a label for each edge.
%
%    Output, integer TRIANGLES, the number of triangles (may be 0).
%
%    Output, integer TRIANGLE_VERTEX(3,TRIANGLES), the vertices that form
%    each triangle.
%
%    Output, integer TRIANGLE_LABEL(TRIANGLES), a label for each triangle.
%
%    Output, integer QUADRILATERALS, the number of quadrilaterals (may be 0).
%
%    Output, integer QUADRILATERAL_VERTEX(4,QUADRILATERALS), the vertices that
%    form each quadrilateral.
%
%    Output, integer QUADRILATERAL_LABEL(QUADRILATERALS), a label for
%    each quadrilateral.
%
%    Output, integer TETRAHEDRONS, the number of tetrahedrons (may be 0).
%
%    Output, integer TETRAHEDRON_VERTEX(4,TETRAHEDRONS), the vertices that
%    form each tetrahedron.
%
%    Output, integer TETRAHEDRON_LABEL(TETRAHEDRONS), a label for
%    each tetrahedron.
%
%    Output, integer HEXAHEDRONS, the number of hexahedrons (may be 0).
%
%    Output, integer HEXAHEDRON_VERTEX(8,HEXAHEDRONS), the vertices that form
%    each hexahedron.
%
%    Output, integer HEXAHEDRON_LABEL(HEXAHEDRONS), a label for each hexahedron.
%

%
%  Initialize everything to nothing.
%
  dim = 0;
  vertices = 0;
  vertex_coordinate = [];
  vertex_label = [];
  edges = 0;
  edge_vertex = [];
  edge_label = [];
  triangles = 0;
  triangle_vertex = [];
  triangle_label = [];
  quadrilaterals = 0;
  quadrilateral_vertex = [];
  quadrilateral_label = [];
  tetrahedrons = 0;
  tetrahedron_vertex = [];
  tetrahedron_label = [];
  hexahedrons = 0;
  hexahedron_vertex = [];
  hexahedron_label = [];
%
%  Open the file.
%
  ncid = netcdf.open ( filename, 'NOWRITE' );
%
%  Return information about the NETCDF file.
%
  [ ndims, nvars, ngatts, unlimdimid ] = netcdf.inq ( ncid );
%
%  Get the dimension information.
%
%  Because NETCDF won't let me define a dimension with extent 0,
%  and because MATLAB won't return an error if I inquire about a
%  dimension that doesn't exist, I have to read every dimension
%  and match it against what I am looking for.
%
%  Then, because MATLAB can't compare strings of different length,
%  I have to take care of that too.
%
  for dims = 0 : ndims - 1

    [ name, len ] = netcdf.inqdim ( ncid, dims );

    if ( s_eqi ( name, 'Dimension' ) )
      dim = len;
    elseif ( s_eqi ( name, 'Vertices' ) )
      vertices = len;
    elseif ( s_eqi ( name, 'Edges' ) )
      edges = len;
    elseif ( s_eqi ( name, 'Triangles' ) )
      triangles = len;
    elseif ( s_eqi ( name, 'Quadrilaterals' ) )
      quadrilaterals = len;
    elseif ( s_eqi ( name, 'Tetrahedrons' ) || ...
             s_eqi ( name, 'Tetrahedra' ) )
      tetrahedrons = len;
    elseif ( s_eqi ( name, 'Hexahedrons' ) || ...
             s_eqi ( name, 'Hexahedra' ) )
      hexahedrons = len;
    end

  end
%
%  Read the data.
%
  var_vertex_coordinate = netcdf.inqVarID ( ncid, 'Vertex_Coordinate' );
  vertex_coordinate = netcdf.getVar ( ncid, var_vertex_coordinate );

  var_vertex_label = netcdf.inqVarID ( ncid, 'Vertex_Label' );
  vertex_label = netcdf.getVar ( ncid, var_vertex_label );

  if ( 0 < edges )
    var_edge_vertex = netcdf.inqVarID ( ncid, 'Edge_Vertex' );
    edge_vertex = netcdf.getVar ( ncid, var_edge_vertex );
    var_edge_label = netcdf.inqVarID ( ncid, 'Edge_Label' );
    edge_label = netcdf.getVar ( ncid, var_edge_label );
  end

  if ( 0 < triangles )
    var_triangle_vertex = netcdf.inqVarID ( ncid, 'Triangle_Vertex' );
    triangle_vertex = netcdf.getVar ( ncid, var_triangle_vertex );
    var_triangle_label = netcdf.inqVarID ( ncid, 'Triangle_Label' );
    triangle_label = netcdf.getVar ( ncid, var_triangle_label );
  end

  if ( 0 < quadrilaterals )
    var_quadrilateral_vertex = netcdf.inqVarID ( ncid, 'Quadrilateral_Vertex' );
    quadrilateral_vertex = netcdf.getVar ( ncid, var_quadrilateral_vertex );
    var_quadrilateral_label = netcdf.inqVarID ( ncid, 'Quadrilateral_Label' );
    quadrilateral_label = netcdf.getVar ( ncid, var_quadrilateral_label );
  end

  if ( 0 < tetrahedrons )
    var_tetrahedron_vertex = netcdf.inqVarID ( ncid, 'Tetrahedron_Vertex' );
    tetrahedron_vertex = netcdf.getVar ( ncid, var_tetrahedron_vertex );
    var_tetrahedron_label = netcdf.inqVarID ( ncid, 'Tetrahedron_Label' );
    tetrahedron_label = netcdf.getVar ( ncid, var_tetrahedron_label );
  end

  if ( 0 < hexahedrons )
    var_hexahedron_vertex = netcdf.inqVarID ( ncid, 'Hexahedron_Vertex' );
    hexahedron_vertex = netcdf.getVar ( ncid, var_hexahedron_vertex );
    var_hexahedron_label = netcdf.inqVarID ( ncid, 'Hexahedron_Label' );
    hexahedron_label = netcdf.getVar ( ncid, var_hexahedron_label );
  end
%
%  Close the file.
%
  netcdf.close ( ncid );

  return
end
function mesh_write ( filename, dim, vertices, vertex_coordinate, ...
  vertex_label, edges, edge_vertex, edge_label, triangles, triangle_vertex, ...
  triangle_label, quadrilaterals, quadrilateral_vertex, ...
  quadrilateral_label, tetrahedrons, tetrahedron_vertex, tetrahedron_label, ...
  hexahedrons, hexahedron_vertex, hexahedron_label )

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
%    14 October 2010
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
%    Input, real VERTEX_COORDINATE(DIM,VERTICES), the coordinates
%    of each vertex.
%
%    Input, integer VERTEX_LABEL(VERTICES), a label for each vertex.
%
%    Input, integer EDGES, the number of edges (may be 0).
%
%    Input, integer EDGE_VERTEX(2,EDGES), the vertices that form each edge.
%
%    Input, integer EDGE_LABEL(EDGES), a label for each edge.
%
%    Input, integer TRIANGLES, the number of triangles (may be 0).
%
%    Input, integer TRIANGLE_VERTEX(3,TRIANGLES), the vertices that form
%    each triangle.
%
%    Input, integer TRIANGLE_LABEL(TRIANGLES), a label for each triangle.
%
%    Input, integer QUADRILATERALS, the number of quadrilaterals (may be 0).
%
%    Input, integer QUADRILATERAL_VERTEX(4,QUADRILATERALS), the vertices that
%    form each quadrilateral.
%
%    Input, integer QUADRILATERAL_LABEL(QUADRILATERALS), a label for
%    each quadrilateral.
%
%    Input, integer TETRAHEDRONS, the number of tetrahedrons (may be 0).
%
%    Input, integer TETRAHEDRON_VERTEX(4,TETRAHEDRONS), the vertices that
%    form each tetrahedron.
%
%    Input, integer TETRAHEDRON_LABEL(TETRAHEDRONS), a label for
%    each tetrahedron.
%
%    Input, integer HEXAHEDRONS, the number of hexahedrons (may be 0).
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
%% S_LEN_TRIM returns the length of a character string to the last nonblank.
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
%    Output, integer LEN, the length of the string up to the last nonblank.
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

