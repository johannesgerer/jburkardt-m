function triangle_display ( prefix, node_show, element_show )

%*****************************************************************************80
%
%% TRIANGLE_DISPLAY ...
%
%  Discussion:
%
%  ...
%
%  Usage:
%
%    triangulation_display prefix node_show element_show
%
%    where:
%
%    'prefix' is the common prefix for the node and element files:
%
%    * prefix.node,     the node coordinates.
%    * prefix.ele,  the nodes that make up each element.
%
%    'node_show' indicates the node visibility:
%
%    0: do not show the nodes;
%    1:        show the nodes;
%    2:        show the nodes, and label them.
%
%    'element_show' indicates the element visibility:
%
%    0: do not show the element;
%    1:        show the element;
%    2:        show the element, and color them.
%    3:        show the element, and color them, and label them.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jonathan Shewchuk,
%    Triangle: Engineering a 2D Quality Mesh Generator and
%    Delaunay Triangulator,
%    in Applied Computational Geometry: Towards Geometric Engineering,
%    edited by Ming Lin, Dinesh Manocha,
%    Lecture Notes in Computer Science, Volume 1148,
%    Springer, 1996,
%    ISBN: 354061785X,
%    LC: QA448.D38.A635.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_DISPLAY:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Display a triangulation defined by TRIANGLE data files\n' );
  fprintf ( 1, '    "prefix.node", containing node coordinates, and\n' );
  fprintf ( 1, '    "prefix.ele", listing nodes that form elements.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The program "showme" does this already, and more.\n' );
  fprintf ( 1, '  However, that program cannot zoom;\n' );
  fprintf ( 1, '  It cannot save the output except in PS or EPS format.\n' );
  fprintf ( 1, '  It cannot make contour plots of node-based data.\n' );
%
%  First argument is the file prefix.
%
  if ( nargin < 1 )
    prefix = input ( '  Enter the file prefix:' );
  end
%
%  Second argument is node visibility.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Options for node visibility:\n' );
    fprintf ( 1, '  0: do not show the nodes;\n' );
    fprintf ( 1, '  1:        show the nodes;\n' );
    fprintf ( 1, '  2:        show the nodes, and label them.\n' );
    node_show = input ( '  Enter the node visibility option:  ' );
  end
%
%  Third argument is element visibility.
%
  if ( nargin < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Options for element visibility:\n' );
    fprintf ( 1, '  0: do not show the elements;\n' );
    fprintf ( 1, '  1:        show the elements;\n' );
    fprintf ( 1, '  2:        show the elements, and color them.\n' );
    fprintf ( 1, '  3:        show the elements, and color them, and label them.\n' );
    element_show = input ( '  Enter the element visibility option:  ' );
  end
%
%  Read the node information.
%
  node_filename = strcat ( prefix, '.node' );

  [ node_num, marker ] = node_header_read ( node_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', node_num );

  [ node_xy, node_marker ] = node_data_read ( node_filename, node_num );

  r8mat_transpose_print_some ( 2, node_num, node_xy, 1, 1, 2, 10, ...
    '  Coordinates of first 10 nodes:' );

  i4vec_print_some ( node_num, node_marker, 1, 10, ...
    '  Marker for first 10 nodes:' )
%
%  Read the element information.
%
  element_filename = strcat ( prefix, '.ele.' );

  [ element_order, element_num ] = element_header_read ( element_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Order of elements = %d\n', element_order );
  fprintf ( 1, '  Number of elements = %d\n', element_num );

  element_node = element_data_read ( element_filename, element_order, ...
    element_num );

  i4mat_transpose_print_some ( element_order, element_num, element_node, ...
    1, 1, element_order, 10, '  First 10 elements:' );
%
%  Detect and correct zero-based node indexing.
%
  element_node = mesh_base_one ( node_num, element_order, element_num, ...
    element_node );
%
%  Display a plot.
%
  triangulation_display_matlab ( prefix, node_num, node_xy, element_order, ...
    element_num, element_node, node_show, element_show );
%
%  Optional output of node and element arrays in "FEM2D" format.
%
  if ( 1 )

    node_filename = strcat ( prefix, '_nodes.txt' );
    r8mat_write ( node_filename, 2, node_num, node_xy );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Wrote FEM version of node coordinates to "%s".\n', ...
      node_filename );

    element_filename = strcat ( prefix, '_elements.txt' );
    i4mat_write ( element_filename, element_order, element_num, element_node );

    fprintf ( 1, '  Wrote FEM version of element data to "%s".\n', ...
      element_filename );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_DISPLAY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function element_node = element_data_read ( element_filename, element_order, ...
  element_num )

%*****************************************************************************80
%
%% ELEMENT_DATA_READ reads the data of an element file.
%
%  Discussion:
%
%  
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jonathan Shewchuk,
%    Triangle: Engineering a 2D Quality Mesh Generator and
%    Delaunay Triangulator,
%    in Applied Computational Geometry: Towards Geometric Engineering,
%    edited by Ming Lin, Dinesh Manocha,
%    Lecture Notes in Computer Science, Volume 1148,
%    Springer, 1996,
%    ISBN: 354061785X,
%    LC: QA448.D38.A635.
%
%  Parameters:
%
%    Input, string ELEMENT_FILENAME, the name of the file.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Output, real ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), ...
%
  element_node = zeros ( element_order, element_num );

  input = fopen ( element_filename, 'rt' );
  text_num = 0;
  read_header = 0;
  element = 0;

  while ( 1 )

    text = fgetl ( input );

    if ( text == -1 )
      break
    end

    text_num = text_num + 1;

    if ( text(1) == '#' )
      continue
    end

    if ( s_len_trim ( text ) <= 0 )
      continue
    end
%
%  Read (but ignore) header line.
%
    if ( ~read_header )

      [ a, count ] = sscanf ( text, '%d', 3 );

      if ( count ~= 3 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'ELEMENT_DATA_READ - Fatal error!\n' );
        fprintf ( 1, '  Could not read 3 integers from element header line.\n' );
        fprintf ( 1, '  File is "%s".\n', element_filename );
        fprintf ( 1, '  Line number = %d.\n', text_num );
        error ( 'ELEMENT_DATA_READ - Fatal error!' );
      end

      read_header = 1;
%
%  Read data for next element.
%
    else

      [ a, count ] = sscanf ( text, '%d', element_order + 1 );

      if ( count ~= 4 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'ELEMENT_DATA_READ - Fatal error!\n' );
        fprintf ( 1, '  Could not read %d values for element %d.\n',  ...
          element_order + 1, element + 1 );
        fprintf ( 1, '  File is "%s".\n', element_filename );
        fprintf ( 1, '  Line number = %d.\n', text_num );
        error ( 'ELEMENT_DATA_READ - Fatal error!' );
      end

      element = element + 1;
      element_node(1:element_order,element) = a(2:element_order+1);

      if ( element_num <= element )
        break
      end

    end

  end

  fclose ( input );

  return
end
function [ element_order, element_num ] = element_header_read ( ...
  element_filename )

%*****************************************************************************80
%
%% ELEMENT_HEADER_READ reads the header of an element file.
%
%  Discussion:
%
%    The header is a single line, of the form:
%
%      element_num  element_order  att_num
%
%    ELEMENT_NUM is the number of elements;
%    ELEMENT_ORDER is the element order (number of nodes per element);
%    ATT_NUM is the number of attributes;
%  
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jonathan Shewchuk,
%    Triangle: Engineering a 2D Quality Mesh Generator and
%    Delaunay Triangulator,
%    in Applied Computational Geometry: Towards Geometric Engineering,
%    edited by Ming Lin, Dinesh Manocha,
%    Lecture Notes in Computer Science, Volume 1148,
%    Springer, 1996,
%    ISBN: 354061785X,
%    LC: QA448.D38.A635.
%
%  Parameters:
%
%    Input, string ELEMENT_FILENAME, the name of the file.
%
%    Output, integer ELEMENT_ORDER, the element order.
%
%    Output, integer ELEMENT_NUM, the number of elements.
%
  input = fopen ( element_filename, 'rt' );
  text_num = 0;

  while ( 1 )

    text = fgetl ( input );

    if ( text == -1 )
      break
    end

    text_num = text_num + 1;

    if ( text(1) == '#' )
      continue
    end

    if ( s_len_trim ( text ) <= 0 )
      continue
    end

    [ a, count ] = sscanf ( text, '%d', 3 );

    if ( count ~= 3 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ELEMENT_HEADER_READ - Fatal error!\n' );
      fprintf ( 1, '  Could not read 3 integers from element header line.\n' );
      fprintf ( 1, '  File is "%s".\n', element_filename );
      fprintf ( 1, '  Line number = %d.\n', text_num );
      error ( 'ELEMENT_HEADER_READ - Fatal error!' );
    end

    element_num = a(1);
    element_order = a(2);
    att_num = a(3);

    break

  end

  fclose ( input );

  return
end
function i4mat_transpose_print ( m, n, a, title )

%*****************************************************************************80
%
%% I4MAT_TRANSPOSE_PRINT prints an I4MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), an M by N matrix to be printed.
%
%    Input, string TITLE, a title.
%
  i4mat_transpose_print_some ( m, n, a, 1, 1, m, n, title );

  return
end
function i4mat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% I4MAT_TRANSPOSE_PRINT_SOME prints some of an I4MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, a title.
%
  incx = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  for i2lo = max ( ilo, 1 ) : incx : min ( ihi, m )

    i2hi = i2lo + incx - 1;
    i2hi = min ( i2hi, m );
    i2hi = min ( i2hi, ihi );

    inc = i2hi + 1 - i2lo;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row: ' );
    for i = i2lo : i2hi
      fprintf ( 1, '%7d  ', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col\n' );
    fprintf ( 1, '\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d: ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%7d  ', a(i,j) );
      end
      fprintf ( 1, '\n' );

    end

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
      fprintf ( output_unit, '  %12d', round ( table(i,j) ) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function i4vec_print ( n, a, title )

%*****************************************************************************80
%
%% I4VEC_PRINT prints an I4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, integer A(N), the vector to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '%6d: %6d\n', i, a(i) );
  end

  return
end
function i4vec_print_some ( n, a, i_lo, i_hi, title )

%*****************************************************************************80
%
%% I4VEC_PRINT_SOME prints "some" of an I4VEC.
%
%  Discussion:
%
%    An I4VEC is a vector of I4 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, integer A(N), the vector to be printed.
%
%    Input, integer I_LO, I_HI, the first and last indices to print.
%    The routine expects 1 <= I_LO <= I_HI <= N.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for i = max ( 1, i_lo ) : min ( n, i_hi )
    fprintf ( 1, '  %8d: %12d\n', i, a(i) );
  end

  return
end
function element_node = mesh_base_one ( node_num, element_order, ...
  element_num, element_node )

%*****************************************************************************80
%
%% MESH_BASE_ONE ensures that the element definition is one-based.
%
%  Discussion:
%
%    The ELEMENT_NODE array contains nodes indices that form elements.
%    The convention for node indexing might start at 0 or at 1.
%    Since a MATLAB program will naturally assume a 1-based indexing, it is
%    necessary to check a given element definition and, if it is actually
%    0-based, to convert it.
%
%    This function attempts to detect 0-based node indexing and correct it.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input/output, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), the element
%    definitions.
%
  node_min = min ( min ( element_node(1:element_order,1:element_num) ) );
  node_max = max ( max ( element_node(1:element_order,1:element_num) ) );

  if ( node_min == 0 && node_max == node_num - 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_BASE_ONE:\n' );
    fprintf ( 1, '  The element indexing appears to be 0-based!\n' );
    fprintf ( 1, '  This will be converted to 1-based.\n' );
    element_node(1:element_order,1:element_num) = ...
      element_node(1:element_order,1:element_num) - 1;
  elseif ( node_min == 1 && node_max == node_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_BASE_ONE:\n' );
    fprintf ( 1, '  The element indexing appears to be 1-based!\n' );
    fprintf ( 1, '  No conversion is necessary.\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_BASE_ONE - Warning!\n' );
    fprintf ( 1, '  The element indexing is not of a recognized type.\n' );
  end

  return
end
function [ node_xy, node_marker ] = node_data_read ( node_filename, ...
  node_num )

%*****************************************************************************80
%
%% NODE_DATA_READ reads the data of a node file.
%
%  Discussion:
%
%   ...
%  
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jonathan Shewchuk,
%    Triangle: Engineering a 2D Quality Mesh Generator and
%    Delaunay Triangulator,
%    in Applied Computational Geometry: Towards Geometric Engineering,
%    edited by Ming Lin, Dinesh Manocha,
%    Lecture Notes in Computer Science, Volume 1148,
%    Springer, 1996,
%    ISBN: 354061785X,
%    LC: QA448.D38.A635.
%
%  Parameters:
%
%    Input, string NODE_FILENAME, the name of the file.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Output, real NODE_COORD(2,NODE_NUM), ...
%
%    Output, integer NODE_MARKER(NODE_NUM), ...
%
  node_xy = zeros ( 2, node_num );
  node_marker = zeros ( node_num, 1 );

  input = fopen ( node_filename, 'rt' );
  text_num = 0;
  read_header = 0;
  node = 0;

  while ( 1 )

    text = fgetl ( input );

    if ( text == -1 )
      break
    end

    text_num = text_num + 1;

    if ( text(1) == '#' )
      continue
    end

    if ( s_len_trim ( text ) <= 0 )
      continue
    end
%
%  Read (but ignore) header line.
%
    if ( ~read_header )

      [ a, count ] = sscanf ( text, '%d', 4 );

      if ( count ~= 4 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'NODE_DATA_READ - Fatal error!\n' );
        fprintf ( 1, '  Could not read 4 integers from node header line.\n' );
        fprintf ( 1, '  File is "%s".\n', node_filename );
        fprintf ( 1, '  Line number = %d.\n', text_num );
        error ( 'NODE_DATA_READ - Fatal error!' );
      end

      read_header = 1;
%
%  Read data for next node.
%
    else

      [ a, count ] = sscanf ( text, '%d  %f  %f %d', 4 );

      if ( count ~= 4 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'NODE_DATA_READ - Fatal error!\n' );
        fprintf ( 1, '  Could not read 4 values for node %d.\n',  node + 1 );
        fprintf ( 1, '  File is "%s".\n', node_filename );
        fprintf ( 1, '  Line number = %d.\n', text_num );
        error ( 'NODE_DATA_READ - Fatal error!' );
      end

      node = node + 1;
      node_xy(1,node) = a(2);
      node_xy(2,node) = a(3);
      node_marker(node) = a(4);

      if ( node_num <= node )
        break
      end

    end

  end

  fclose ( input );

  return
end
function [ node_num, marker ] = node_header_read ( node_filename )

%*****************************************************************************80
%
%% NODE_HEADER_READ reads the header of a node file.
%
%  Discussion:
%
%    The header is a single line, of the form:
%
%      node_num  dim  att_num  marker
%
%    NODE_NUM is the number of nodes;
%    DIM is the spatial dimension, which should be 2;
%    ATT_NUM is the number of attributes;
%    MARKER is 1 to indicate that the last column of the node data
%    is used to identify boundary vertices and constrained vertices.
%  
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jonathan Shewchuk,
%    Triangle: Engineering a 2D Quality Mesh Generator and
%    Delaunay Triangulator,
%    in Applied Computational Geometry: Towards Geometric Engineering,
%    edited by Ming Lin, Dinesh Manocha,
%    Lecture Notes in Computer Science, Volume 1148,
%    Springer, 1996,
%    ISBN: 354061785X,
%    LC: QA448.D38.A635.
%
%  Parameters:
%
%    Input, string NODE_FILENAME, the name of the file.
%
%    Output, integer NODE_NUM, the number of nodes.
%
%    Output, integer MARKER, is 1 if boundary nodes are marked by the
%    value 1.
%
  input = fopen ( node_filename, 'rt' );
  text_num = 0;

  while ( 1 )

    text = fgetl ( input );

    if ( text == -1 )
      break
    end

    text_num = text_num + 1;

    if ( text(1) == '#' )
      continue
    end

    if ( s_len_trim ( text ) <= 0 )
      continue
    end

    [ a, count ] = sscanf ( text, '%d', 4 );

    if ( count ~= 4 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'NODE_HEADER_READ - Fatal error!\n' );
      fprintf ( 1, '  Could not read 4 integers from node header line.\n' );
      fprintf ( 1, '  File is "%s".\n', node_filename );
      fprintf ( 1, '  Line number = %d.\n', text_num );
      error ( 'NODE_HEADER_READ - Fatal error!' );
    end

    node_num = a(1);
    dim = a(2);
    att_num = a(3);
    marker = a(4);

    break

  end

  fclose ( input );

  return
end
function r8mat_transpose_print ( m, n, a, title )

%*****************************************************************************80
%
%% R8MAT_TRANSPOSE_PRINT prints an R8MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), an M by N matrix to be printed.
%
%    Input, string TITLE, a title.
%
  r8mat_transpose_print_some ( m, n, a, 1, 1, m, n, title );

  return
end
function r8mat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8MAT_TRANSPOSE_PRINT_SOME prints some of an R8MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, a title.
%
  incx = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  for i2lo = max ( ilo, 1 ) : incx : min ( ihi, m )

    i2hi = i2lo + incx - 1;
    i2hi = min ( i2hi, m );
    i2hi = min ( i2hi, ihi );

    inc = i2hi + 1 - i2lo;
    
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row: ' );
    for i = i2lo : i2hi
      fprintf ( 1, '%7d       ', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d:', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%12f', a(i,j) );
      end
      fprintf ( 1, '\n' );

    end

  end

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
%  For smaller data files, and less precision, try:
%
%     fprintf ( output_unit, '  %14.6e', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16e', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function s2 = s_escape_tex ( s1 )

%*****************************************************************************80
%
%% S_ESCAPE_TEX de-escapes TeX escape sequences.
%
%  Discussion:
%
%    In particular, every occurrence of the characters '\', '_',
%    '^', '{' and '}' will be replaced by '\\', '\_', '\^',
%    '\{' and '\}'.  A TeX interpreter, on seeing these character
%    strings, is then likely to return the original characters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, the string to be de-escaped.
%
%    Output, string S2, a copy of the string, modified to avoid TeX escapes.
%
  s1_length = length ( s1 );

  s1_pos = 0;
  s2_pos = 0;
  s2 = [];

  while ( s1_pos < s1_length )

    s1_pos = s1_pos + 1;

    if ( s1(s1_pos) == '\' || ...
         s1(s1_pos) == '_' || ...
         s1(s1_pos) == '^' || ...
         s1(s1_pos) == '{' || ...
         s1(s1_pos) == '}' )
      s2_pos = s2_pos + 1;
      s2 = strcat ( s2, '\' );
    end

    s2_pos = s2_pos + 1;
    s2 = strcat ( s2, s1(s1_pos) );

  end

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
function triangulation_display_matlab ( prefix, node_num, node_xy, ...
  element_order, element_num, element_node, node_show, element_show )

%*****************************************************************************80
%
%% TRIANGULATION_DISPLAY_MATLAB displays a triangulation.
%
%  Discussion:
%
%    The triangulation is most usually a Delaunay triangulation,
%    but this is not necessary.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string PREFIX, the file name prefix that identifies the data.
%
%    Input, integer NODE_NUM, the number of points.
%
%    Input, real NODE_XY(2,NODE_NUM), the nodes.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), lists, 
%    for each element, the indices of the nodes that form the vertices 
%    of the element.
%
%    Input, logical NODE_SHOW:
%    0, do not show the nodes.
%    1, show the nodes.
%    2, show the nodes, and label them.
%
%    Input, logical ELEMENT_SHOW, 
%    0, do not show the elements.
%    1, show the elements.
%    2, show the elements, and color them.
%    3, show the elements, and color them, and label them.
%

%
%  Clear the graphics screen.
%
  clf;
%
%  Get the scale.
%
  xy_min(1) = min ( node_xy(1,:) );
  xy_max(1) = max ( node_xy(1,:) );

  xy_min(2) = min ( node_xy(2,:) );
  xy_max(2) = max ( node_xy(2,:) );

  xy_range(1:2) = xy_max(1:2) - xy_min(1:2);

  margin = 0.025 * max ( xy_range(1), xy_range(2) );

  x_min = xy_min(1) - margin;
  x_max = xy_max(1) + margin;
  y_min = xy_min(2) - margin;
  y_max = xy_max(2) + margin;
%
%  Draw the element faces.
%
  if ( 2 <= element_show )

    face_color = 'g';

    for element = 1 : element_num
      p = element_node(1:3,element);
      patch ( node_xy(1,p), node_xy(2,p), face_color );
    end

  end
%
%  Draw the element lines.
%
  if ( 1 <= element_show )

    line_color = 'r';

    for element = 1 : element_num
      p = [ element_node(1:3,element)', element_node(1,element) ];
      line ( 'XData', node_xy(1,p), 'YData', node_xy(2,p), 'Color', line_color );
    end

  end
%
%  Label the elements
%
  if ( 3 <= element_show )

    for element = 1 : element_num

      ave_x = 0.0;
      ave_y = 0.0;

      for i = 1 : element_order
        node = element_node(i,element);
        ave_x = ave_x + node_xy(1,node);
        ave_y = ave_y + node_xy(2,node);
      end

      ave_x = ave_x / element_order;
      ave_y = ave_y / element_order;

      text ( ave_x, ave_y, num2str ( element ) );

    end

  end
%
%  Draw the nodes.
%
  hold on

  if ( 1 <= node_show )
    plot ( node_xy(1,:), node_xy(2,:), 'o', 'markersize', 4, ...
      'markerfacecolor', 'black' );
  end
%
%  Label the nodes.
%
% hold on

  if ( 2 <= node_show )
    abit = margin;
    for j = 1 : node_num
      text ( node_xy(1,j) + abit, node_xy(2,j) + abit, num2str(j) );
    end
  end

  xlabel ( '--X axis--' )
  ylabel ( '--Y axis--' )
%
%  The TITLE function will interpret underscores in the title.
%  We need to unescape such escape sequences!
%
  title_string = s_escape_tex ( prefix );
  title ( title_string )

  axis ( [ x_min, x_max, y_min, y_max ] );
  axis equal
% axis tight

  hold off

  return
end

