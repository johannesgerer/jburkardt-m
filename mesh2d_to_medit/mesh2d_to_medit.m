function mesh2d_to_medit ( p, t, mesh_filename )

%*****************************************************************************80
%
%% MAIN is the main program for MESH2D_TO_MEDIT.
%
%  Discussion:
%
%    MESH2D_TO_MEDIT writes MESH2D data to a MEDIT file.
%
%  Usage:
%
%    mesh2d_to_medit ( p, t, 'filename' )
%
%    * P is the Nx2 node coordinates;
%    * T is the Mx3 list of nodes forming triangles.
%    * MESH_FILENAME is the filename to be created.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P(N,2), the point coordinates.
%
%    Input, integer T(N,3), the nodes making up each triangle.
%
%    Input, string MESH_FILENAME, the name of the MEDIT mesh file to create.
%
  [ node_num, dim_num ] = size ( p );
  [ element_num, order_num ] = size ( t );
%
%  Set up the MEDIT data.
%
  dim = dim_num;
  vertices = node_num;
  edges = 0;
  triangles = element_num;
  quadrilaterals = 0;
  tetrahedrons = 0;
  hexahedrons = 0;

  edge_label           = zeros (1,edges);
  edge_vertex          = zeros (2,edges);
  hexahedron_label     = zeros (1,hexahedrons);
  hexahedron_vertex    = zeros (8,hexahedrons);
  quadrilateral_label  = zeros (1,quadrilaterals);
  quadrilateral_vertex = zeros (4,quadrilaterals);
  tetrahedron_label    = zeros (1,tetrahedrons);
  tetrahedron_vertex   = zeros (4,tetrahedrons);
  triangle_label       = zeros (1,triangles);
  triangle_vertex      = zeros (3,triangles);
  vertex_coordinate    = zeros (dim,vertices);
  vertex_label         = zeros (1,vertices);

  if ( 0 < triangles )
    triangle_vertex(1:3,1:triangles) = t(1:triangles,1:3)';
  end
  triangle_label(1:triangles) = 0;

  vertex_coordinate(1:dim,1:vertices) = p(1:vertices,1:dim_num)';
  vertex_label(1,1:vertices) = 0;
%
%  Write the MEDIT file.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Writing MESH file: "%s".\n', mesh_filename );

  medit_write ( mesh_filename, dim, vertices, edges, triangles, ...
    quadrilaterals, tetrahedrons, hexahedrons, vertex_coordinate, ...
    vertex_label, edge_vertex, edge_label, triangle_vertex, triangle_label, ...
    quadrilateral_vertex, quadrilateral_label, tetrahedron_vertex, ...
    tetrahedron_label, hexahedron_vertex, hexahedron_label );

  return
end
function [ node_coord, element_node, boundary_node_mask ] = fem_data_read ( ...
  node_filename, element_filename, boundary_node_mask_filename, dim_num, ...
  node_num, element_num, element_order )

%*****************************************************************************80
%
%% FEM_DATA_READ reads data from a set of FEM files.
%
%  Discussion:
%
%    This program reads the node, element and mask files that define
%    a finite element geometry and data based on that geometry:
%    * a set of nodes,
%    * a set of elements based on those nodes,
%    * a mask that indicates which nodes are on the boundary.
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
%  Parameters:
%
%    Input, string NODE_FILENAME, the name of the node
%    coordinate file.  If this argument is not supplied, it will be requested.
%    If the interactive response is blank, or otherwise defective, then the
%    program terminates.
%
%    Input, string ELEMENT_FILENAME, the name of the element
%    file.  If this argument is not supplied, it will be requested.  If the
%    interactive response is blank, then the program will assume that no
%    element information is to be supplied.  (But the node coordinates must
%    be available and may be plotted.  And if a node data file is supplied,
%    then the data can be plotted against the node coordinates without using
%    any finite element structure.)
%
%    Input, string BOUNDARY_NODE_MASK_FILENAME, the name of the
%    boundary node mask file.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Output, real NODE_COORD(DIM_NUM,NODE_NUM), the coordinates
%    of nodes.
%
%    Output, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM);
%    the global index of local node I in element J.
%
%    Output, integer BOUNDARY_NODE_MASK(NODE_NUM), is 0 for
%    each interior node and 1 for each boundary node.
%
  node_coord = r8mat_data_read ( node_filename, dim_num, node_num );

  element_node = i4mat_data_read ( element_filename, element_order, ...
    element_num );

  boundary_node_mask = i4mat_data_read ( boundary_node_mask_filename, ...
    1, node_num );

  return
end
function fem_header_print ( dim_num, node_num, element_num, element_order )

%*****************************************************************************80
%
%% FEM_HEADER_PRINT prints the header to set of FEM files.
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
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension         = %d\n', dim_num );
  fprintf ( 1, '  Number of nodes           = %d\n', node_num );
  fprintf ( 1, '  Number of elements        = %d\n', element_num );
  fprintf ( 1, '  Element order             = %d\n', element_order );

  return
end
function [ dim_num, node_num, element_num, element_order ] = fem_header_read ( ...
  node_filename, element_filename )

%*****************************************************************************80
%
%% FEM_HEADER_READ reads the sizes of arrays in a set of FEM files.
%
%  Discussion:
%
%    This program reads the node, element and data files that define
%    a finite element geometry and data based on that geometry:
%    * a set of nodes,
%    * a set of elements based on those nodes,
%    and returns the sizes DIM_NUM, NODE_NUM, ELEMENT_NUM, ELEMENT_ORDER,
%    required to allocate space for these arrays.
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
%  Parameters:
%
%    Input, string NODE_FILENAME, the name of the node
%    coordinate file.  If this argument is not supplied, it will be requested.
%    If the interactive response is blank, or otherwise defective, then the
%    program terminates.
%
%    Input, string ELEMENT_FILENAME, the name of the element
%    file.  If this argument is not supplied, it will be requested.  If the
%    interactive response is blank, then the program will assume that no
%    element information is to be supplied.  (But the node coordinates must
%    be available and may be plotted.  And if a node data file is supplied,
%    then the data can be plotted against the node coordinates without using
%    any finite element structure.)
%
%    Output, integer DIM_NUM, the spatial dimension, inferred from
%    the "shape" of the data in the node file.
%
%    Output, integer NODE_NUM, the number of nodes, inferred from
%    the number of lines of data in the node coordinate file.
%
%    Output, integer ELEMENT_NUM, the number of elements, inferred
%    from the number of lines of data in the element file.
%
%    Output, integer ELEMENT_ORDER, the order of the elements,
%    inferred from the number of items in the first line of the element file.
%
  [ dim_num, node_num ] = r8mat_header_read ( node_filename );

  [ element_order, element_num ] = i4mat_header_read ( element_filename );

  return
end
function column_num = file_column_count ( input_file_name )

%*****************************************************************************80
%
%% FILE_COLUMN_COUNT counts the columns in the first line of a file.
%
%  Discussion:
%
%    The file is assumed to be a simple text file.
%
%    Most lines of the file are presumed to consist of COLUMN_NUM words,
%    separated by spaces.  There may also be some blank lines, and some 
%    comment lines, which have a "#" in column 1.
%
%    The routine tries to find the first non-comment non-blank line and
%    counts the number of words in that line.
%
%    If all lines are blanks or comments, it goes back and tries to analyze
%    a comment line.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the file.
%
%    Output, integer COLUMN_NUM, the number of columns in the file.
%
  FALSE = 0;
  TRUE = 1;
%
%  Open the file.
%
  input_unit = fopen ( input_file_name );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_COLUMN_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'FILE_COLUMN_COUNT - Error!' );
    column_num = -1;
    return;
  end
%
%  Read one line, but skip blank lines and comment lines.
%  Use FGETL so we drop the newline character!
%
  got_one = FALSE;

  while ( 1 )

    line = fgetl ( input_unit );

    if ( line == -1 )
      break;
    end

    if ( s_len_trim ( line ) == 0 )

    elseif ( line(1) == '#' )

    else
      got_one = TRUE;
      break;
    end

  end

  fclose ( input_unit );

  if ( got_one == FALSE ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_COLUMN_COUNT - Warning!\n' );
    fprintf ( 1, '  The file does not seem to contain any data.\n' );
    column_num = -1;
    return;
  end

  column_num = s_word_count ( line );

  return
end
function row_num = file_row_count ( input_file_name )

%*****************************************************************************80
%
%% FILE_ROW_COUNT counts the number of row records in a file.
%
%  Discussion:
%
%    Each input line is a "RECORD".
%
%    The records are divided into three groups:
%    
%    * BLANK LINES (nothing but blanks)
%    * COMMENT LINES (begin with a '#')
%    * DATA RECORDS (anything else)
%
%    The value returned by the function is the number of data records.
%
%    By the way, if the MATLAB routine FGETS is used, instead of
%    FGETL, then the variable LINE will include line termination 
%    characters, which means that a blank line would not actually
%    have zero characters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
%    Output, integer ROW_NUM, the number of rows found. 
%
  input_unit = fopen ( input_file_name );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_ROW_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'FILE_ROW_COUNT - Error!' );
    row_num = -1;
    return;
  end

  blank_num = 0;
  comment_num = 0;
  row_num = 0;
  
  record_num = 0;

  while ( 1 )

    line = fgetl ( input_unit );

    if ( line == -1 )
      break;
    end

    record_num = record_num + 1;
    record_length = s_len_trim ( line );
    
    if ( record_length <= 0 )
      blank_num = blank_num + 1;
    elseif ( line(1) == '#' )
      comment_num = comment_num + 1;
    else
      row_num = row_num + 1;
    end

  end

  fclose ( input_unit );

  return
end
function table = i4mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% I4MAT_DATA_READ reads data from an I4MAT file.
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
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer M, N, the number of rows and columns in the data.
%
%    Output, integer TABLE(M,N), the point coordinates.
%

%
%  Build up the format string for reading M real numbers.
%
  string = ' ';

  for i = 0 : m
    string = strcat ( string, ' %d' );
  end

  input_unit = fopen ( input_filename );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'I4MAT_DATA_READ - Error!' );
  end

  table = zeros ( m, n );

  i = 0;

  while ( i < n )

    line = fgets ( input_unit );

    if ( line == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'I4MAT_DATA_READ - Error!\n' );
      fprintf ( 1, '  End of input while reading data.\n' );
      error ( 'I4MAT_DATA_READ - Error!' );
    end

    if ( line(1) == '#' )

    elseif ( s_len_trim ( line ) == 0 )
      
    else

      [ x, count ] = sscanf ( line, string );

      if ( count == m )
        i = i + 1;
        table(1:m,i) = x(1:m);
      end

    end

  end

  fclose ( input_unit );

  return
end
function [ m, n ] = i4mat_header_read ( input_filename )

%*****************************************************************************80
%
%% I4MAT_HEADER_READ reads the header from an I4MAT file.
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
%    22 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Output, integer M, the spatial dimension.
%
%    Output, integer N, the number of points.
%
  m = file_column_count ( input_filename );

  if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data columns in\n' );
    fprintf ( 1, '  the file %s.\n', input_filename );
  end

  n = file_row_count ( input_filename );

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data rows in\n' );
    fprintf ( 1, '  the file %s\n', input_filename );
  end

  return
end
function medit_write ( filename, dim, vertices, edges, triangles, ...
  quadrilaterals, tetrahedrons, hexahedrons, vertex_coordinate, ...
  vertex_label, edge_vertex, edge_label, triangle_vertex, triangle_label, ...
  quadrilateral_vertex, quadrilateral_label, tetrahedron_vertex, ...
  tetrahedron_label, hexahedron_vertex, hexahedron_label );

%*****************************************************************************80
%
%% MEDIT_WRITE writes mesh data to a MEDIT file.
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
  fprintf ( output, '#  Created by medit_write.m\n' );
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
function table = r8mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% R8MAT_DATA_READ reads data from an R8MAT file.
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
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer M, N, the number of rows and columns of data.
%
%    Output, real TABLE(M,N), the point coordinates.
%

%
%  Build up the format string for reading M real numbers.
%
  string = ' ';

  for i = 0 : m
    string = strcat ( string, ' %f' );
  end

  input_unit = fopen ( input_filename );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the file.\n' );
    error ( 'R8MAT_DATA_READ - Error!' );
  end

  table = zeros(m,n);

  i = 0;

  while ( i < n )

    line = fgets ( input_unit );

    if ( line == -1 )
      break;
    end

    if ( line(1) == '#' )

    elseif ( s_len_trim ( line ) == 0 )
      
    else

      [ x, count ] = sscanf ( line, string );

      if ( count == m )
        i = i + 1;
        table(1:m,i) = x(1:m);
      end

    end

  end

  fclose ( input_unit );

  return
end
function [ m, n ] = r8mat_header_read ( input_filename )

%*****************************************************************************80
%
%% R8MAT_HEADER_READ reads the header from an R8MAT file.
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
%    22 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Output, integer M, the spatial dimension.
%
%    Output, integer N, the number of points.
%
  m = file_column_count ( input_filename );

  if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data columns in\n' );
    fprintf ( 1, '  the file %s.\n', input_filename );
  end

  n = file_row_count ( input_filename );

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data rows in\n' );
    fprintf ( 1, '  the file %s\n', input_filename );
  end

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
function word_num = s_word_count ( s )

%*****************************************************************************80
%
%% S_WORD_COUNT counts the number of "words" in a string.
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
%    Input, string S, the string to be examined.
%
%    Output, integer WORD_NUM, the number of "words" in the string.
%    Words are presumed to be separated by one or more blanks.
%
  FALSE = 0;
  TRUE = 1;

  word_num = 0;
  s_length = length ( s );

  if ( s_length <= 0 )
    return;
  end

  blank = TRUE;

  for i = 1 : s_length

    if ( s(i) == ' ' )
      blank = TRUE;
    elseif ( blank == TRUE )
      word_num = word_num + 1;
      blank = FALSE;
    end

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
