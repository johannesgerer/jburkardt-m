function quad = triangulation_quad ( prefix )

%*****************************************************************************80
%
%% MAIN is the main program for TRIANGULATION_QUAD.
%
%  Discussion:
%
%    TRIANGULATION_QUAD estimates the integral of a scalar or vector function
%    over a triangulated region, using only the values of the function at 
%    the nodes of the triangulation.
%
%  Usage:
%
%    quad = triangulation_quad ( 'prefix' )
%
%    where
%
%    * 'prefix'_nodes.txt contains the node coordinates;
%    * 'prefix'_elements.txt contains the element definitions.
%    * 'prefix'_values.txt contains the function component values at each node.
%
%    quad will be a scalar or vector of numbers, containing the estimates
%    for the integral of each component of the function over the triangulation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string PREFIX, the filename prefix.
%
%    Output, real QUAD(*), the estimate for the integrals of each of the
%    components of the function over the triangulation.
%
%  Local parameters:
%
%
%    Local, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), 
%    lists the nodes that make up each triangle.
%
%    Local, integer ELEMENT_NUM, the number of triangles.
%
%    Local, integer ELEMENT_ORDER, the order of the triangles, 
%    either 3 or 6.
%
%    Local, integer NODE_DIM, the spatial dimension.
%
%    Local, integer NODE_NUM, the number of nodes.
%
%    Local, real NODE_XY(NODE_DIM,NODE_NUM), the nodes of the triangulation.
%
%    Local, real VALUE(VALUE_DIM,VALUE_NUM), the VALUE_DIM components of a
%    vector function evaluated at each of the NODE_NUM nodes.
%
%    Local, integer VALUE_DIM, the number of components of the function.
%
%    Local, integer VALUE_NUM, the number of points at which function values
%    were supplied.  This must be equal to NODE_NUM.
%
  debug = 0;

  if ( debug )
    fprintf ( 1, '\n' );
    timestamp ( );

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_QUAD:\n' );
    fprintf ( 1, '  MATLAB version:\n' );
    fprintf ( 1, '  Estimate an integral over a triangulated region.\n' );
  end
%
%  The command line argument is the common filename prefix.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_QUAD:\n' );

    prefix = input ( ...
      'Please enter the filename prefix:' );

  end
%
%  Create the filenames.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
  value_filename = strcat ( prefix, '_values.txt' );
%
%  Read the node data.
%
  [ node_dim, node_num ] = r8mat_header_read ( node_filename );

  if ( debug )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Read the header of "%s".', node_filename );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Spatial dimension NODE_DIM = %d\n', node_dim );
    fprintf ( 1, '  Number of points NODE_NUM = %d\n', node_num );
  end

  if ( node_dim ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_QUAD - Fatal error!\n' );
    fprintf ( 1, '  Dataset must have spatial dimension 2.\n' );
    error ( 'TRIANGULATION_QUAD - Fatal error!' );
  end

  node_xy = r8mat_data_read ( node_filename, node_dim, node_num );

  if ( debug )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Read the data in "%s".\n', node_filename );

    r8mat_transpose_print_some ( node_dim, node_num, node_xy, 1, 1, node_dim, ...
      5, '  First 5 nodes:' );
  end
%
%  Read the element data.
%
  [ element_order, element_num ] = i4mat_header_read ( element_filename );

  if ( element_order ~= 3 && element_order ~= 6 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_QUAD - Fatal error!\n' );
    fprintf ( 1, '  Data is not for a 3-node or 6-node triangulation.\n' );
    error ( 'TRIANGULATION_QUAD - Fatal error!' );
  end

  if ( debug )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Read the header of "%s".\n', element_filename );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Element order = %d\n', element_order );
    fprintf ( 1, '  Number of elements  = %d\n', ...
      element_num );
  end

  element_node = i4mat_data_read ( element_filename, element_order, ...
    element_num );

  if ( debug )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Read the data in "%s".\n', element_filename );

    i4mat_transpose_print_some ( element_order, element_num, ...
      element_node, 1, 1, element_order, 5, ...
      '  First 5 elements:' );
  end
%
%  Read the value data.
%
  [ value_dim, value_num ] = r8mat_header_read ( value_filename );

  if ( debug )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Read the header of "%s".', value_filename );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Value dimension VALUE_DIM  = %d\n', value_dim );
    fprintf ( 1, '  Number of values VALUE_NUM = %d\n', value_num );
  end

  if ( value_num ~= node_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_QUAD - Fatal error!\n' );
    fprintf ( 1, '  Number of values must be same as number of nodes.\n' );
    error ( 'TRIANGULATION_QUAD - Fatal error!' );
  end

  value = r8mat_data_read ( value_filename, value_dim, value_num );

  if ( debug )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Read the data in "%s".\n', value_filename );

    r8mat_transpose_print_some ( value_dim, value_num, value, 1, 1, value_dim, ...
      5, '  First 5 values:' );
  end
%
%  Detect and correct 0-based indexing.
%
  element_node = mesh_base_one ( node_num, element_order, element_num, ...
    element_node );
%
%  Compute the triangle areas.
%
  area(1:element_num,1) = 0.5 * abs ( ...
      node_xy(1,element_node(1,1:element_num)) ...
    .* ( node_xy(2,element_node(2,1:element_num)) - node_xy(2,element_node(3,1:element_num)) ) ...
    + node_xy(1,element_node(2,1:element_num)) ...
    .* ( node_xy(2,element_node(3,1:element_num)) - node_xy(2,element_node(1,1:element_num)) ) ...
    + node_xy(1,element_node(3,1:element_num)) ...
    .* ( node_xy(2,element_node(1,1:element_num)) - node_xy(2,element_node(2,1:element_num)) ) );
%
%  Compute the integral estimate.
%
  quad(1:value_dim,1) = ...
    ( value(1:value_dim,element_node(1,1:element_num)) ...
    + value(1:value_dim,element_node(2,1:element_num)) ...
    + value(1:value_dim,element_node(3,1:element_num)) ) * area(1:element_num,1) / 3.0;
%
%  Terminate.
%
  if ( debug )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_QUAD:\n' );
    fprintf ( 1, '  Normal end of execution.\n' );

    fprintf ( 1, '\n' );
    timestamp ( );
  end

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
%    Input, string TITLE, an optional title.
%
  incx = 10;

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

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
%    Input/output, integer ELEMENT_NODE(ELEMENT_ORDE,ELEMENT_NUM), the element
%    definitions.
%
  debug = 0;

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
    if ( debug )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MESH_BASE_ONE:\n' );
      fprintf ( 1, '  The element indexing appears to be 1-based!\n' );
      fprintf ( 1, '  No conversion is necessary.\n' );
    end
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_BASE_ONE - Warning!\n' );
    fprintf ( 1, '  The element indexing is not of a recognized type.\n' );
    fprintf ( 1, '  NODE_MIN = %d\n', node_min );
    fprintf ( 1, '  NODE_MAX = %d\n', node_max );
    fprintf ( 1, '  NODE_NUM = %d\n', node_num );
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
%    Input, string TITLE, an optional title.
%
  incx = 5;

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

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
