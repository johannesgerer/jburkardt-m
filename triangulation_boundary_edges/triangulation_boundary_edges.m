function triangulation_boundary_edges ( prefix )

%*****************************************************************************80
%
%% MAIN is the main program for TRIANGULATION_BOUNDARY_EDGES.
%
%  Discussion:
%
%    TRIANGULATION_BOUNDARY_EDGES outputs boundary edges of a triangulation.
%
%  Usage:
%
%    triangulation_boundary_edges ( 'prefix' )
%
%    where
%
%    * 'prefix'_nodes.txt contains the node coordinates;
%    * 'prefix'_elements.txt contains the element definitions.
%    * 'prefix'_boundary_edges.txt will contain 0 for interior nodes
%      and 1 for each boundary node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2014
%
%  Author:
%
%    John Burkardt
%
  debug = 0;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_BOUNDARY_EDGES\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Identify triangulation edges on the boundary.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '* Read a dataset of NODE_NUM points in 2 dimensions;\n' );
  fprintf ( 1, '* Read an associated triangulation dataset of  \n' );
  fprintf ( 1, '  triangles using 3 or 6 nodes;\n' );
  fprintf ( 1, '* Determine which edges are on the boundary;\n' );
  fprintf ( 1, '* Write a file: segment_index, node1_index, node2_index.\n' );
%
%  The command line argument is the common filename prefix.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_BOUNDARY_EDGES:\n' );

    prefix = input ( ...
      'Please enter the filename prefix:' );

  end
%
%  Create the filenames.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
  boundary_edge_filename = strcat ( prefix, '_boundary_edges.txt' );
%
%  Read the node coordinates.
%
  [ dim_num, node_num ] = r8mat_header_read ( node_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', node_filename );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  Number of nodes NODE_NUM  = %d\n', node_num );

  node_xy = r8mat_data_read ( node_filename, dim_num, node_num );

  fprintf ( 1, '  Read the data in "%s".\n', node_filename );

  if ( debug )
    r8mat_transpose_print_some ( dim_num, node_num, node_xy, 1, 1, ...
      dim_num, 5, '  Portion of coordinate data from file:' );
  end
%
%  Read the element data.
%
  [ triangle_order, triangle_num ] = i4mat_header_read ( ...
    element_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', ...
    element_filename );
  fprintf ( 1, '  Triangle order = %d\n', triangle_order );
  fprintf ( 1, '  Number of triangles = %d\n', triangle_num );

  triangle_node = i4mat_data_read ( element_filename, ...
    triangle_order, triangle_num );

  fprintf ( 1, '  Read the data in "%s".\n', ...
    element_filename );

  if ( debug )
    i4mat_transpose_print_some ( triangle_order, triangle_num, ...
      triangle_node, 1, 1, triangle_order, 5, ...
      '  Portion of triangle file:' );
  end
%
%  Detect and correct 0-based indexing.
%
  triangle_node = mesh_base_one ( node_num, triangle_order, triangle_num, ...
    triangle_node );
%
%  Determine which edges are boundary edges.
%
  boundary_edge = triangulation_order3_boundary_edge ( triangle_num, triangle_node );
  [ ~, boundary_edge_num ] = size ( boundary_edge );

  if ( debug )
    i4mat_transpose_print ( 2, boundary_edge_num, boundary_edge, ...
      '  Boundary node pairs' );
  end
%
%  EDGE_USABLE will tell us which edges we can use.
%
  edge_usable = ones ( boundary_edge_num, 1 );

  seg = 0;

  output_unit = fopen ( boundary_edge_filename, 'wt' );

  while ( 1 )
%
%  Find a usable edge N1,N2.
%
    found = 0;

    for edge = 1 : boundary_edge_num
      if ( edge_usable(edge) == 1 )
        found = 1;
        edge_usable(edge) = 0;
        n1 = boundary_edge(1,edge);
        n2 = boundary_edge(2,edge);
        break;
      end
    end

    if ( found == 0 )
      break;
    end

    seg = seg + 1;
    fprintf ( output_unit, '  %3d  %3d  %3d\n', seg, n1, n2 );
    n0 = n1;
%
%  Search for a usable edge that connects to previous one.
%
    while ( 1 )

      found = 0;

      for edge = 1 : boundary_edge_num
        if ( edge_usable(edge) == 1 )
          if ( boundary_edge(1,edge) == n2 )
            found = 1;
            n1 = n2;
            n2 = boundary_edge(2,edge);
            edge_usable(edge) = 0;
            break
          end
        end
      end

      if ( found == 0 )
        break
      end

      fprintf ( output_unit, '  %3d  %3d  %3d\n', seg, n1, n2 );

      if ( n2 == n0 )
        break
      end

    end

  end

  fclose ( output_unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the boundary edge file "%s".\n', ...
    boundary_edge_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_BOUNDARY_EDGES\n' );
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
function unique_num = i4col_sorted_unique_count ( m, n, a )

%*****************************************************************************80
%
%% I4COL_SORTED_UNIQUE_COUNT counts unique elements in an I4COL.
%
%  Discussion:
%
%    The columns of the array may be ascending or descending sorted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), a sorted array, containing
%    N columns of data.
%
%    Output, integer UNIQUE_NUM, the number of unique columns.
%
  if ( n <= 0 )
    unique_num = 0;
    return
  end

  unique_num = 1;
  j1 = 1;

  for j2 = 2 : n

    if ( any ( a(1:m,j1) ~= a(1:m,j2) ) )
      unique_num = unique_num + 1;
      j1 = j2;
    end

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
%    31 January 2005
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
%    Input, string TITLE, an optional title.
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
%    Input/output, integer ELEMENT_NODE(ELEMENT_ORDE,ELEMENT_NUM), the element
%    definitions.
%
  debug = 0;

  node_min = min ( min ( element_node(1:element_order,1:element_num) ) );
  node_max = max ( max ( element_node(1:element_order,1:element_num) ) );

  if ( node_min == 0 && node_max == node_num - 1 )

    if ( debug )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MESH_BASE_ONE:\n' );
      fprintf ( 1, '  The element indexing appears to be 0-based!\n' );
      fprintf ( 1, '  This will be converted to 1-based.\n' );
    end

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
function boundary_edge = triangulation_order3_boundary_edge ( triangle_num, ...
  triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_BOUNDARY_EDGE returns the boundary edges.
%
%  Discussion:
%
%    This routine is given a triangulation, an abstract list of triples
%    of nodes.  It is assumed that the nodes in each triangle are listed
%    in a counterclockwise order, although the routine should work 
%    if the nodes are consistently listed in a clockwise order as well.
%
%    It is assumed that each edge of the triangulation is either 
%    * an INTERIOR edge, which is listed twice, once with positive
%      orientation and once with negative orientation, or;
%    * a BOUNDARY edge, which will occur only once.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(3,TRIANGLE_NUM), the nodes that make up the
%    triangles.  These should be listed in counterclockwise order.
%
%    Output, integer BOUNDARY_EDGE(2,BOUNDARY_EDGE_NUM), the pairs of nodes
%    that make up the boundary edges.
%

%
%  Set up the edge array.
%
  edge_num = 3 * triangle_num;
  edge = zeros ( 3, edge_num );

  edge(1:2,               1:  triangle_num) = triangle_node(1:2,1:triangle_num);
  edge(1:2,  triangle_num+1:2*triangle_num) = triangle_node(2:3,1:triangle_num);
  edge(1  ,2*triangle_num+1:3*triangle_num) = triangle_node(3,  1:triangle_num);
  edge(2  ,2*triangle_num+1:3*triangle_num) = triangle_node(1,  1:triangle_num);
%
%  For sorting, we need to reorder some edges.  
%  But for recovery later, we need the original ordering.
%  So add a third item which is 1 or 0 depending on whether we reordered.
%
  edge(3,1:3*triangle_num) = ( edge(1,1:3*triangle_num) < edge(2,1:3*triangle_num) );
%
%  In each column, force the smaller entry to appear first.
%
  e1(1:edge_num) = min ( edge(1:2,1:edge_num) );
  e2(1:edge_num) = max ( edge(1:2,1:edge_num) );

  edge(1,1:edge_num) = e1(1:edge_num);
  edge(2,1:edge_num) = e2(1:edge_num);
%
%  Now ascending sort the column array.
%
  edge = ( sortrows ( edge' ) )';
%
%  The boundary edges are the elements that occur just once in EDGE.
%
  boundary_edge = zeros ( 2, edge_num );

  e = 0;
  be = 0;
  
  while ( 1 )
%
%  Only one edge left.
%
    if ( e == edge_num - 1 )
      e = e + 1;
      be = be + 1;
      if ( edge(3,e) )
        boundary_edge(1:2,be) = edge(1:2,e);
      else
        boundary_edge(1,be) = edge(2,e);
        boundary_edge(2,be) = edge(1,e);
      end
      break
    end
%
%  We can compare edges E+1 and E+2.
%
    if ( edge(1:2,e+1) == edge(1:2,e+2) )
      e = e + 2;
    else
      e = e + 1;
      be = be + 1;
      if ( edge(3,e) )
        boundary_edge(1:2,be) = edge(1:2,e);
      else
        boundary_edge(1,be) = edge(2,e);
        boundary_edge(2,be) = edge(1,e);
      end
    end
    
  end
%
%  Reduce the storage for BOUNDARY_EDGE.
%
  boundary_edge = boundary_edge(1:2,1:be);

  return
end
function boundary_edge = triangulation_order6_boundary_edge ( triangle_num, ...
  triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_BOUNDARY_EDGE returns the boundary edges.
%
%  Discussion:
%
%    This routine is given a triangulation, an abstract list of triples
%    of nodes.  It is assumed that the nodes in each triangle are listed
%    in a counterclockwise order, although the routine should work 
%    if the nodes are consistently listed in a clockwise order as well.
%
%    It is assumed that each edge of the triangulation is either 
%    * an INTERIOR edge, which is listed twice, once with positive
%      orientation and once with negative orientation, or;
%    * a BOUNDARY edge, which will occur only once.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(6,TRIANGLE_NUM), the nodes that make up the
%    triangles.  These should be listed in counterclockwise order.
%
%    Output, integer BOUNDARY_EDGE(3,BOUNDARY_EDGE_NUM), the triples of nodes
%    that make up the boundary edges.
%

%
%  Set up the edge array.
%
  edge(1,               1:  triangle_num) = triangle_node(1,1:triangle_num);
  edge(2,               1:  triangle_num) = triangle_node(4,1:triangle_num);
  edge(3,               1:  triangle_num) = triangle_node(2,1:triangle_num);

  edge(1,  triangle_num+1:2*triangle_num) = triangle_node(2,1:triangle_num);
  edge(2,  triangle_num+1:2*triangle_num) = triangle_node(5,1:triangle_num);
  edge(3,  triangle_num+1:2*triangle_num) = triangle_node(3,1:triangle_num);

  edge(1,2*triangle_num+1:3*triangle_num) = triangle_node(3,1:triangle_num);
  edge(2,2*triangle_num+1:3*triangle_num) = triangle_node(6,1:triangle_num);
  edge(3,2*triangle_num+1:3*triangle_num) = triangle_node(1,1:triangle_num);
%
%  For sorting, we need to reorder some edges.  
%  But for recovery later, we need the original ordering.
%  So add an item which is 1 or 0 depending on whether we reordered.
%
  edge(4,1:3*triangle_num) = ( edge(1,1:3*triangle_num) < edge(3,1:3*triangle_num) );
%
%  In each column, force the smaller end node to appear first.
%
  e1(1:n) = min ( edge(1:2:3,1:n) );
  e2(1:n) = max ( edge(1:2:3,1:n) );

  edge(1,1:n) = e1(1:n);
  edge(3,1:n) = e2(1:n);
%
%  Now ascending sort the column array.
%
  edge = ( sortrows ( edge' ) )';
%
%  The boundary edges are the elements that occur just once in EDGE.
%
  boundary_edge = zeros ( 3, edge_num );

  e = 0;
  be = 0;
  
  while ( 1 )
%
%  Only one edge left.
%
    if ( e == edge_num - 1 )
      e = e + 1;
      be = be + 1;
      if ( edge(4,e) )
        boundary_edge(1:3,be) = edge(1:3,e);
      else
        boundary_edge(1,be) = edge(3,e);
        boundary_edge(2,be) = edge(2,e);
        boundary_edge(3,be) = edge(1,e);
      end
      break
    end
%
%  We can compare edges E+1 and E+2.
%
    if ( edge(1:3,e+1) == edge(1:3,e+2) )
      e = e + 2;
    else
      e = e + 1;
      be = be + 1;
      if ( edge(4,e) )
        boundary_edge(1:3,be) = edge(1:3,e);
      else
        boundary_edge(1,be) = edge(3,e);
        boundary_edge(2,be) = edge(2,e);
        boundary_edge(3,be) = edge(1,e);
      end
    end
    
  end
%
%  Reduce the storage for BOUNDARY_EDGE.
%
  boundary_edge = boundary_edge(1:3,1:be);

  return
end

