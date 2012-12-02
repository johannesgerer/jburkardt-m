function triangulation_histogram ( prefix, data_filename )

%*****************************************************************************80
%
%% MAIN is the main program for TRIANGULATION_HISTOGRAM.
%
%  Discussion:
%
%    TRIANGULATION_HISTOGRAM reads the definition of a triangulation and
%    a list of N points, most of which are presumed to lie somewhere within
%    the triangulation.
%
%    The program determines
%    * Ai, the area of the Ith triangle;
%    * Atotal, the area of the triangulation;
%    * Ni, the number of data points inside the Ith triangle;
%    * Ntotal, the number of data points inside the triangulation.
%
%    It then reports the values of Ai/Atotal and Ni/Ntotal.
%
%    This allows an estimation of whether the set of data points represents
%    a uniform sampling of the triangulation.
%
%  Usage:
%
%    triangulation_histogram ( 'prefix', 'data_filename' )
%
%    where
%
%    * prefix is the common filename prefix for a triangulation:
%      'prefix_nodes.txt' contains the node coordinates;
%      'prefix_elements.txt' contains lists of node indices forming elements;
%
%    * data_filename is the name of the file containing the sample points,
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 October 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_HISTOGRAM:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Compute a histogram for datapoints in a triangulation.\n' );
%
%  The first command line argument is the common filename  prefix.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_HISTOGRAM:\n' );

    prefix = input ( ...
      'Please enter the filename prefix:' );

  end
%
%  The second command line argument is the data file name.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_HISTOGRAM:\n' );

    data_filename = input ( ...
      'Please enter the data filename:' );

  end
%
%  Create the filenames.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
%
%  Read the node data.
%
  [ dim_num, node_num ] = r8mat_header_read ( node_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".', node_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  Number of points NODE_NUM = %d\n', node_num );

  if ( dim_num ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_HISTOGRAM - Fatal error!\n' );
    fprintf ( 1, '  Dataset must have spatial dimension 2.\n' );
    error ( 'TRIANGULATION_HISTOGRAM - Fatal error!' );
  end

  node_xy = r8mat_data_read ( node_filename, dim_num, node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', node_filename );

  r8mat_transpose_print_some ( dim_num, node_num, node_xy, 1, 1, dim_num, 5, ...
    '  First 5 nodes:' );
%
%  Read the triangulation data.
%
  [ element_order, element_num ] = i4mat_header_read ( ...
    element_filename );

  if ( element_order ~= 3 && element_order ~= 6 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_HISTOGRAM - Fatal error!\n' );
    fprintf ( 1, '  Data is not for a 3-node or 6-node triangulation.\n' );
    error ( 'TRIANGULATION_HISTOGRAM - Fatal error!' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', element_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle order = %d\n', element_order );
  fprintf ( 1, '  Number of triangles ELEMENT_NUM  = %d\n', ...
    element_num );

  element_node = i4mat_data_read ( element_filename, ...
    element_order, element_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', element_filename );

  i4mat_transpose_print_some ( element_order, element_num, ...
    element_node, 1, 1, element_order, 10, ...
    '  First 10 elements:' );
%
%  Detect and correct 0-based indexing.
%
  element_node = mesh_base_one ( node_num, element_order, element_num, ...
    element_node );
%
%  Read the data point data.
%
  [ dim_num, data_num ] = r8mat_header_read ( data_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".', data_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  Number of points DATA_NUM = %d\n', data_num );

  if ( dim_num ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_HISTOGRAM - Fatal error!\n' );
    fprintf ( 1, '  Dataset must have spatial dimension 2.\n' );
    error ( 'TRIANGULATION_HISTOGRAM - Fatal error!' );
  end

  data_xy = r8mat_data_read ( data_filename, dim_num, data_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', data_filename );

  r8mat_transpose_print_some ( dim_num, data_num, data_xy, 1, 1, dim_num, 5, ...
    '  First 5 data points:' );
%
%  Compute the triangle areas.
%
  [ element_area, triangulation_area ] = triangulation_areas ( node_num, ...
    node_xy, element_order, element_num, element_node );
%
%  Count the hits.
%
  [ element_hit, triangulation_hit ] = triangulation_hits ( node_num, ...
    node_xy, element_order, element_num, element_node, data_num, data_xy );
%
%  Print the histogram.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_HISTOGRAM:\n' );
  fprintf ( 1, '  Histogram report:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node data from         "%s".\n', node_filename );
  fprintf ( 1, '  Element data from      "%s".\n', element_filename );
  fprintf ( 1, '  Sample point data from "%s".\n', data_filename );
  fprintf ( 1, '  Number of sample points = %d\n', data_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle        Area          Hits  Area Ratio       Hit Ratio\n' );
  fprintf ( 1, '\n' );
  for element = 1 : element_num
    fprintf ( 1, '  %8d  %14f  %8d  %14f  %14f\n', ...
      element, element_area(element), element_hit(element), ...
      element_area(element) / triangulation_area, ...
      element_hit(element) / triangulation_hit );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Total  %14f  %8d  %14f  %14f\n', ...
    triangulation_area, triangulation_hit, 1.0, 1.0 );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_HISTOGRAM:\n' );
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
function area = triangle_area_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_AREA_2D computes the area of a triangle in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real AREA, the absolute area of the triangle.
%
  area = 0.5 * abs ( ...
      t(1,1) * ( t(2,2) - t(2,3) ) ...
    + t(1,2) * ( t(2,3) - t(2,1) ) ...
    + t(1,3) * ( t(2,1) - t(2,2) ) );

  return
end
function [ triangle_area, triangulation_area ] = triangulation_areas ( ...
  node_num, node_xy, triangle_order, triangle_num, triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_AREAS computes triangle and triangulation areas.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes in the
%    triangulation.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Input, integer TRIANGLE_ORDER, the order of triangles in
%    the triangulation.
%
%    Input, integer TRIANGLE_NUM, the number of triangles in
%    the triangulation.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM),
%    the nodes making up each triangle.
%
%    Output, real TRIANGLE_AREA(TRIANGLE_NUM), the area of
%    the triangles.
%
%    Output, real TRIANGULATION_AREA, the area of
%    the triangulation.
%
  triangulation_area = 0.0;

  triangle_area = zeros ( triangle_num, 1 );
  
  for triangle = 1 : triangle_num

    triangle_xy(1:2,1:3) = node_xy(1:2,triangle_node(1:3,triangle));

    triangle_area(triangle) = triangle_area_2d ( triangle_xy );

    triangulation_area = triangulation_area + triangle_area(triangle);

  end

  return
end
function [ triangle_hit, triangulation_hit ] = triangulation_hits ( ...
  node_num, node_xy, triangle_order, triangle_num, triangle_node, ...
  data_num, data_xy, triangle_hit, triangulation_hit )

%*****************************************************************************80
%
%% TRIANGULATION_HITS counts "data hits" in triangles and a triangulation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes in the
%    triangulation.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Input, integer TRIANGLE_ORDER, the order of triangles in
%    the triangulation.
%
%    Input, integer TRIANGLE_NUM, the number of triangles in
%    the triangulation.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM),
%    the nodes making up each triangle.
%
%    Input, integer DATA_NUM, the number of data points.
%
%    Input, real DATA_XY(2,DATA_NUM), the data points.
%
%    Output, integer TRIANGLE_HIT(TRIANGLE_NUM), the number of
%    hits in each triangle.
%
%    Output, integer TRIANGULATION_HIT, the number of hits in
%    the triangulation.
%
  triangulation_hit = 0;

  for triangle = 1 : triangle_num

    triangle_hit(triangle) = 0;

    for d = 1 : data_num

      inside = 1;

      for j = 1 : 3

        k = mod ( j, 3 ) + 1;

        nj = triangle_node(j,triangle);
        nk = triangle_node(k,triangle);

        if ( 0.0 < ( data_xy(1,d) - node_xy(1,nj) ) ...
                 * ( node_xy(2,nk) - node_xy(2,nj) ) ...
                 - ( data_xy(2,d) - node_xy(2,nj) ) ...
                 * ( node_xy(1,nk) - node_xy(1,nj) ) )
          inside = 0;
          break
        end

      end

      if ( inside )
        triangle_hit(triangle) = triangle_hit(triangle) + 1;
      end

    end

    triangulation_hit = triangulation_hit + triangle_hit(triangle);

  end

  return
end
