function mesh_to_ice ( prefix )

%*****************************************************************************80
%
%% MESH_TO_ICE reads ICE data from a MESH file and writes to a NETCDF file.
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
%    assumed to be "prefix.mesh" and the output file will be "prefix.nc".
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESH_TO_ICE:\n' );
  fprintf ( 1, '  Read ICE data from MESH file, write to NETCDF file.\n' );
%
%  Check the input argument.
%
  if ( nargin < 1 )
    prefix = input ( '  Enter filename prefix: ' );
  end
%
%  Create the file names.
%
  filename_mesh = strcat ( prefix, '.mesh' );
  filename_nc  = strcat ( prefix, '.nc' );
%
%  Read the data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reading "%s"\n', filename_mesh );

  [ dim, vertices, vertex_coordinate, vertex_label, edges, ...
    edge_vertex, edge_label, triangles, triangle_vertex, triangle_label, ...
    quadrilaterals, quadrilateral_vertex, quadrilateral_label, tetrahedrons, ...
    tetrahedron_vertex, tetrahedron_label, hexahedrons, hexahedron_vertex, ...
    hexahedron_label ] = mesh_read ( filename_mesh );
%
%  Write the data.
%
  fprintf ( 1, '  Writing "%s"\n', filename_nc );

  ice_write ( filename_nc, dim, vertices, vertex_coordinate, ...
    vertex_label, edges, edge_vertex, edge_label, triangles, triangle_vertex, ...
    triangle_label, quadrilaterals, quadrilateral_vertex, ...
    quadrilateral_label, tetrahedrons, tetrahedron_vertex, tetrahedron_label, ...
    hexahedrons, hexahedron_vertex, hexahedron_label );

  fprintf ( 1, '  Conversion completed.\n' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESH_TO_ICE:\n' );
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
%    Output, logical TRUEFALSE, is TRUE if the characters are equal.
%
  if ( ch_cap ( c1 ) == ch_cap ( c2 ) )
    truefalse = 1;
  else
    truefalse = 0;
  end

  return
end
function ice_write ( filename, dim, vertices, vertex_coordinate, ...
  vertex_label, edges, edge_vertex, edge_label, triangles, triangle_vertex, ...
  triangle_label, quadrilaterals, quadrilateral_vertex, ...
  quadrilateral_label, tetrahedrons, tetrahedron_vertex, tetrahedron_label, ...
  hexahedrons, hexahedron_vertex, hexahedron_label )

%*****************************************************************************80
%
%% ICE_WRITE writes ICE mesh data to a NETCDF file.
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
%    Input, string FILENAME, the name of the file to be created.
%    Ordinarily, the name should include the extension ".nc".
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

%
%  Retrieve some constants.
%
  nc_clobber = netcdf.getConstant ( 'NC_CLOBBER' );
  nc_double = netcdf.getConstant ( 'NC_DOUBLE' );
  nc_int = netcdf.getConstant ( 'NC_INT' );
%
%  Create the file.  This automatically "opens" it as well.
%
  mode = nc_clobber;
  ncid = netcdf.create ( filename, mode );
%
%  Dimension information.
%
%  If a dimension has length 0, it seems to be taken to be the unlimited
%  dimension (not what you want) and then if you have two such dimensions,
%  you get a ninny complaint that you've tried to define the unlimited dimension
%  twice.  The fix requires the programmer not to write anything whose
%  dimension is zero.
%
  name = 'Dimension';
  leng = dim;
  dim_dimension = netcdf.defDim ( ncid, name, leng );

  name = 'Vertices';
  leng = vertices;
  dim_vertices = netcdf.defDim ( ncid, name, leng );

  if ( 0 < edges )
    name = 'Edges';
    leng = edges;
    dim_edges = netcdf.defDim ( ncid, name, leng );
  end

  if ( 0 < triangles )
    name = 'Triangles';
    leng = triangles;
    dim_triangles = netcdf.defDim ( ncid, name, leng );
  end

  if ( 0 < quadrilaterals )
    name = 'Quadrilaterals';
    leng = quadrilaterals;
    dim_quadrilaterals = netcdf.defDim ( ncid, name, leng );
  end

  if ( 0 < tetrahedrons )
    name = 'Tetrahedrons';
    leng = tetrahedrons;
    dim_tetrahedrons = netcdf.defDim ( ncid, name, leng );
  end

  if ( 0 < hexahedrons )
    name = 'Hexahedrons';
    leng = hexahedrons;
    dim_hexahedrons = netcdf.defDim ( ncid, name, leng );
  end

  name = 'Two';
  leng = 2;
  dim_two = netcdf.defDim ( ncid, name, leng );

  name = 'Three';
  leng = 3;
  dim_three = netcdf.defDim ( ncid, name, leng );

  name = 'Four';
  leng = 4;
  dim_four = netcdf.defDim ( ncid, name, leng );

  name = 'Eight';
  leng = 8;
  dim_eight = netcdf.defDim ( ncid, name, leng );
%
%  Define variables.
%
  name = 'Vertex_Coordinate';
  xtype = nc_double;
  if ( dim == 2 )
    dimids = [ dim_two, dim_vertices ];
  elseif ( dim == 3 )
    dimids = [ dim_three, dim_vertices ];
  end
  var_vertex_coordinate = netcdf.defVar ( ncid, name, xtype, dimids );

  name = 'Vertex_Label';
  xtype = nc_int;
  dimids = [ dim_vertices ];
  var_vertex_label = netcdf.defVar ( ncid, name, xtype, dimids );

  if ( 0 < edges )

    name = 'Edge_Vertex';
    xtype = nc_int;
    dimids = [ dim_two, dim_edges ];
    var_edge_vertex = netcdf.defVar ( ncid, name, xtype, dimids );

    name = 'Edge_Label';
    xtype = nc_int;
    dimids = [ dim_edges ];
    var_edge_label = netcdf.defVar ( ncid, name, xtype, dimids );

  end

  if ( 0 < triangles )

    name = 'Triangle_Vertex';
    xtype = nc_int;
    dimids = [ dim_three, dim_triangles ];
    var_triangle_vertex = netcdf.defVar ( ncid, name, xtype, dimids );

    name = 'Triangle_Label';
    xtype = nc_int;
    dimids = [ dim_triangles ];
    var_triangle_label = netcdf.defVar ( ncid, name, xtype, dimids );

  end

  if ( 0 < quadrilaterals )

    name = 'Quadrilateral_Vertex';
    xtype = nc_int;
    dimids = [ dim_four, dim_quadrilaterals ];
    var_quadrilateral_vertex = netcdf.defVar ( ncid, name, xtype, dimids );

    name = 'Quadrilateral_Label';
    xtype = nc_int;
    dimids = [ dim_quadrilaterals ];
    var_quadrilateral_label = netcdf.defVar ( ncid, name, xtype, dimids );

  end

  if ( 0 < tetrahedrons )

    name = 'Tetrahedron_Vertex';
    xtype = nc_int;
    dimids = [ dim_four, dim_tetrahedrons ];
    var_tetrahedron_vertex = netcdf.defVar ( ncid, name, xtype, dimids );

    name = 'Tetrahedron_Label';
    xtype = nc_int;
    dimids = [ dim_tetrahedrons ];
    var_tetrahedron_label = netcdf.defVar ( ncid, name, xtype, dimids );

  end

  if ( 0 < hexahedrons )

    name = 'Hexahedron_Vertex';
    xtype = nc_int;
    dimids = [ dim_eight, dim_hexahedrons ];
    var_hexahedron_vertex = netcdf.defVar ( ncid, name, xtype, dimids );

    name = 'Hexahedron_Label';
    xtype = nc_int;
    dimids = [ dim_hexahedrons ];
    var_hexahedron_label = netcdf.defVar ( ncid, name, xtype, dimids );

  end
%
%  Terminate the definition phase.
%
  netcdf.endDef ( ncid );
%
%  Write the data.
%
  netcdf.putVar ( ncid, var_vertex_coordinate, vertex_coordinate );
  netcdf.putVar ( ncid, var_vertex_label, vertex_label );
  if ( 0 < edges )
    netcdf.putVar ( ncid, var_edge_vertex, edge_vertex );
    netcdf.putVar ( ncid, var_edge_label, edge_label );
  end
  if ( 0 < triangles )
    netcdf.putVar ( ncid, var_triangle_vertex, triangle_vertex );
    netcdf.putVar ( ncid, var_triangle_label, triangle_label );
  end
  if ( 0 < quadrilaterals )
    netcdf.putVar ( ncid, var_quadrilateral_vertex, quadrilateral_vertex );
    netcdf.putVar ( ncid, var_quadrilateral_label, quadrilateral_label );
  end
  if ( 0 < tetrahedrons )
    netcdf.putVar ( ncid, var_tetrahedron_vertex, tetrahedron_vertex );
    netcdf.putVar ( ncid, var_tetrahedron_label, tetrahedron_label );
  end
  if ( 0 < hexahedrons )
    netcdf.putVar ( ncid, var_hexahedron_vertex, hexahedron_vertex );
    netcdf.putVar ( ncid, var_hexahedron_label, hexahedron_label );
  end
%
%  Close the file.
%
  netcdf.close ( ncid );

  return
end
function [ dim, vertices, vertex_coordinate, vertex_label, edges, ...
  edge_vertex, edge_label, triangles, triangle_vertex, triangle_label, ...
  quadrilaterals, quadrilateral_vertex, quadrilateral_label, tetrahedrons, ...
  tetrahedron_vertex, tetrahedron_label, hexahedrons, hexahedron_vertex, ...
  hexahedron_label ] = mesh_read ( filename )

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
%    Output, integer TETRAHEDRAONS, the number of tetrahedrons (may be 0).
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
%    Input, string FILENAME, the name of the MESH file.
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
  unit = fopen ( filename, 'rt' );

  if ( unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', filename );
    error ( 'MESH_READ - Error!' );
    return
  end
%
%  Read lines til you get alphanumerics and determine a "mode"
%
  line_num = 0;
  keyword = 'NONE';
  two_power = 1;

  while ( 1 )

    text = fgetl ( unit );

    if ( text == -1 )
      break
    end

    line_num = line_num + 1;

    if ( line_num == two_power )
      fprintf ( 1, '  Line %d\n', line_num );
      two_power = two_power * 2;
    end

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
        hexahedrons = value;
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
        quadrilaterals = value;
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
        tetrahedrons = value;
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
        triangles = value;
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
        vertices = value;
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
      fprintf ( 1, 'MESH_READ - Fatal error!\n' );
      fprintf ( 1, '  Could not find keyword while reading line %d:\n', line_num );
      fprintf ( 1, '"%s"\n', text );
      error ( 'MESH_READ - Fatal error!\n' );

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

