function triangulation_q2l ( prefix )

%*****************************************************************************80
%
%% MAIN is the main program for TRIANGULATION_Q2L.
%
%  Discussion:
%
%    TRIANGULATION_Q2L makes a linear triangulation from a quadratic one.
%
%    A quadratic triangulation is assumed to consist of 6-node triangles,
%    as in the following:
%
%    11-12-13-14-15
%     |\    |\    |
%     | \   | \   |
%     6  7  8  9 10
%     |   \ |   \ |
%     |    \|    \|
%     1--2--3--4--5
%
%    This routine rearranges information so as to define the 3-node
%    triangulation:
%
%    11-12-13-14-15
%     |\ |\ |\ |\ |
%     | \| \| \| \|
%     6--7--8--9-10
%     |\ |\ |\ |\ |
%     | \| \| \| \|
%     1--2--3--4--5
%
%  Usage:
%
%    triangulation_q2l ( 'prefix' )
%
%    where 'prefix' is the common filename prefix:
%
%    * 'prefix'_nodes.txt contains the node coordinates (not needed by this program),
%    * 'prefix'_elements.txt contains the element definitions.
%    * 'prefix'_q2l_elements.txt will contain the linearized element definitions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_Q2L\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Read a "quadratic" triangulation and\n' );
  fprintf ( 1, '  write out a "linear" triangulation.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read a triangulation dataset of TRIANGLE_NUM1\n' );
  fprintf ( 1, '  triangles using 6 nodes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Create a 3 node triangulation by breaking\n' );
  fprintf ( 1, '  every 6 node triangle into 4 smaller ones.\n' );
  fprintf ( 1, '  Write the new linear triangulation to a file.\n' );
%
%  Get the number of command line arguments.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_Q2L:\n' );
    prefix = input ( ...
      '  Please enter the common filename prefix.' );

  end
%
%  Create the filenames.
%
  element_filename = strcat ( prefix, '_elements.txt' );
  element_q2l_filename = strcat ( prefix, '_q2l_elements.txt' );
%
%  Read the data.
%
  [ triangle_order1, triangle_num1 ] = i4mat_header_read ( ...
    element_filename );

  if ( triangle_order1 ~= 6 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_Q2L - Fatal error!\n' );
    fprintf ( 1, '  Data is not for a 6-node triangulation.\n' );
    error ( 'TRIANGULATION_Q2L - Fatal error!' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of ""%s".\n', element_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle order = %d\n', triangle_order1 );
  fprintf ( 1, '  Number of triangles TRIANGLE_NUM1  = %d\n', triangle_num1 );

  triangle_node1(1:triangle_order1,1:triangle_num1) = i4mat_data_read ( ...
    element_filename, triangle_order1, triangle_num1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in ""%s".\n', element_filename );

  i4mat_transpose_print_some ( triangle_order1, triangle_num1, triangle_node1, ...
    1, 1, 6, 10, '  6 by 10 portion TRIANGLE_NODE1:' );
%
%  Detect and correct zero-based indexing:
%
  triangle_node1 = mesh_base_one ( triangle_order1, triangle_num1, triangle_node1 );
%
%  Set the number of linear triangles:
%
  triangle_num2 = 4 * triangle_num1;
  triangle_order2 = 3;
%
%  Convert the data.
%
  triangle_node2 = triangulation_order6_to_order3 ( triangle_num1, ...
    triangle_node1 );

  i4mat_transpose_print ( triangle_order2, triangle_num2, ...
    triangle_node2, '  TRIANGLE_NODE2' );
%
%  Write out the node and triangle data for the quadratic mesh
%
  i4mat_write ( element_q2l_filename, triangle_order2, ...
    triangle_num2, triangle_node2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the linearized data to ""%s".\n', element_q2l_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_Q2L\n' );
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
function i4mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% I4MAT_WRITE writes an I4MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 August 2009
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
%    Input, logical HEADER, is TRUE if the header is to be included.
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
function element_node = mesh_base_one ( element_order, element_num, ...
  element_node )

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
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input/output, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), the element
%    definitions.
%
  node_min = min ( min ( element_node(1:element_order,1:element_num) ) );

  if ( node_min == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_BASE_ONE:\n' );
    fprintf ( 1, '  The element indexing appears to be 0-based!\n' );
    fprintf ( 1, '  This will be converted to 1-based.\n' );
    element_node(1:element_order,1:element_num) = ...
      element_node(1:element_order,1:element_num) + 1;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_BASE_ONE:\n' );
    fprintf ( 1, '  The element indexing appears to be 1-based!\n' );
    fprintf ( 1, '  No conversion is necessary.\n' );
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
function triangle_node2 = triangulation_order6_to_order3 ( triangle_num1, ...
  triangle_node1 )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_TO_ORDER3 linearizes a quadratic triangulation.
%
%  Discussion:
%
%    A quadratic triangulation is assumed to consist of 6-node triangles,
%    as in the following:
%
%    11-12-13-14-15
%     |\    |\    |
%     | \   | \   |
%     6  7  8  9 10
%     |   \ |   \ |
%     |    \|    \|
%     1--2--3--4--5
%
%   This routine rearranges information so as to define the 3-node
%   triangulation:
%
%    11-12-13-14-15
%     |\ |\ |\ |\ |
%     | \| \| \| \|
%     6--7--8--9-10
%     |\ |\ |\ |\ |
%     | \| \| \| \|
%     1--2--3--4--5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TRIANGLE_NUM1, the number of triangles in the quadratic
%    triangulation.
%
%    Input, integer TRIANGLE_NODE1(6,TRIANGLE_NUM1), the quadratic triangulation.
%
%    Output, integer TRIANGLE_NODE2(3,4*TRIANGLE_NUM1), the linear triangulation.
%
  tri2 = 0;

  triangle_node2 = zeros ( 3, 4 * triangle_num1 );
  
  for tri1 = 1 : triangle_num1

    n1 = triangle_node1(1,tri1);
    n2 = triangle_node1(2,tri1);
    n3 = triangle_node1(3,tri1);
    n4 = triangle_node1(4,tri1);
    n5 = triangle_node1(5,tri1);
    n6 = triangle_node1(6,tri1);

    tri2 = tri2 + 1;
    triangle_node2(1:3,tri2) = [ n1, n4, n6 ]';
    tri2 = tri2 + 1;
    triangle_node2(1:3,tri2) = [ n2, n5, n4 ]';
    tri2 = tri2 + 1;
    triangle_node2(1:3,tri2) = [ n3, n6, n5 ]';
    tri2 = tri2 + 1;
    triangle_node2(1:3,tri2) = [ n4, n5, n6 ]';

  end

  return
end
