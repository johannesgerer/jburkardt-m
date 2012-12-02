function tet_mesh_refine ( prefix )

%*****************************************************************************80
%
%% TET_MESH_REFINE refines a tetrahedral mesh of order 4 (linear).
%
%  Usage:
%
%    tet_mesh_refine ( 'prefix' )
%
%    where
%
%    * 'prefix'_nodes.txt contains nodal coordinates;
%    * 'prefix'_elements.txt contains the element definitions;
%    * 'prefix'_ref_nodes.txt contains the new node coordinates;
%    * 'prefix'_ref_elements.txt contains the new element definitions;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string PREFIX, the common filename prefix.
%  
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TET_MESH_REFINE:\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  READ a tet mesh, REFINE it, and WRITE the new data.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  READ:\n' );
  fprintf ( 1, '    a node dataset of NODE_NUM1 points in 3 dimensions.\n' );
  fprintf ( 1, '    a tet mesh of TETRA_NUM1 tets of order TET_ORDER.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  REFINE:\n' );
  fprintf ( 1, '    compute a new set of nodes and tets, which is an\n' );
  fprintf ( 1, '    eightfold refinement of the input mesh.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  WRITE:\n' );
  fprintf ( 1, '    a node dataset of NODE_NUM2 points in 3 dimensions.\n' );
  fprintf ( 1, '    a tet mesh of 8*TETRA_NUM1 tets of order TET_ORDER.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  At the moment, this program only works for a linear\n' );
  fprintf ( 1, '  mesh (TET_ORDER=4).\n' );
%
%  Argument 1 is the common file prefix.
%
  if ( 1 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TET_MESH_REFINE:\n' );
    prefix = input ( '  Please enter the filename prefix:' );

  end
%
%  Create the filenames.
%
  input_node_filename = strcat ( prefix, '_nodes.txt' );
  input_element_filename = strcat ( prefix, '_elements.txt' );
  output_node_filename = strcat ( prefix, '_ref_nodes.txt' );
  output_element_filename = strcat ( prefix, '_ref_elements.txt' );
%
%  Read the node data.
%
  [ dim_num, node_num1 ] = r8mat_header_read (  input_node_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', input_node_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM  = %d\n', dim_num );
  fprintf ( 1, '  Number of points NODE_NUM1 = %d\n', node_num1 );

  node_xyz1 = r8mat_data_read ( input_node_filename, dim_num, node_num1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', input_node_filename );

  r8mat_transpose_print_some ( dim_num, node_num1, node_xyz1, ...
    1, 1, dim_num, 5, '  First 5 input nodes:' );
%
%  Read the tetra data.
%
  [ tetra_order, tetra_num1 ] = i4mat_header_read ( input_element_filename );

  if ( tetra_order == 4 )
  elseif ( tetra_order == 10 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TET_MESH_REFINE - Fatal error!\n' );
    fprintf ( 1, '  This program cannot yet handle the 10-node case.\n' );
    fprintf ( 1, '  Try using the sequence:\n' );
    fprintf ( 1, '    TET_MESH_Q2L --> TET_MESH_REFINE --> TET_MESH_L2Q.\n' );
    error ( 'TET_MESH_REFINE - Fatal error!' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TET_MESH_REFINE - Fatal error!\n' );
    fprintf ( 1, '  Data is not for a 4-node or 10-node tet mesh.\n' );
    error ( 'TET_MESH_REFINE - Fatal error!' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', input_element_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tetrahedron order = %d\n', tetra_order );
  fprintf ( 1, '  Number of tetras  = %d\n', tetra_num1 );

  tetra_node1 = i4mat_data_read ( input_element_filename, tetra_order, ...
    tetra_num1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', input_element_filename );

  i4mat_transpose_print_some ( tetra_order, tetra_num1, ...
    tetra_node1, 1, 1, tetra_order, 5, '  First 5 input tetrahedrons:' );
%
%  Detect and correct 0-based indexing.
%
  tetra_node1 = mesh_base_one ( node_num1, tetra_order, tetra_num1, ...
    tetra_node1 );
%
%  Compute the refined mesh.
%
  [ node_num2, tetra_num2, edge_data ] = tet_mesh_order4_refine_size ( ...
    node_num1, tetra_num1, tetra_node1 );

  fprintf ( 1, '  Number of refined nodes =  %d\n', node_num2 );
  fprintf ( 1, '  Number of refined tetras = %d\n', tetra_num2 );

  [ node_xyz2, tetra_node2 ] = tet_mesh_order4_refine_compute ( ...
    node_num1, tetra_num1, node_xyz1, tetra_node1, node_num2, tetra_num2, ...
    edge_data );
%
%  Print a small amount of the quadratic data.
%
  r8mat_transpose_print_some ( dim_num, node_num2, node_xyz2, ...
    1, 1, dim_num, 5, '  First 5 refined nodes:' );

  i4mat_transpose_print_some ( tetra_order, tetra_num2, tetra_node2, ...
    1, 1, tetra_order, 5, '  First 5 refined tetrahedrons' );
%
%  Write out the node and tetra data for the refined mesh
%
  r8mat_write ( output_node_filename, dim_num, node_num2, node_xyz2 );

  fprintf ( 1, '  Wrote the refined nodes to "%s".\n', ...
    output_node_filename );

  i4mat_write ( output_element_filename, tetra_order, tetra_num2, tetra_node2 );

  fprintf ( 1, '  Wrote the refined tetrahedrons to "%s".\n', ...
    output_element_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TET_MESH_REFINE:\n' );
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
%    20 July 2005
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
%    29 June 2009
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
function [ node_xyz2, tetra_node2 ] = tet_mesh_order4_refine_compute ( ...
  node_num1, tetra_num1, node_xyz1, tetra_node1, node_num2, tetra_num2, ...
  edge_data )

%*****************************************************************************80
%
%% TET_MESH_ORDER4_REFINE_COMPUTE computes a refined order4 tet mesh.
%
%  Discussion:
%
%    A refined 4-node tet mesh can be derived from a given
%    4-node tet mesh by interpolating nodes at the midpoint of
%    every edge of the mesh.
%
%    The mesh is described indirectly, as the sum of individual
%    tetrahedrons.  A single physical edge may be a logical edge of
%    any number of tetrahedrons.  It is important, however, that a
%    new node be created exactly once for each edge, assigned an index,
%    and associated with every tetrahedron that shares this edge.
%
%    This routine handles that problem.
%
%    The primary amount of work occurs in sorting a list of 6 * TETRA_NUM
%    data items, one item for every edge of every tetrahedron.  Each
%    data item records, for a given tetrahedron edge, the global indices
%    of the two endpoints, the local indices of the two endpoints,
%    and the index of the tetrahedron.
%
%    Through careful sorting, it is possible to arrange this data in
%    a way that allows the proper generation of the interpolated nodes.
%
%    Let us add the new nodes and temporarily assign them local indices
%    5 through X, based on the following ordering:
%
%      1, 2, 3, 4, (1+2), (1+3), (1+4), (2+3), (2+4), (3+4).
%
%    Then let us assign these nodes to eight subtetrahedrons as follows:
%
%      1, 5, 6, 7
%      2, 5, 8, 9
%      3, 6, 8, 9
%      4, 7, 9, X
%      5, 6, 7, 9
%      5, 6, 8, 9
%      6, 7, 9, X
%      6, 8, 9, X
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Anwei Liu, Barry Joe,
%    Quality Local Refinement of Tetrahedral Meshes Based
%    on 8-Subtetrahedron Subdivision,
%    Mathematics of Computation,
%    Volume 65, Number 215, July 1996, pages 1183-1200.
%
%  Parameters:
%
%    Input, integer NODE_NUM1, the number of nodes in the input mesh.
%
%    Input, integer TETRA_NUM1, the number of tetrahedrons in the
%    input mesh.
%
%    Input, real NODE_XYZ1(3,NODE_NUM1), the coordinates of
%    the nodes that make up the input mesh.
%
%    Input, integer TETRA_NODE1(4,TETRA_NUM1), the indices of the nodes
%    in the input mesh.
%
%    Input, integer NODE_NUM2, the number of nodes for the refined mesh.
%
%    Input, integer TETRA_NUM2, the number of tetrahedrons in the
%    refined mesh.
%
%    Input, integer EDGE_DATA(5,6*TETRA_NUM), edge data.
%
%    Output, real NODE_XYZ2(3,NODE_NUM2), the coordinates of
%    the nodes that make up the output mesh.
%
%    Output, integer TETRA_NODE2(4,TETRA_NUM2), the indices of the nodes
%    in the output mesh.
%

%
%  Generate the index and coordinates of the new midside nodes,
%  and update the tetradehron-node data.
%
  node_xyz2(1:3,1:node_num1) = node_xyz1(1:3,1:node_num1);

  tetra_node2(1:4,1:tetra_num2) = -1;
%
%  The vertices of the input tetrahedron can be assigned now.
%
  for tetra1 = 1 : tetra_num1
    tetra_node2(1,(tetra1-1)*8+1) = tetra_node1(1,tetra1);
    tetra_node2(1,(tetra1-1)*8+2) = tetra_node1(2,tetra1);
    tetra_node2(1,(tetra1-1)*8+3) = tetra_node1(3,tetra1);
    tetra_node2(1,(tetra1-1)*8+4) = tetra_node1(4,tetra1);
  end

  node = node_num1;

  n1_old = -1;
  n2_old = -1;

  for edge = 1 : 6 * tetra_num1
%
%  Read the data defining the edge.
%
    n1 = edge_data(1,edge);
    n2 = edge_data(2,edge);
%
%  If this edge is new, create the coordinates and index.
%
    if ( n1 ~= n1_old || n2 ~= n2_old )

      node = node + 1;

      if ( node_num2 < node )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'TET_MESH_ORDER4_REFINE_COMPUTE - Fatal error!\n' );
        fprintf ( 1, '  Node index exceeds NODE_NUM2.\n' );
        error ( 'TET_MESH_ORDER4_REFINE_COMPUTE - Fatal error!' );
      end

      node_xyz2(1:3,node) = ( node_xyz2(1:3,n1) + node_xyz2(1:3,n2) ) / 2.0;

      n1_old = n1;
      n2_old = n2;

    end
%
%  Assign the node to the tetrahedron.
%
    v1 = edge_data(3,edge);
    v2 = edge_data(4,edge);
    tetra1 = edge_data(5,edge);
%
%  We know the two vertices that bracket this new node.
%  This tells us whether it is new node number 5, 6, 7, 8, 9 or 10.
%  This tells us which of the new subtetrahedrons it belongs to,
%  and what position it occupies.
%
    if ( v1 == 1 && v2 == 2 )

      tetra_node2(2,(tetra1-1)*8+1) = node;
      tetra_node2(2,(tetra1-1)*8+2) = node;
      tetra_node2(1,(tetra1-1)*8+5) = node;
      tetra_node2(1,(tetra1-1)*8+6) = node;

    elseif ( v1 == 1 && v2 == 3 )

      tetra_node2(3,(tetra1-1)*8+1) = node;
      tetra_node2(2,(tetra1-1)*8+3) = node;
      tetra_node2(2,(tetra1-1)*8+5) = node;
      tetra_node2(2,(tetra1-1)*8+6) = node;
      tetra_node2(1,(tetra1-1)*8+7) = node;
      tetra_node2(1,(tetra1-1)*8+8) = node;

    elseif ( v1 == 1 && v2 == 4 )

      tetra_node2(4,(tetra1-1)*8+1) = node;
      tetra_node2(2,(tetra1-1)*8+4) = node;
      tetra_node2(3,(tetra1-1)*8+5) = node;
      tetra_node2(2,(tetra1-1)*8+7) = node;

    elseif ( v1 == 2 && v2 == 3 )

      tetra_node2(3,(tetra1-1)*8+2) = node;
      tetra_node2(3,(tetra1-1)*8+3) = node;
      tetra_node2(3,(tetra1-1)*8+6) = node;
      tetra_node2(2,(tetra1-1)*8+8) = node;

    elseif ( v1 == 2 && v2 == 4 )

      tetra_node2(4,(tetra1-1)*8+2) = node;
      tetra_node2(4,(tetra1-1)*8+3) = node;
      tetra_node2(3,(tetra1-1)*8+4) = node;
      tetra_node2(4,(tetra1-1)*8+5) = node;
      tetra_node2(4,(tetra1-1)*8+6) = node;
      tetra_node2(3,(tetra1-1)*8+7) = node;
      tetra_node2(3,(tetra1-1)*8+8) = node;

    elseif ( v1 == 3 && v2 == 4 )

      tetra_node2(4,(tetra1-1)*8+4) = node;
      tetra_node2(4,(tetra1-1)*8+7) = node;
      tetra_node2(4,(tetra1-1)*8+8) = node;

    end

  end

  return
end
function [ node_num2, tetra_num2, edge_data ] = ...
  tet_mesh_order4_refine_size ( node_num1, tetra_num1, tetra_node1 )

%*****************************************************************************80
%
%% TET_MESH_ORDER4_REFINE_SIZE sizes a refined order 4 tet mesh.
%
%  Discussion:
%
%    A refined tet mesh can be derived from an existing one by interpolating
%    nodes at the midpoint of every edge of the mesh.
%
%    The mesh is described indirectly, as the sum of individual
%    tetrahedrons.  A single physical edge may be a logical edge of
%    any number of tetrahedrons.  It is important, however, that a
%    new node be created exactly once for each edge, assigned an index,
%    and associated with every tetrahedron that shares this edge.
%
%    This routine handles that problem.
%
%    The primary amount of work occurs in sorting a list of 6 * TETRA_NUM
%    data items, one item for every edge of every tetrahedron.  Each
%    data item records, for a given tetrahedron edge, the global indices
%    of the two endpoints, the local indices of the two endpoints,
%    and the index of the tetrahedron.
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
%    25 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM1, the number of nodes in the original mesh.
%
%    Input, integer TETRA_NUM1, the number of tetrahedrons in the
%    original mesh.
%
%    Input, integer TETRA_NODE1(4,TETRA_NUM1), the indices of the nodes
%    that form the tetrahedrons in the input mesh.
%
%    Output, integer NODE_NUM2, the number of nodes in the refined mesh.
%
%    Output, integer TETRA_NUM2, the number of tetrahedrons in the
%    refined mesh.
%
%    Output, integer EDGE_DATA(5,6*TETRA_NUM1), edge data.
%

%
%  Step 1.
%  From the list of nodes for tetrahedron T, of the form: (I,J,K,L)
%  construct the six edge relations:
%
%    (I,J,1,2,T)
%    (I,K,1,3,T)
%    (I,L,1,4,T)
%    (J,K,2,3,T)
%    (J,L,2,4,T)
%    (K,L,3,4,T)
%
%  In order to make matching easier, we reorder each pair of nodes
%  into ascending order.
%
  edge_data = zeros ( 5, 6 * tetra_num1 );
  for tetra = 1 : tetra_num1

    i = tetra_node1(1,tetra);
    j = tetra_node1(2,tetra);
    k = tetra_node1(3,tetra);
    l = tetra_node1(4,tetra);

    [ a, b ] = i4i4_sort_a ( i, j );

    edge_data(1:5,6*(tetra-1)+1) = [ a, b, 1, 2, tetra ]';

    [ a, b ] = i4i4_sort_a ( i, k );

    edge_data(1:5,6*(tetra-1)+2) = [ a, b, 1, 3, tetra ]';

    [ a, b ] = i4i4_sort_a ( i, l );

    edge_data(1:5,6*(tetra-1)+3) = [ a, b, 1, 4, tetra ]';

    [ a, b ] = i4i4_sort_a ( j, k );

    edge_data(1:5,6*(tetra-1)+4) = [ a, b, 2, 3, tetra ]';

    [ a, b ] = i4i4_sort_a ( j, l );

    edge_data(1:5,6*(tetra-1)+5) = [ a, b, 2, 4, tetra ]';

    [ a, b ] = i4i4_sort_a ( k, l );

    edge_data(1:5,6*(tetra-1)+6) = [ a, b, 3, 4, tetra ]';

  end
%
%  Step 2. Perform an ascending dictionary sort on the neighbor relations.
%  We only intend to sort on rows 1:2; the routine we call here
%  sorts on the full column but that won't hurt us.
%
%  What we need is to find all cases where tetrahedrons share an edge.
%  By sorting the columns of the EDGE_DATA array, we will put shared edges
%  next to each other.
%
  edge_data = i4col_sort_a ( 5, 6*tetra_num1, edge_data );
%
%  Step 3. All the tetrahedrons which share an edge show up as consecutive
%  columns with identical first two entries.  Figure out how many new
%  nodes there are, and allocate space for their coordinates.
%
  node_num2 = node_num1;

  n1_old = -1;
  n2_old = -1;

  for edge = 1 : 6 * tetra_num1
    n1 = edge_data(1,edge);
    n2 = edge_data(2,edge);
    if ( n1 ~= n1_old || n2 ~= n2_old )
      node_num2 = node_num2 + 1;
      n1_old = n1;
      n2_old = n2;
    end
  end

  tetra_num2 = 8 * tetra_num1;

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
