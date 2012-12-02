function triangulation_display ( prefix, node_show, element_show, ...
  neighbor_show )

%*****************************************************************************80
%
%% TRIANGULATION_DISPLAY displays a triangulation.
%
%  Discussion:
%
%    TRIANGULATION_DISPLAY displays a triangulated set of nodes on
%    the MATLAB graphics screen.
%
%  Usage:
%
%    triangulation_display ( 'prefix', node_show, element_show, (neighbor_show) )
%
%    where:
%
%    'prefix' is the common prefix for the node and element files:
%
%    * prefix_nodes.txt,             the node coordinates.
%    * prefix_elements.txt,          the nodes that make up each element.
%    * prefix_element_neighbors.txt, (optional), the neighbors of each element.
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
%    'neighbor_show' indicates the element neighbor visibility,
%    if the element neighbor file exists:
%
%    0: do not show the element neighbor labels;
%    1:        show the element neighbor labels.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_DISPLAY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read a node dataset of NODE_NUM points in 2 dimensions.\n' );
  fprintf ( 1, '  Read an associated triangulation dataset of ELEMENT_NUM\n' );
  fprintf ( 1, '  elements using 3, 4 or 6 nodes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Display an image of the data on the MATLAB graphics screen.\n' );
%
%  First argument is the file prefix.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_DISPLAY:\n' );
    prefix = input ( '  Enter the file prefix:  ' );
  end
%
%  Create the file names.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
  element_neighbor_filename = strcat ( prefix, '_element_neighbors.txt' );
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
%  Fourth argument is neighbor visibility.
%
  if ( nargin < 4 && file_exist ( element_neighbor_filename ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Options for element neighbor visibility:\n' );
    fprintf ( 1, '  0: do not show the element neighbor labels;\n' );
    fprintf ( 1, '  1:        show the element neighbor labels;\n' );
    neighbor_show = input ( '  Enter the element neighbor visibility option:  ' );
  end
%
%  Read the node data.
%
  [ dim_num, node_num ] = r8mat_header_read ( node_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', node_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  Number of nodes NODE_NUM  = %d\n', node_num );

  node_xy = r8mat_data_read ( node_filename, dim_num, node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', node_filename );

  r8mat_transpose_print_some ( dim_num, node_num, node_xy, 1, 1, 2, 5, ...
    '  Initial portion of NODE_XY:' );
%
%  Read the element data.
%
  [ element_order, element_num ] = i4mat_header_read ( element_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', element_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Element order      = %d\n', element_order );
  fprintf ( 1, '  Number of elements = %d\n', element_num );

  element_node = i4mat_data_read ( element_filename, ...
    element_order, element_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', element_filename );

  i4mat_transpose_print_some ( element_order, element_num, element_node, ...
    1, 1, element_order, 5, '  Initial portion of ELEMENT_NODE:' );
%
%  If the neighbor file exists, read the neighbor data.
%
  if ( file_exist ( element_neighbor_filename ) && 0 < neighbor_show )

    [ three, element_num ] = i4mat_header_read ( element_neighbor_filename );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Read the header of "%s".\n', element_neighbor_filename );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Element order      = %d\n', element_order );
    fprintf ( 1, '  Number of elements = %d\n', element_num );

    element_neighbor = i4mat_data_read ( element_neighbor_filename, ...
      3, element_num );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Read the data in "%s".\n', element_neighbor_filename );

    i4mat_transpose_print_some ( 3, element_num, element_neighbor, ...
      1, 1, element_order, 5, '  Initial portion of ELEMENT_NEIGHBOR:' );

  else

    neighbor_show = 0;
    element_neighbor = [];

  end
%
%  Detect and correct zero-based node indexing.
%
  element_node = mesh_base_one ( node_num, element_order, element_num, ...
    element_node );
%
%  Display a plot.
%
  title_string = s_escape_tex ( prefix );

  triangulation_display_matlab ( title_string, node_num, node_xy, element_order, ...
    element_num, element_node, element_neighbor, node_show, element_show, ...
    neighbor_show );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_DISPLAY\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

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
function value = file_exist ( file_name )

%*****************************************************************************80
%
%% FILE_EXIST reports whether a file exists.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character FILE_NAME, the name of the file.
%
%    Output, logical FILE_EXIST, is TRUE if the file exists.
%
  fid = fopen ( file_name );

  if ( fid == -1 ) 
    value = 0;
  else
    fclose ( fid );
    value = 1;
  end

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
function value = i4_modp ( i, j )

%*****************************************************************************80
%
%% I4_MODP returns the nonnegative remainder of I4 division.
%
%  Discussion:
%
%    If
%      NREM = I4_MODP ( I, J )
%      NMULT = ( I - NREM ) / J
%    then
%      I = J * NMULT + NREM
%    where NREM is always nonnegative.
%
%    The MOD function computes a result with the same sign as the
%    quantity being divided.  Thus, suppose you had an angle A,
%    and you wanted to ensure that it was between 0 and 360.
%    Then mod(A,360) would do, if A was positive, but if A
%    was negative, your result would be between -360 and 0.
%
%    On the other hand, I4_MODP(A,360) is between 0 and 360, always.
%
%  Example:
%
%        I     J     MOD  I4_MODP    Factorization
%
%      107    50       7       7    107 =  2 *  50 + 7
%      107   -50       7       7    107 = -2 * -50 + 7
%     -107    50      -7      43   -107 = -3 *  50 + 43
%     -107   -50      -7      43   -107 =  3 * -50 + 43
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the number to be divided.
%
%    Input, integer J, the number that divides I.
%
%    Output, integer VALUE, the nonnegative remainder when I is
%    divided by J.
%
  if ( j == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_MODP - Fatal error!\n' );
    fprintf ( 1, '  Illegal divisor J = %d\n', j );
    error ( 'I4_MODP - Fatal error!' );
  end

  value = mod ( i, j );

  if ( value < 0 )
    value = value + abs ( j );
  end

  return
end
function value = i4_wrap ( ival, ilo, ihi )

%*****************************************************************************80
%
%% I4_WRAP forces an integer to lie between given limits by wrapping.
%
%  Example:
%
%    ILO = 4, IHI = 8
%
%    I   Value
%
%    -2     8
%    -1     4
%     0     5
%     1     6
%     2     7
%     3     8
%     4     4
%     5     5
%     6     6
%     7     7
%     8     8
%     9     4
%    10     5
%    11     6
%    12     7
%    13     8
%    14     4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer IVAL, an integer value.
%
%    Input, integer ILO, IHI, the desired bounds for the integer value.
%
%    Output, integer I4_WRAP, a "wrapped" version of IVAL.
%
  jlo = min ( ilo, ihi );
  jhi = max ( ilo, ihi );

  wide = jhi - jlo + 1;

  if ( wide == 1 )
    value = jlo;
  else
    value = jlo + i4_modp ( ival - jlo, wide );
  end

  return
end
function table = i4mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% I4MAT_DATA_READ reads data from an I4MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2006
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
  table = zeros ( m, n );
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
%    21 June 2005
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

      fprintf ( 1, '%5d  ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%7d  ', a(i,j) );
      end
      fprintf ( 1, '\n' );

    end

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
%    Thanks to Feifei Xu for pointing out that I was subtracting 1 when I
%    should have been adding 1!  29 November 2012.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 November 2012
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
      element_node(1:element_order,1:element_num) + 1;
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
function table = r8mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% R8MAT_DATA_READ reads data from an R8MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2006
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
  table = zeros ( m, n );
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
%    23 May 2005
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

      fprintf ( 1, '%5d ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%12f', a(i,j) );
      end
      fprintf ( 1, '\n' );

    end

  end

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
function triangulation_display_matlab ( title_string, node_num, node_xy, ...
  element_order, element_num, element_node, element_neighbor, node_show, ...
  element_show, neighbor_show )

%*****************************************************************************80
%
%% TRIANGULATION_DISPLAY_MATLAB displays a triangulation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string TITLE_STRING, a title for the plot.
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
%    for each element, the indices of the points that form the vertices 
%    of the element.
%
%    Input, integer ELEMENT_NEIGHBOR(3,ELEMENT_NUM).  ELEMENT_NEIGHBOR(I,J)
%    is the neighbor adjacent to the size opposite node ELEMENT_NODE(I,J),
%    or -1 if no such neighbor.
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
%    Input, logical NEIGHBOR_SHOW, 
%    0, do not show the element neighbor labels.
%    1, show the element neighbor labels.
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
      line ( 'XData', node_xy(1,p), 'YData', node_xy(2,p), ...
        'Color', line_color, 'LineWidth', 2 );
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
  if ( 2 <= node_show )
    abit = margin;
    for j = 1 : node_num
      text ( node_xy(1,j) + abit, node_xy(2,j) + abit, num2str(j) );
    end
  end
%
%  Label the element neighbors.
%
  if ( 1 <= neighbor_show )
    for j = 1 : element_num
      for i = 1 : 3
        np0 = element_node ( i, j );
        ip1 = i4_wrap ( i + 1, 1, 3 );
        np1 = element_node ( ip1, j );
        ip2 = i4_wrap ( i + 2, 1, 3 );
        np2 = element_node ( ip2, j );
        x = 0.40 * node_xy(1,np1) + 0.40 * node_xy(1,np2) + 0.20 * node_xy(1,np0);
        y = 0.40 * node_xy(2,np1) + 0.40 * node_xy(2,np2) + 0.20 * node_xy(2,np0);
        text ( x, y, num2str ( element_neighbor(i,j) ) );
      end
    end
  end
%
%  Label the plot.
%
  xlabel ( '--X axis--' )
  ylabel ( '--Y axis--' )
  title ( title_string )

  axis ( [ x_min, x_max, y_min, y_max ] );
  axis equal

  hold off

  return
end

