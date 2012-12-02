function triangulation_refine ( prefix )

%*****************************************************************************80
%
%% MAIN is the main program for TRIANGULATION_REFINE.
%
%  Discussion:
%
%    TRIANGULATION_REFINE refines a triangulation by doubling.
%
%  Usage:
%
%    triangulation_refine ( 'prefix' )
%
%    where 'prefix' is the common filename prefix:
%
%    * 'prefix'_nodes.txt contains the node coordinates,
%    * 'prefix'_elements.txt contains the element definitions.
%    * 'prefix'_ref_nodes.txt will contain the refined nodes;
%    * 'prefix'_ref_elements.txt will contain the refined elements.
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
  debug = 1;
  
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_REFINE\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Read a "linear" or "quadratic" triangulation\n' );
  fprintf ( 1, '  and write out a refined triangulation.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read a dataset of NODE_NUM1 points in 2 dimensions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read an associated triangulation dataset of TRIANGLE_NUM \n' );
  fprintf ( 1, '  triangles which uses 3 or 6 nodes per triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Subdivide each triangle into 4 triangles,\n' );
  fprintf ( 1, '  generate new nodes as midpoints of current nodes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Write out the new node and triangulation data.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  If the input triangulation was Delaunay, then\n' );
  fprintf ( 1, '  the output triangulation will be Delaunay.\n' );
%
%  The command line argument is the common filename prefix.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_REFINE:\n' );

    prefix = input ( ...
      'Please enter the filename prefix:' );

  end
%
%  Create the filenames.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
  node_ref_filename = strcat ( prefix, '_ref_nodes.txt' );
  element_ref_filename = strcat ( prefix, '_ref_elements.txt' );
%
%  Read the node data.
%
  [ dim_num, node_num1 ] = r8mat_header_read (  node_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', node_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  Number of points NODE_NUM1  = %d\n', node_num1 );

  node_xy1 = r8mat_data_read ( node_filename, ...
    dim_num, node_num1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', node_filename );

  r8mat_transpose_print_some ( dim_num, node_num1, node_xy1, 1, 1, ...
    dim_num, 5, '  First 5 nodes:' );
%
%  Read the element data.
%
  [ triangle_order, triangle_num1 ] = i4mat_header_read ( element_filename );

  if ( triangle_order ~= 3 && triangle_order ~= 6 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_REFINE - Fatal error!\n' );
    fprintf ( 1, '  Data is not for a 3 or 6-node triangulation.\n' );
    error ( 'TRIANGULATION_REFINE - Fatal error!' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of ""%s".\n', element_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle order = %d\n', triangle_order );
  fprintf ( 1, '  Number of triangles TRIANGLE_NUM1  = %d\n', triangle_num1 );

  triangle_node1 = i4mat_data_read ( ...
    element_filename, triangle_order, triangle_num1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in ""%s".\n', element_filename );

  i4mat_transpose_print_some ( triangle_order, triangle_num1, triangle_node1, ...
    1, 1, triangle_order, 5, '  First 5 triangles:' );
%
%  Detect and correct 0-based indexing.
%
  triangle_node1 = mesh_base_one ( node_num1, triangle_order, triangle_num1, ...
    triangle_node1 );
%
%  Determine the size of the refined mesh.
%
  if ( triangle_order == 3 )

    [ node_num2, triangle_num2, edge_data ] = ...
      triangulation_order3_refine_size ( node_num1, triangle_num1, ...
      triangle_node1 );

  elseif ( triangle_order == 6 )

    [ node_num2, triangle_num2, edge_data ] = ...
      triangulation_order6_refine_size ( node_num1, triangle_num1, ...
      triangle_node1 );

  end 

  fprintf ( 1, '\n' );
  fprintf ( 1,'  Number of nodes in refined mesh =      %d\n', node_num2 );
  fprintf ( 1,'  Number of triangles in refined mesh =  %d\n', triangle_num2 );
%
%  Compute the refined mesh.
%
  if ( triangle_order == 3 )

    [ node_xy2, triangle_node2 ] = triangulation_order3_refine_compute ( ...
      node_num1, triangle_num1, node_xy1, triangle_node1, node_num2, ...
      triangle_num2, edge_data );

  else

    [ node_xy2, triangle_node2 ] = triangulation_order6_refine_compute ( ...
      node_num1, triangle_num1, node_xy1, triangle_node1, node_num2, ...
      triangle_num2, edge_data );

  end

  if ( debug )

    r8mat_transpose_print_some ( dim_num, node_num2, node_xy2, ...
      1, 1, dim_num, 5, '  First 5 output nodes:' );

    i4mat_transpose_print_some ( triangle_order, triangle_num2, ...
      triangle_node2, 1, 1, triangle_order, 5, '  First 5 output triangles:' );

  end
%
%  Write out the node and triangle data.
%
  r8mat_write ( node_ref_filename, dim_num, node_num2, node_xy2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the refined node data to ""%s".\n', node_ref_filename );

  i4mat_write ( element_ref_filename, triangle_order, ...
    triangle_num2, triangle_node2 );

  fprintf ( 1, '  Wrote the refined element data to ""%s".\n', element_ref_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_REFINE\n' );
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
function isgn = i4col_compare ( m, n, a, i, j )

%*****************************************************************************80
%
%% I4COL_COMPARE compares columns I and J of a integer array.
%
%  Example:
%
%    Input:
%
%      M = 3, N = 4, I = 2, J = 4
%
%      A = (
%        1  2  3  4
%        5  6  7  8
%        9 10 11 12 )
%
%    Output:
%
%      ISGN = -1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), an array of N columns of vectors of length M.
%
%    Input, integer I, J, the columns to be compared.
%    I and J must be between 1 and N.
%
%    Output, integer ISGN, the results of the comparison:
%    -1, column I < column J,
%     0, column I = column J,
%    +1, column J < column I.
%

%
%  Check.
%
  if ( i < 1)
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Column index I = %d < 1.\n', i );
    error ( 'I4COL_COMPARE - Fatal error!' );
  end

  if ( n < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  N = %d < column index I = %d.\n', n, i );
    error ( 'I4COL_COMPARE - Fatal error!' );
  end

  if ( j < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Column index J = %d < 1.\n', j );
    error ( 'I4COL_COMPARE - Fatal error!' );
  end

  if ( n < j )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  N = %d < column index J = %d.\n', n, j );
    error ( 'I4COL_COMPARE - Fatal error!' );
  end

  isgn = 0;

  if ( i == j )
    return
  end

  k = 1;

  while ( k <= m )

    if ( a(k,i) < a(k,j) )
      isgn = -1;
      return
    elseif ( a(k,j) < a(k,i) )
      isgn = +1;
      return
    end

    k = k + 1;

  end

  return
end
function a = i4col_sort_a ( m, n, a )

%*****************************************************************************80
%
%% I4COL_SORT_A ascending sorts an I4COL.
%
%  Discussion:
%
%    In lexicographic order, the statement "X < Y", applied to two real
%    vectors X and Y of length M, means that there is some index I, with
%    1 <= I <= M, with the property that
%
%      X(J) = Y(J) for J < I,
%    and
%      X(I) < Y(I).
%
%    In other words, the first time they differ, X is smaller.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of A, and the length of
%    a vector of data.
%
%    Input, integer N, the number of columns of A.
%
%    Input, integer A(M,N), the array of N columns of M-vectors.
%
%    Output, integer A(M,N), the columns of A have been sorted in ascending
%    lexicographic order.
%
  if ( m <= 0 )
    return
  end

  if ( n <= 1 )
    return
  end
%
%  Initialize.
%
  indx = 0;
  isgn = 0;
%
%  Call the external heap sorter.
%
  while ( 1 )

    [ indx, i, j ] = sort_heap_external ( n, indx, isgn );
%
%  Interchange the I and J objects.
%
    if ( 0 < indx )

      a = i4col_swap ( m, n, a, i, j );
%
%  Compare the I and J objects.
%
    elseif ( indx < 0 )

      isgn = i4col_compare ( m, n, a, i, j );

    elseif ( indx == 0 )

      break

    end

  end

  return
end
function a = i4col_swap ( m, n, a, i, j )

%*****************************************************************************80
%
%% I4COL_SWAP swaps columns I and J of a integer array of column data.
%
%  Example:
%
%    Input:
%
%      M = 3, N = 4, I = 2, J = 4
%
%      A = (
%        1  2  3  4
%        5  6  7  8
%        9 10 11 12 )
%
%    Output:
%
%      A = (
%        1  4  3  2
%        5  8  7  6
%        9 12 11 10 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the array.
%
%    Input, integer A(M,N), an array of N columns of length M.
%
%    Input, integer I, J, the columns to be swapped.
%
%    Output, integer A(M,N), the array, with columns I and J swapped.
%
  if ( i < 1 || n < i || j < 1 || n < j )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_SWAP - Fatal error!\n' );
    fprintf ( 1, '  I or J is out of bounds.\n' );
    fprintf ( 1, '  I =    %d\n', i );
    fprintf ( 1, '  J =    %d\n', j );
    fprintf ( 1, '  N =    %d\n', n );
    error ( 'I4COL_SWAP - Fatal error!' );
  end

  if ( i == j )
    return
  end

  col(1:m) = a(1:m,i)';
  a(1:m,i) = a(1:m,j);
  a(1:m,j) = col(1:m)';

  return
end
function [ j1, j2 ] = i4i4_sort_a ( i1, i2 )

%*****************************************************************************80
%
%% I4I4_SORT_A ascending sorts a pair of integers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I1, I2, the values to sort.
%
%    Output, integer J1, J2, the sorted values.
%
  j1 = min ( i1, i2 );
  j2 = max ( i1, i2 );

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
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
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
%  For greater precision, try:
%
%     fprintf ( output_unit, '  %24,16f', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %14f', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

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
function [ indx, i, j ] = sort_heap_external ( n, indx, isgn )

%*****************************************************************************80
%
%% SORT_HEAP_EXTERNAL externally sorts a list of items into ascending order.
%
%  Discussion:
%
%    The actual list of data is not passed to the routine.  Hence this
%    routine may be used to sort integers, reals, numbers, names,
%    dates, shoe sizes, and so on.  After each call, the routine asks
%    the user to compare or interchange two items, until a special
%    return value signals that the sorting is completed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2004
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf.
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the number of items to be sorted.
%
%    Input, integer INDX, the main communication signal.
%    The user must set INDX to 0 before the first call.
%    Thereafter, the user should set the input value of INDX
%    to the output value from the previous call.
%
%    Input, integer ISGN, results of comparison of elements I and J.
%    (Used only when the previous call returned INDX less than 0).
%    ISGN <= 0 means I is less than or equal to J;
%    0 <= ISGN means I is greater than or equal to J.
%
%    Output, integer INDX, the main communication signal.
%    If INDX is
%
%      greater than 0, the user should:
%      * interchange items I and J;
%      * call again.
%
%      less than 0, the user should:
%      * compare items I and J;
%      * set ISGN = -1 if I < J, ISGN = +1 if J < I;
%      * call again.
%
%      equal to 0, the sorting is done.
%
%    Output, integer I, J, the indices of two items.
%    On return with INDX positive, elements I and J should be interchanged.
%    On return with INDX negative, elements I and J should be compared, and
%    the result reported in ISGN on the next call.
%
  persistent i_save;
  persistent j_save;
  persistent k;
  persistent k1;
  persistent n1;
%
%  INDX = 0: This is the first call.
%
  if ( indx == 0 )
      
    i_save = -1;
    j_save = -1;
    k = floor ( n / 2 );
    k1 = k;
    n1 = n;
%
%  INDX < 0: The user is returning the results of a comparison.
%
  elseif ( indx < 0 )

    if ( indx == -2 )

      if ( isgn < 0 )
        i_save = i_save + 1;
      end

      j_save = k1;
      k1 = i_save;
      indx = -1;
      i = i_save;
      j = j_save;
      return;
    end

    if ( 0 < isgn )
      indx = 2;
      i = i_save;
      j = j_save;
      return;
    end

    if ( k <= 1 )

      if ( n1 == 1 )
        i_save = 0;
        j_save = 0;
        indx = 0;
      else
        i_save = n1;
        n1 = n1 - 1;
        j_save = 1;
        indx = 1;
      end

      i = i_save;
      j = j_save;
      return;

    end

    k = k - 1;
    k1 = k;
%
%  0 < INDX, the user was asked to make an interchange.
%
  elseif ( indx == 1 )

    k1 = k;

  end

  while ( 1 )

    i_save = 2 * k1;

    if ( i_save == n1 )
      j_save = k1;
      k1 = i_save;
      indx = -1;
      i = i_save;
      j = j_save;
      return;
    elseif ( i_save <= n1 )
      j_save = i_save + 1;
      indx = -2;
      i = i_save;
      j = j_save;
      return;
    end

    if ( k <= 1 )
      break;
    end

    k = k - 1;
    k1 = k;

  end

  if ( n1 == 1 )
    i_save = 0;
    j_save = 0;
    indx = 0;
    i = i_save;
    j = j_save;
  else
    i_save = n1;
    n1 = n1 - 1;
    j_save = 1;
    indx = 1;
    i = i_save;
    j = j_save;
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
function [ node_xy2, triangle_node2 ] = ...
  triangulation_order3_refine_compute ( node_num1, triangle_num1, node_xy1, ...
  triangle_node1, node_num2, triangle_num2, edge_data )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_REFINE_COMPUTE computes a refined order 3 triangulation.
%
%  Discussion:
%
%    Given a triangle defined by nodes 1, 2, 3, we need to generate
%    nodes 12, 23, and 13, and create 4 new subtriangles, T1, T2, T3
%    and T4.
%
%    The task is more complicated by the fact that we are working with
%    a mesh of triangles, so that we want to create a node only once,
%    even though it may be shared by other triangles.
%
%          3
%         / \
%        /T3 \
%      13----23
%      / \T4 / \
%     /T1 \ /T2 \
%    1----12-----2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM1, the number of nodes.
%
%    Input, integer TRIANGLE_NUM1, the number of triangles.
%
%    Input, real NODE_XY1(2,NODE_NUM1), the nodes.
%
%    Input, integer TRIANGLE_NODE1(3,TRIANGLE_NUM1), the nodes that make up the
%    triangles.  These should be listed in counterclockwise order.
%
%    Input, integer NODE_NUM2, the number of nodes in the refined mesh.
%
%    Input, integer TRIANGLE_NUM2, the number of triangles in the refined mesh.
%
%    Input, integer EDGE_DATA(5,3*TRIANGLE_NUM1), edge information computed
%    by TRIANGULATION_ORDER3_REFINE_SIZE.
%
%    Output, real NODE_XY2(2,NODE_NUM2), the refined nodes.
%
%    Output, integer TRIANGLE_NODE2(3,TRIANGLE_NUM2), the nodes that make up the
%    triangles in the refined mesh.
%
  node_xy2 = zeros(2,node_num2);
  triangle_node2 = zeros(3,triangle_num2);
%
%  Copy the old nodes.
%
  node_xy2(1:2,1:node_num1) = node_xy1(1:2,1:node_num1);

  triangle_node2(1:3,1:triangle_num2) = -1;
%
%  We can assign the existing nodes to the new triangles.
%
  for triangle1 = 1 : triangle_num1
    triangle_node2(1,(triangle1-1)*4+1) = triangle_node1(1,triangle1);
    triangle_node2(2,(triangle1-1)*4+2) = triangle_node1(2,triangle1);
    triangle_node2(3,(triangle1-1)*4+3) = triangle_node1(3,triangle1);
  end

  node = node_num1;

  n1_old = -1;
  n2_old = -1;

  for edge = 1 : 3 * triangle_num1

    n1 = edge_data(1,edge);
    n2 = edge_data(2,edge);
%
%  If this edge is new, create the coordinates and index for this node.
%
    if ( n1 ~= n1_old || n2 ~= n2_old )

      node = node + 1;

      if ( node_num2 < node )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'TRIANGLE_MESH_ORDER3_REFINE - Fatal error!\n' );
        fprintf ( 1, '  Node index exceeds NODE_NUM2.\n' );
        error ( 'TRIANGLE_MESH_ORDER3_REFINE - Fatal error!' );
      end

      node_xy2(1:2,node) = ( node_xy2(1:2,n1) + node_xy2(1:2,n2) ) / 2.0;

      n1_old = n1;
      n2_old = n2;

    end
%
%  Assign the node to triangles.
%
    v1 = edge_data(3,edge);
    v2 = edge_data(4,edge);
    triangle1 = edge_data(5,edge);

    if ( v1 == 1 && v2 == 2 )

      triangle_node2(1,(triangle1-1)*4+2) = node;
      triangle_node2(2,(triangle1-1)*4+1) = node;
      triangle_node2(3,(triangle1-1)*4+4) = node;

    elseif ( v1 == 1 && v2 == 3 )

      triangle_node2(1,(triangle1-1)*4+3) = node;
      triangle_node2(2,(triangle1-1)*4+4) = node;
      triangle_node2(3,(triangle1-1)*4+1) = node;

    elseif ( v1 == 2 && v2 == 3 ) 

      triangle_node2(1,(triangle1-1)*4+4) = node;
      triangle_node2(2,(triangle1-1)*4+3) = node;
      triangle_node2(3,(triangle1-1)*4+2) = node;

    end

  end

  return
end
function [ node_num2, triangle_num2, edge_data ] = ...
  triangulation_order3_refine_size ( node_num1, triangle_num1, ...
  triangle_node1 )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_REFINE_SIZE sizes a refined order 3 triangulation.
%
%  Discussion:
%
%    Given a triangle defined by nodes 1, 2, 3, we need to generate
%    nodes 12, 23, and 13, and create 4 new subtriangles, T1, T2, T3
%    and T4.
%
%    The task is more complicated by the fact that we are working with
%    a mesh of triangles, so that we want to create a node only once,
%    even though it may be shared by other triangles.
%
%          3
%         / \
%        /T3 \
%      13----23
%      / \T4 / \
%     /T1 \ /T2 \
%    1----12-----2
%
%    This routine simply determines the sizes of the resulting node
%    and triangle arrays.
%
%    The primary amount of work occurs in sorting a list of 3 * TRIANGLE_NUM
%    data items, one item for every edge of every triangle.  Each
%    data item records, for a given edge, the global indices
%    of the two endpoints, the local indices of the two endpoints,
%    and the index of the triangle.
%
%    Through careful sorting, it is possible to arrange this data in
%    a way that allows the proper generation of the interpolated nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM1, the number of nodes in the original mesh.
%
%    Input, integer TRIANGLE_NUM1, the number of triangles in the
%    original mesh.
%
%    Input, integer TRIANGLE_NODE1(3,TRIANGLE_NUM1), the indices of the nodes
%    that form the triangles in the input mesh.
%
%    Output, integer NODE_NUM2, the number of nodes in the refined mesh.
%
%    Output, integer TRIANGLE_NUM2, the number of triangles in the
%    refined mesh.
%
%    Output, integer EDGE_DATA(5,3*TRIANGLE_NUM1), edge data that will
%    be needed by TRIANGULATION_ORDER3_REFINE_COMPUTE.
%
  edge_data = zeros(5,3*triangle_num1);
%
%  Step 1.
%  From the list of nodes for triangle T, of the form: (I,J,K)
%  construct the edge relations:
%
%    (I,J,1,2,T)
%    (I,K,1,3,T)
%    (J,K,2,3,T)
%
%  In order to make matching easier, we reorder each pair of nodes
%  into ascending order.
%
  for triangle = 1 : triangle_num1

    i = triangle_node1(1,triangle);
    j = triangle_node1(2,triangle);
    k = triangle_node1(3,triangle);

    a = min ( i, j );
    b = max ( i, j );

    edge_data(1:5,3*(triangle-1)+1) = [ a, b, 1, 2, triangle ]';

    a = min ( i, k );
    b = max ( i, k );

    edge_data(1:5,3*(triangle-1)+2) = [ a, b, 1, 3, triangle ]';

    a = min ( j, k );
    b = max ( j, k );

    edge_data(1:5,3*(triangle-1)+3) = [ a, b, 2, 3, triangle ]';

  end
%
%  Step 2. Perform an ascending dictionary sort on the neighbor relations.
%  We only intend to sort on rows 1:2; the routine we call here
%  sorts on the full column but that won't hurt us.
%
%  What we need is to find all cases where triangles share an edge.
%  By sorting the columns of the EDGE_DATA array, we will put shared edges
%  next to each other.
%
  edge_data = i4col_sort_a ( 5, 3*triangle_num1, edge_data );
%
%  Step 3. All the triangles which share an edge show up as consecutive
%  columns with identical first two entries.  Figure out how many new
%  nodes there are, and allocate space for their coordinates.
%
  node_num2 = node_num1;

  n1_old = -1;
  n2_old = -1;

  for edge = 1 : 3 * triangle_num1
    n1 = edge_data(1,edge);
    n2 = edge_data(2,edge);
    if ( n1 ~= n1_old || n2 ~= n2_old )
      node_num2 = node_num2 + 1;
      n1_old = n1;
      n2_old = n2;
    end
  end

  triangle_num2 = 4 * triangle_num1;

  return
end
function [ node_xy2, triangle_node2 ] = ...
  triangulation_order6_refine_compute ( node_num1, triangle_num1, node_xy1, ...
  triangle_node1, node_num2, triangle_num2, edge_data )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_REFINE_COMPUTE computes a refined order 6 triangulation.
%
%  Discussion:
%
%    Given a quadratic triangle defined by nodes 1, 2, 3, 4, 5, 6, we
%    need to generate nodes 14, 16, 24, 25, 35, 36, 45, 46, 56, and 4 new
%    quadratic subtriangles T1, T2, T3 and T4.
%
%    The task is more complicated by the fact that we are working with
%    a mesh of triangles, so that we want to create a node only once,
%    even though it may be shared by other triangles.  (In fact, only
%    the new nodes on the edges can be shared, and then only by at most
%    one other triangle.)
%
%            3
%           / \
%          36 35
%         / T3  \
%        6--56---5
%       / \ T4  / \
%      16 46  45  25
%     / T1  \ / T2  \
%    1--14---4--24---2
%
%    This routine is given sorted information defining the edges, and uses
%    it to build the new node and triangle arrays.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM1, the number of nodes.
%
%    Input, integer TRIANGLE_NUM1, the number of triangles.
%
%    Input, real NODE_XY1(2,NODE_NUM1), the nodes.
%
%    Input, integer TRIANGLE_NODE1(6,TRIANGLE_NUM1), the nodes that make up the
%    triangles.  These should be listed in counterclockwise order.
%
%    Input, integer NODE_NUM2, the number of nodes in the refined mesh.
%
%    Input, integer TRIANGLE_NUM2, the number of triangles in the refined mesh.
%
%    Input, integer EDGE_DATA(5,3*TRIANGLE_NUM1), edge data.
%
%    Output, real NODE_XY2(2,NODE_NUM2), the refined nodes.
%
%    Output, integer TRIANGLE_NODE2(6,TRIANGLE_NUM2), the nodes that make up the
%    triangles in the refined mesh.
%

%
%  Step 1:
%  Copy old nodes.
%
  node_xy2(1:2,1:node_num1) = node_xy1(1:2,1:node_num1);
%
%  Copy indices of existing nodes into new triangle array.
%
  triangle_node2(1:6,1:triangle_num2) = -1;

  for triangle1 = 1 : triangle_num1

    t1 = ( triangle1 - 1 ) * 4 + 1;
    t2 = ( triangle1 - 1 ) * 4 + 2;
    t3 = ( triangle1 - 1 ) * 4 + 3;
    t4 = ( triangle1 - 1 ) * 4 + 4;

    triangle_node2(1,t1) = triangle_node1(1,triangle1);
    triangle_node2(2,t1) = triangle_node1(4,triangle1);
    triangle_node2(3,t1) = triangle_node1(6,triangle1);

    triangle_node2(1,t2) = triangle_node1(4,triangle1);
    triangle_node2(2,t2) = triangle_node1(2,triangle1);
    triangle_node2(3,t2) = triangle_node1(5,triangle1);

    triangle_node2(1,t3) = triangle_node1(6,triangle1);
    triangle_node2(2,t3) = triangle_node1(5,triangle1);
    triangle_node2(3,t3) = triangle_node1(3,triangle1);

    triangle_node2(1,t4) = triangle_node1(5,triangle1);
    triangle_node2(2,t4) = triangle_node1(6,triangle1);
    triangle_node2(3,t4) = triangle_node1(4,triangle1);

  end
%
%  Step 2.
%  Examine sorted edge information.  The first time an edge is encountered,
%  generate two new nodes, then assign them (usually) to the four subtriangles
%  of the two triangles that share that edge.
%
  node = node_num1;

  n1_old = -1;
  n2_old = -1;

  for edge = 1 : 3 * triangle_num1

    n1 = edge_data(1,edge);
    n2 = edge_data(2,edge);

    l1 = edge_data(3,edge);
    l3 = edge_data(4,edge);

    if ( l1 == 1 && l3 == 2 )
      l2 = 4;
    elseif ( l1 == 1 && l3 == 3 )
      l2 = 6;
    elseif ( l1 == 2 && l3 == 3 )
      l2 = 5;
    end

    triangle1 = edge_data(5,edge);
%
%  If this is the first time we've encountered this edge,
%  create the new new nodes.
%
    if ( n1 ~= n1_old || n2 ~= n2_old )

      n1_old = n1;
      n2_old = n2;

      v1 = triangle_node1(l1,triangle1);
      v2 = triangle_node1(l2,triangle1);
      v3 = triangle_node1(l3,triangle1);

      node = node + 1;
      v4 = node;
      node_xy2(1:2,node) = 0.5 * ( node_xy1(1:2,v1) + node_xy1(1:2,v2) );

      node = node + 1;
      v5 = node;
      node_xy2(1:2,node) = 0.5 * ( node_xy1(1:2,v2) + node_xy1(1:2,v3) );

    end

    t1 = ( triangle1 - 1 ) * 4 + 1;
    t2 = ( triangle1 - 1 ) * 4 + 2;
    t3 = ( triangle1 - 1 ) * 4 + 3;

    if ( l1 == 1 && l3 == 2 )

      if ( triangle_node1(1,triangle1) == v1 )
        triangle_node2(4,t1) = v4;
        triangle_node2(4,t2) = v5;
      else
        triangle_node2(4,t1) = v5;
        triangle_node2(4,t2) = v4;
      end

    elseif ( l1 == 1 && l3 == 3 )

      if ( triangle_node1(l1,triangle1) == v1 )
        triangle_node2(6,t1) = v4;
        triangle_node2(6,t3) = v5;
      else
        triangle_node2(6,t1) = v5;
        triangle_node2(6,t3) = v4;
      end

    elseif ( l1 == 2 && l3 == 3 )

      if ( triangle_node1(l1,triangle1) == v1 )
        triangle_node2(5,t3) = v4;
        triangle_node2(5,t2) = v5;
      else
        triangle_node2(5,t3) = v5;
        triangle_node2(5,t2) = v4;
      end

    end

  end
%
%  Step 3.
%  Each old triangle has a single central subtriangle, for which we now
%  need to generate three new "interior" nodes.
%
  for triangle1 = 1 : triangle_num1

    v4 = triangle_node1(4,triangle1);
    v5 = triangle_node1(5,triangle1);
    v6 = triangle_node1(6,triangle1);

    t1 = ( triangle1 - 1 ) * 4 + 1;
    t2 = ( triangle1 - 1 ) * 4 + 2;
    t3 = ( triangle1 - 1 ) * 4 + 3;
    t4 = ( triangle1 - 1 ) * 4 + 4;

    node = node + 1;
    node_xy2(1:2,node) = 0.5 * ( node_xy1(1:2,v5) + node_xy1(1:2,v6) );
    triangle_node2(4,t4) = node;
    triangle_node2(4,t3) = node;

    node = node + 1;
    node_xy2(1:2,node) = 0.5 * ( node_xy1(1:2,v6) + node_xy1(1:2,v4) );
    triangle_node2(5,t4) = node;
    triangle_node2(5,t1) = node;

    node = node + 1;
    node_xy2(1:2,node) = 0.5 * ( node_xy1(1:2,v4) + node_xy1(1:2,v5) );
    triangle_node2(6,t4) = node;
    triangle_node2(6,t2) = node;

  end

  return
end
function [ node_num2, triangle_num2, edge_data ] = ...
  triangulation_order6_refine_size ( node_num1, triangle_num1, triangle_node1 )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_REFINE_SIZE sizes a refined order 6 triangulation.
%
%  Discussion:
%
%    Given a quadratic triangle defined by nodes 1, 2, 3, 4, 5, 6, we
%    need to generate nodes 14, 16, 24, 25, 35, 36, 45, 46, 56, and 4 new
%    quadratic subtriangles T1, T2, T3 and T4.
%
%    The task is more complicated by the fact that we are working with
%    a mesh of triangles, so that we want to create a node only once,
%    even though it may be shared by other triangles.  (In fact, only
%    the new nodes on the edges can be shared, and then only by at most
%    one other triangle.)
%
%            3
%           / \
%          36 35
%         / T3  \
%        6--56---5
%       / \ T4  / \
%      16 46  45  25
%     / T1  \ / T2  \
%    1--14---4--24---2
%
%    This routine determines the sizes of the resulting node and
%    triangles, and constructs an edge array that can be used to
%    properly number the new nodes.
%
%    The primary work occurs in sorting a list related to the edges.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM1, the number of nodes.
%
%    Input, integer TRIANGLE_NUM1, the number of triangles.
%
%    Input, integer TRIANGLE_NODE1(6,TRIANGLE_NUM1), the nodes that make up the
%    triangles.  These should be listed in counterclockwise order.
%
%    Input, integer NODE_NUM2, the number of nodes in the refined mesh.
%
%    Input, integer TRIANGLE_NUM2, the number of triangles in the refined mesh.
%
%    Output, integer EDGE_DATA(5,3*TRIANGLE_NUM1), edge data needed by
%    TRIANGULATION_ORDER6_REFINE_COMPUTE.
%

%
%  Step 1:
%  From the list of vertices for triangle T, of the form: (I,J,K),
%  construct the edge relations:
%
%    (I,J,1,2,T)
%    (I,K,1,3,T)
%    (J,K,2,3,T)
%
%  To make matching easier, we reorder each pair of nodes into
%  ascending order.
%
  edge_data = zeros ( 5, 3 * triangle_num1 );
  
  for triangle1 = 1 : triangle_num1

    i = triangle_node1(1,triangle1);
    j = triangle_node1(2,triangle1);
    k = triangle_node1(3,triangle1);

    [ a, b ] = i4i4_sort_a ( i, j );
    edge_data(1:5,3*(triangle1-1)+1) = [ a, b, 1, 2, triangle1 ]';

    [ a, b ] = i4i4_sort_a ( i, k );
    edge_data(1:5,3*(triangle1-1)+2) = [ a, b, 1, 3, triangle1 ]';

    [ a, b ] = i4i4_sort_a ( j, k );
    edge_data(1:5,3*(triangle1-1)+3) = [ a, b, 2, 3, triangle1 ]';

  end
%
%  Step 2: Perform an ascending dictionary sort on the relations.
%
  edge_data = i4col_sort_a ( 5, 3*triangle_num1, edge_data );
%
%  Step 3: Each shared edge will show up twice, consecutively,
%  in the EDGE_DATA array.  Each unique edge will generate
%  two new nodes, and each triangle will generate three new nodes.
%
  node_num2 = node_num1;

  n1_old = -1;
  n2_old = -1;

  for edge = 1 : 3 * triangle_num1
    n1 = edge_data(1,edge);
    n2 = edge_data(2,edge);
    if ( n1 ~= n1_old || n2 ~= n2_old )
      node_num2 = node_num2 + 2;
      n1_old = n1;
      n2_old = n2;
    end
  end

  node_num2 = node_num2 + 3 * triangle_num1;

  triangle_num2 = 4 * triangle_num1;

  return
end
