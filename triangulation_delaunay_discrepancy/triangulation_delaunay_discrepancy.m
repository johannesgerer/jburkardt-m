function triangulation_delaunay_discrepancy ( prefix )

%*****************************************************************************80
%
%% MAIN is the main program for TRIANGULATION_DELAUNAY_DISCREPANCY.
%
%  Discussion:
%
%    TRIANGULATION_DELAUNAY_DISCREPANCY measures the amount (possibly zero)
%    by which a triangulation fails the local Delaunay test.
%
%    The local Delaunay considers pairs of neighboring triangles.
%    The two triangles form a quadrilateral, and their common edge is one
%    diagonal of that quadrilateral.  The program considers the effect of
%    replacing that diagonal with the other one.  If the minimum angle
%    of the original configuration is smaller than in the new configuration,
%    then the pair of triangles has failed the local Delaunay test.
%    The amount by which the minimum angle would have increased is the
%    local discrepancy.
%
%    This program searches all pairs of triangles, and records the maximum
%    discrepancy found.  If this discrepancy is essentially zero, then the
%    triangulation is a Delaunay triangulation.  Otherwise, it is not a
%    Delaunay triangulation.  
%
%    The user supplies a node file and a triangle file, containing
%    the coordinates of the nodes, and the indices of the nodes that
%    make up each triangle.  Either 3-node or 6-node triangles may
%    be used.
%
%    The program reads the node and triangle data, computes the triangle
%    neighbor information, and writes it to a file.
%
%  Usage:
%
%    triangulation_delaunay_discrepancy ( 'prefix' )
%
%    where:
%
%    'prefix' is the common prefix for the node and triangle files:
%
%    * prefix_nodes.txt,     the node coordinates.
%    * prefix_elements.txt,  the nodes that make up each element.
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
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_DELAUNAY_DISCREPANCY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read a node dataset of NODE_NUM points in 2 dimensions.\n' );
  fprintf ( 1, '  Read an associated triangulation file of TRIANGLE_NUM \n' );
  fprintf ( 1, '  triangles using 3 or 6 nodes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determine the Delaunay discrepancy, that is, the amount\n' );
  fprintf ( 1, '  by which the minimum angle in the triangulation could be\n' );
  fprintf ( 1, '  changed by a single adjustment of a pair of triangles.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  If this discrepancy is negative,\n' );
  fprintf ( 1, '  then the triangulation is not a Delaunay triangulation.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  If this discrepancy is 0 or essentially so, \n' );
  fprintf ( 1, '  then the triangulation is a Delaunay triangulation.\n' );
%
%  Get the number of command line arguments.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_DELAUNAY_DISCREPANCY:\n' );
    prefix = input ( '  Please enter the common filename prefix.' );

  end
%
%  Create the filenames.
%
  node_filename = sprintf ( '%s_nodes.txt', prefix );
  element_filename = sprintf ( '%s_elements.txt', prefix );
%
%  Read the node data.
%
  [ dim_num, node_num ] = r8mat_header_read ( node_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', node_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  Number of points NODE_NUM = %d\n', node_num );

  node_xy(1:dim_num,1:node_num) = r8mat_data_read ( node_filename, ...
    dim_num, node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', node_filename );

  r8mat_transpose_print_some ( dim_num, node_num, node_xy, 1, 1, dim_num, 5, ...
    '  First 5 nodes:' );
%
%  Read the triangulation data.
%
  [ triangle_order, triangle_num ] = ...
    i4mat_header_read ( element_filename );

  if ( triangle_order ~= 3 && triangle_order ~= 6 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_DELAUNAY_DISCREPANCY - Fatal error!\n' );
    fprintf ( 1, '  Data is not for a 3-node or 6-node triangulation.\n' );
    error ( 'TRIANGULATION_DELAUNAY_DISCREPANCY - Fatal error!' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of ""%s".\n', element_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle order = %d\n', triangle_order );
  fprintf ( 1, '  Number of triangles TRIANGLE_NUM  = %d\n', triangle_num );

  triangle_node(1:triangle_order,1:triangle_num) = i4mat_data_read ( ...
    element_filename, triangle_order, triangle_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in ""%s".\n', element_filename );

  i4mat_transpose_print_some ( triangle_order, triangle_num, triangle_node, ...
    1, 1, triangle_order, 5, '  First 5 triangles:' );
%
%  Detect and correct 0-based indexing.
%
  triangle_node = mesh_base_one ( node_num, triangle_order, triangle_num, ...
    triangle_node );
%
%  Create the triangle neighbor array.
%
  triangle_neighbor = triangulation_neighbor_triangles ( triangle_order, ...
    triangle_num, triangle_node );

  i4mat_transpose_print_some ( 3, triangle_num, triangle_neighbor, ...
    1, 1, 3, 5, '  First 5 triangle neighbors:' );
%
%  Now we are ready to check.
%
  [ angle_min, angle_min_triangle, angle_max, angle_max_triangle, ...
    discrepancy ] = triangulation_delaunay_discrepancy_compute ( node_num, ...
    node_xy, triangle_order, triangle_num, triangle_node, triangle_neighbor );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Discrepancy (degrees) =   %f\n', discrepancy );
  fprintf ( 1, '  Minimum angle (degrees) = %f\n', angle_min );
  fprintf ( 1, '  occurred in triangle      %d\n', angle_min_triangle );
  fprintf ( 1, '  Maximum angle (degrees) = %f\n', angle_max );
  fprintf ( 1, '  occurred in triangle      %d\n', angle_max_triangle );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_DELAUNAY_DISCREPANCY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function value = arc_cosine ( c )

%*****************************************************************************80
%
%% ARC_COSINE computes the arc cosine function, with argument truncation.
%
%  Discussion:
%
%    If you call your system ACOS routine with an input argument that is
%    even slightly outside the range [-1.0, 1.0 ], you may get an unpleasant 
%    surprise (I did).
%
%    This routine simply truncates arguments outside the range.
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
%    Input, real C, the argument.
%
%    Output, real VALUE, an angle whose cosine is C.
%
  c2 = c;
  c2 = max ( c2, -1.0 );
  c2 = min ( c2, +1.0 );

  value = acos ( c2 );

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
function angle = triangle_angles_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_ANGLES_2D computes the angles of a triangle in 2D.
%
%  Discussion:
%
%    The law of cosines is used:
%
%      C^2 = A^2 + B^2 - 2 * A * B * COS ( GAMMA )
%
%    where GAMMA is the angle opposite side C.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real ANGLE(3), the angles opposite
%    sides P1-P2, P2-P3 and P3-P1, in radians.
%
  dim_num = 2;
%
%  Compute the length of each side.
%
  a = sqrt ( sum ( ( t(1:dim_num,1) - t(1:dim_num,2) ).^2 ) );
  b = sqrt ( sum ( ( t(1:dim_num,2) - t(1:dim_num,3) ).^2 ) );
  c = sqrt ( sum ( ( t(1:dim_num,3) - t(1:dim_num,1) ).^2 ) );
%
%  Take care of unlikely special cases.
%
  if ( a == 0.0 && b == 0.0 && c == 0.0 )
    angle(1:3) = 2.0 * pi / 3.0;
    return
  end

  if ( c == 0.0 || a == 0.0 )
    angle(1) = pi;
  else
    angle(1) = arc_cosine ( ( c * c + a * a - b * b ) / ( 2.0 * c * a ) );
  end

  if ( a == 0.0 || b == 0.0 )
    angle(2) = pi;
  else
    angle(2) = arc_cosine ( ( a * a + b * b - c * c ) / ( 2.0 * a * b ) );
  end

  if ( b == 0.0 || c == 0.0 )
    angle(3) = pi;
  else
    angle(3) = arc_cosine ( ( b * b + c * c - a * a ) / ( 2.0 * b * c ) );
  end

  return
end
function [ angle_min, angle_min_triangle, angle_max, angle_max_triangle, ...
  value ] = triangulation_delaunay_discrepancy_compute ( node_num, node_xy, ...
  triangle_order, triangle_num, triangle_node, triangle_neighbor )

%*****************************************************************************80
%
%% TRIANGULATION_DELAUNAY_DISCREPANCY_COMPUTE reports if a triangulation is Delaunay.
%
%  Discussion:
%
%    A (maximal) triangulation is Delaunay if and only if it is locally
%    Delaunay.
%
%    A triangulation is Delaunay if the minimum angle over all triangles
%    in the triangulation is maximized.  That is, there is no other
%    triangulation of the points which has a larger minimum angle.
%
%    A triangulation is locally Delaunay if, for every pair of triangles
%    that share an edge, the minimum angle in the two triangles is larger
%    than the minimum angle in the two triangles formed by removing the
%    common edge and joining the two opposing vertices.
%
%    This function examines the question of whether a given triangulation
%    is locally Delaunay.  It does this by looking at every pair of
%    neighboring triangles and comparing the minimum angle attained
%    for the current triangle pair and the alternative triangle pair.
%
%    Let A(i,j) be the minimum angle formed by triangles T(i) and T(j),
%    which are two triangles in the triangulation which share a common edge.
%    Let B(I,J) be the minimum angle formed by triangles S(i) and S(j),
%    where S(i) and S(j) are formed by removing the common edge of T(i)
%    and T(j), and joining the opposing vertices.
%
%    Then the triangulation is Delaunay if B(i,j) <= A(i,j) for every
%    pair of neighbors T(i) and T(j).
%
%    If A(i,j) < B(i,j) for at least one pair of neighbors, the triangulation
%    is not a Delaunay triangulation.
%
%    This program returns VALUE = min ( A(i,j) - B(i,j) ) over all
%    triangle neighbors.  VALUE is scaled to be in degrees, for
%    comprehensibility.  If VALUE is negative, then at least one pair
%    of triangles violates the Delaunay condition, and so the entire
%    triangulation is not a Delaunay triangulation.  If VALUE is nonnegative,
%    then the triangulation is a Delaunay triangulation.
%
%    It is useful to return VALUE, rather than a simple True/False value,
%    because there can be cases where the Delaunay condition is only
%    "slightly" violated.  A simple example is a triangulation formed
%    by starting with a mesh of squares and dividing each square into
%    two triangles by choosing one of the diagonals of the square.
%    The Delaunay discrepancy for this mesh, if computed exactly, is 0,
%    but roundoff could easily result in discrepancies that were very
%    slightly negative.
%
%    If VALUE is positive, and not very small in magnitude, then every
%    pair of triangles in the triangulation satisfies the local Delaunay
%    condition, and so the triangulation is a Delaunay triangulation.
%
%    If VALUE is negative, and not very small in magnitude, then at least
%    one pair of triangles violates the Delaunay condition, and to a
%    significant degree.  The triangulation is not a Delaunay triangulation.
%
%    If the magnitude of VALUE is very close to zero, then the triangulation
%    is numerically ambiguous.  At least one pair of triangles violates
%    or almost violates the condition, but no triangle violates the
%    condition to a great extent.  The user must judge whether the
%    violation is significant or not.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 September 2009
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, integer ( kind = 4 ) NODE_NUM, the number of nodes.
%
%    Input, real ( kind = 8 ) NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Input, integer ( kind = 4 ) TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer ( kind = 4 ) TRIANGLE_NUM, the number of triangles in
%    the triangulation.
%
%    Input, integer ( kind = 4 ) TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM),
%    the nodes that make up each triangle.
%
%    Input, integer ( kind = 4 ) TRIANGLE_NEIGHBOR(3,TRIANGLE_NUM), the
%    triangle neighbor list.
%
%    Output, real ( kind = 8 ) ANGLE_MIN, the minimum angle that occurred in
%    the triangulation.
%
%    Output, integer ( kind = 4 ) ANGLE_MIN_TRIANGLE, the triangle in which
%    the minimum angle occurred.
%
%    Output, real ( kind = 8 ) ANGLE_MAX, the maximum angle that occurred in
%    the triangulation.
%
%    Output, integer ( kind = 4 ) ANGLE_MAX_TRIANGLE, the triangle in which
%    the maximum angle occurred.
%
%    Output, real ( kind = 8 ) VALUE, the minimum value of ( A(i,j) - B(i,j) ).
%    POSITIVE indicates the triangulation is Delaunay.
%    VERY NEAR ZERO is a numerically ambiguous case.
%    NEGATIVE indicates the triangulation is not Delaunay.
%
  angle_max = 0.0;
  angle_max_triangle = - 1;
  angle_min = pi;
  angle_min_triangle = -1;
  value = 0.0;
%
%  Consider triangle TRIANGLE1
%
  for triangle1 = 1 : triangle_num
%
%  Consider the side opposite vertex NEIGHBOR.
%
    for neighbor = 1 : 3

      triangle2 = triangle_neighbor(neighbor,triangle1);
%
%  There might be no neighbor on side NEIGHBOR.
%
      if ( triangle2 < 0 )
        continue
      end
%
%  We only need to check a pair of triangles once.
%
      if ( triangle2 < triangle1 )
        continue
      end
%
%  List the vertices of the quadrilateral in such a way
%  that the nodes of triangle 1 come first.
%
%  We rely on a property of the TRIANGLE_NEIGHBOR array, namely, that
%  neighbor #1 is on the side opposite to vertex #1, and so on.
%
      i1 = i4_wrap ( neighbor + 2, 1, 3 );
      i2 = i4_wrap ( neighbor,     1, 3 );
      i3 = i4_wrap ( neighbor + 1, 1, 3 );

      n1 = triangle_node(i1,triangle1);
      n2 = triangle_node(i2,triangle1);
      n3 = triangle_node(i3,triangle1);
%
%  The "odd" or "opposing" node of the neighboring triangle
%  is the one which follows common node I3.
%
      n4 = -1;
      for i = 1 : 3
        if ( triangle_node(i,triangle2) == n3 )
          i4 = i + 1;
          i4 = i4_wrap ( i4, 1, 3 );
          n4 = triangle_node(i4,triangle2);
          break
        end
      end

      if ( n4 == -1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'TRIANGULATION_DELAUNAY_DISCREPANCY - Fatal error!\n' );
        fprintf ( 1, '  Could not identify the fourth node.\n' );
        fprintf ( 1, '\n' );
        fprintf ( 1, '  Triangle1 = %d\n', triangle1 );
        fprintf ( 1, '  Nodes =     %d  %d  %d\n', triangle_node(1:3,triangle1) );
        fprintf ( 1, '  Neighbors = %d  %d  %d', triangle_neighbor(1:3,triangle1) );
        fprintf ( 1, '\n' );
        fprintf ( 1, '  Neighbor index = %d\n', neighbor );
        fprintf ( 1, '\n' );
        fprintf ( 1, '  Triangle2 = %d\n', triangle2 );
        fprintf ( 1, '  Nodes =     %d  %d  %d', triangle_node(1:3,triangle2) );
        fprintf ( 1, '  Neighbors = %d  %d  %d', triangle_neighbor(1:3,triangle2) );
        error ( 'TRIANGULATION_DELAUNAY_DISCREPANCY - Fatal error!' );
      end
%
%  Compute the minimum angle for (I1,I2,I3) and (I1,I3,I4).
%
      t(1:2,1) = node_xy(1:2,n1);
      t(1:2,2) = node_xy(1:2,n2);
      t(1:2,3) = node_xy(1:2,n3);
      angles1 = triangle_angles_2d ( t );

      t(1:2,1) = node_xy(1:2,n1);
      t(1:2,2) = node_xy(1:2,n3);
      t(1:2,3) = node_xy(1:2,n4);
      angles2 = triangle_angles_2d ( t );

      angle_min1 = min ( min ( angles1 ), min ( angles2 ) );

      if ( angle_max < max ( angles1 ) )
        angle_max = max ( angles1 );
        angle_max_triangle = triangle1;
      end

      if ( angle_max < max ( angles2 ) )
        angle_max = max ( angles2 );
        angle_max_triangle = triangle2;
      end

      if ( min ( angles1 ) < angle_min )
        angle_min = min ( angles1 );
        angle_min_triangle = triangle1;
      end

      if ( min ( angles2 ) < angle_min )
        angle_min = min ( angles2 );
        angle_min_triangle = triangle2;
      end
%
%  Compute the minimum angle for (I1,I2,I4) and (I2,I3,I4).
%
      t(1:2,1) = node_xy(1:2,n1);
      t(1:2,2) = node_xy(1:2,n2);
      t(1:2,3) = node_xy(1:2,n4);
      angles1 = triangle_angles_2d ( t );

      t(1:2,1) = node_xy(1:2,n2);
      t(1:2,2) = node_xy(1:2,n3);
      t(1:2,3) = node_xy(1:2,n4);
      angles2 = triangle_angles_2d ( t );

      angle_min2 = min ( min ( angles1 ), min ( angles2 ) );
%
%  Compare this value to the current minimum.
%
      value = min ( value, angle_min1 - angle_min2 );

    end

  end
%
%  Scale the results to degrees.
%
  value = value * 180.0 / pi;
  angle_max = angle_max * 180.0 / pi;
  angle_min = angle_min * 180.0 / pi;

  return
end
function triangle_neighbor = triangulation_neighbor_triangles ( ...
  triangle_order, triangle_num, triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_NEIGHBOR_TRIANGLES determines triangle neighbors.
%
%  Discussion:
%
%    A triangulation of a set of nodes can be completely described by
%    the coordinates of the nodes, and the list of nodes that make up
%    each triangle.  However, in some cases, it is necessary to know
%    triangle adjacency information, that is, which triangle, if any,
%    is adjacent to a given triangle on a particular side.
%
%    This routine creates a data structure recording this information.
%
%    The primary amount of work occurs in sorting a list of 3 * TRIANGLE_NUM
%    data items.
%
%    This routine was modified to use columns instead of rows.
%
%  Example:
%
%    The input information from TRIANGLE_NODE:
%
%    Triangle   Nodes
%    --------   ---------------
%     1         3      4      1
%     2         3      1      2
%     3         3      2      8
%     4         2      1      5
%     5         8      2     13
%     6         8     13      9
%     7         3      8      9
%     8        13      2      5
%     9         9     13      7
%    10         7     13      5
%    11         6      7      5
%    12         9      7      6
%    13        10      9      6
%    14         6      5     12
%    15        11      6     12
%    16        10      6     11
%
%    The output information in TRIANGLE_NEIGHBOR:
%
%    Triangle  Neighboring Triangles
%    --------  ---------------------
%
%     1        -1     -1      2
%     2         1      4      3
%     3         2      5      7
%     4         2     -1      8
%     5         3      8      6
%     6         5      9      7
%     7         3      6     -1
%     8         5      4     10
%     9         6     10     12
%    10         9      8     11
%    11        12     10     14
%    12         9     11     13
%    13        -1     12     16
%    14        11     -1     15
%    15        16     14     -1
%    16        13     15     -1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM), the nodes that 
%    make up each triangle.
%
%    Output, integer TRIANGLE_NEIGHBOR(3,TRIANGLE_NUM), the three triangles that are direct
%    neighbors of a given triangle.  TRIANGLE_NEIGHBOR(1,I) is the index of the triangle
%    which touches side 1, defined by nodes 2 and 3, and so on.  TRIANGLE_NEIGHBOR(1,I)
%    is negative if there is no neighbor on that side.  In this case, that
%    side of the triangle lies on the boundary of the triangulation.
%

%
%  Step 1.
%  From the list of nodes for triangle T, of the form: (I,J,K)
%  construct the three neighbor relations:
%
%    (I,J,3,T) or (J,I,3,T),
%    (J,K,1,T) or (K,J,1,T),
%    (K,I,2,T) or (I,K,2,T)
%
%  where we choose (I,J,3,T) if I < J, or else (J,I,3,T)
%
  col = zeros ( 4, triangle_order * triangle_num );
  
  for tri = 1 : triangle_num

    i = triangle_node(1,tri);
    j = triangle_node(2,tri);
    k = triangle_node(3,tri);

    if ( i < j )
      col(1:4,1+3*(tri-1)) = [ i, j, 3, tri ]';
    else
      col(1:4,1+3*(tri-1)) = [ j, i, 3, tri ]';
    end

    if ( j < k )
      col(1:4,2+3*(tri-1)) = [ j, k, 1, tri ]';
    else
      col(1:4,2+3*(tri-1)) = [ k, j, 1, tri ]';
    end

    if ( k < i )
      col(1:4,3+3*(tri-1)) = [ k, i, 2, tri ]';
    else
      col(1:4,3+3*(tri-1)) = [ i, k, 2, tri ]';
    end

  end
%
%  Step 2. Perform an ascending dictionary sort on the neighbor relations.
%  We only intend to sort on rows 1 and 2; the routine we call here
%  sorts on rows 1 through 4 but that won't hurt us.
%
%  What we need is to find cases where two triangles share an edge.
%  Say they share an edge defined by the nodes I and J.  Then there are
%  two columns of COL that start out ( I, J, ?, ? ).  By sorting COL,
%  we make sure that these two columns occur consecutively.  That will
%  make it easy to notice that the triangles are neighbors.
%
  col = i4col_sort_a ( 4, 3*triangle_num, col );
%
%  Step 3. Neighboring triangles show up as consecutive columns with
%  identical first two entries.  Whenever you spot this happening,
%  make the appropriate entries in TRIANGLE_NEIGHBOR.
%
  triangle_neighbor(1:3,1:triangle_num) = -1;

  icol = 1;

  while ( 1 )

    if ( 3 * triangle_num <= icol )
      break
    end

    if ( col(1,icol) ~= col(1,icol+1) || col(2,icol) ~= col(2,icol+1) )
      icol = icol + 1;
      continue
    end

    side1 = col(3,icol);
    tri1 =  col(4,icol);
    side2 = col(3,icol+1);
    tri2 =  col(4,icol+1);

    triangle_neighbor(side1,tri1) = tri2;
    triangle_neighbor(side2,tri2) = tri1;

    icol = icol + 2;

  end

  return
end
