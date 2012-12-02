function tet_mesh_boundary ( prefix )

%*****************************************************************************80
%
%% TET_MESH_BOUNDARY determines the boundary of a tet mesh.
%
%  Discussion:
%
%    TET_MESH_BOUNDARY reads files defining a tetrahedral mesh, and
%    creates new files that define the 3D triangular mesh formed
%    by the boundary of the tetrahedral mesh.
%
%  Usage:
%
%    tet_mesh_boundary ( 'prefix' )
%
%    where
%
%    * 'prefix'_nodes.txt contains nodal coordinates;
%    * 'prefix'_elements.txt contains the element definitions;
%    * 'prefix'_boundary_node_mask.txt is 0 for interior nodes,
%       1 for boundary nodes;
%    * 'prefix'_boundary_nodes.txt will contain the boundary nodes;
%    * 'prefix'_boundary_elements.txt will contain the boundary elements (faces).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 December 2010
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
  fprintf ( 1, 'TET_MESH_BOUNDARY:\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Read files defining a tet mesh dataset.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determine the faces that form the boundary\n' );
  fprintf ( 1, '  write a boundary node mask file,\n' );
  fprintf ( 1, '  write a boundary node file,\n' );
  fprintf ( 1, '  and a boundary element file,\n' );
  fprintf ( 1, '  which define the boundary as a TRI_SURFACE.\n' );
%
%  Argument 1 is the common file prefix.
%
  if ( 1 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TET_MESH_BOUNDARY:\n' );
    prefix = input ( '  Please enter the filename prefix:' );

  end
%
%  Create the filenames.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
  boundary_node_mask_filename = strcat ( prefix, '_boundary_node_mask.txt' );
  boundary_node_filename = strcat ( prefix, '_boundary_nodes.txt' );
  boundary_element_filename = strcat ( prefix, '_boundary_elements.txt' );
%
%  Read the nodes.
%
  [ dim_num, node_num ] = r8mat_header_read ( node_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', node_filename );

  if ( dim_num ~= 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TET_MESH_BOUNDARY - Fatal error!\n' );
    fprintf ( 1, '  Data is not for 3-dimensional space.\n' );
    error ( 'TET_MESH_BOUNDARY - Fatal error!' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM  = %d\n', dim_num );
  fprintf ( 1, '  Number of points NODE_NUM = %d\n', node_num );

  node_xyz = r8mat_data_read ( node_filename, dim_num, node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', node_filename );

  r8mat_transpose_print_some ( dim_num, node_num, node_xyz, ...
    1, 1, dim_num, 5, '  First 5 nodes:' );
%
%  Read the elements.
%
  [ element_order, element_num ] = i4mat_header_read ( element_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', element_filename );
  fprintf ( 1, '  Element order = %d\n', element_order );
  fprintf ( 1, '  Number of elements = %d\n', element_num );

  if ( element_order ~= 4 && element_order ~= 10 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TET_MESH_BOUNDARY - Fatal error!\n' );
    fprintf ( 1, '  This program can only handle 4 or 10 node elements.\n' );
    error ( 'TET_MESH_BOUNDARY - Fatal error!' );
  end

  element_node = i4mat_data_read ( element_filename, element_order, ...
    element_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', element_filename );

  i4mat_transpose_print_some ( element_order, element_num, ...
    element_node, 1, 1, element_order, 5, '  First 5 elements:' );
%
%  Detect and correct 0-based indexing.
%
  element_node = mesh_base_one ( node_num, element_order, element_num, ...
    element_node );
%
%  Count the boundary faces and nodes.
%
  [ boundary_node_num, boundary_element_num, boundary_node_mask ] = ...
    tet_mesh_boundary_count ( element_order, element_num, element_node, ...
    node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of faces is %d\n', 4 * element_num );
  fprintf ( 1, '  Number of boundary faces is %d\n', boundary_element_num );
  fprintf ( 1, '  Number of boundary nodes is %d\n', boundary_node_num );
%
%  Set the boundary nodes and write them out.
%
  boundary_node_xyz = zeros ( dim_num, boundary_node_num );

  j2 = 0;
  for j = 1 : node_num
    if ( boundary_node_mask(j) == 1 )
      j2 = j2 + 1;
      boundary_node_xyz(1:3,j2) = node_xyz(1:3,j);
    end
  end

  r8mat_write ( boundary_node_filename, dim_num, boundary_node_num, ...
    boundary_node_xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the boundary node coordinates to "%s".\n', ...
    boundary_node_filename );
%
%  Write the boundary node mask data.
%
  i4mat_write ( boundary_node_mask_filename, 1, node_num, boundary_node_mask );

  fprintf ( 1, '  Wrote the boundary node mask to "%s".\n', ...
    boundary_node_mask_filename );
%
%  Compute the reduced indices for the boundary nodes.
%
  boundary_node_index = i4vec_cum ( node_num, boundary_node_mask );
%
%  Set the boundary faces, apply the reduced index labels, and write them out.
%
  if ( element_order == 4 )
    boundary_element_order = 3;
  elseif ( element_order == 10 )
    boundary_element_order = 6;
  end

  boundary_element_node = tet_mesh_boundary_set ( element_order, element_num, ...
    element_node, boundary_element_order, boundary_element_num );

  boundary_element_node(1:boundary_element_order,1:boundary_element_num) = ...
    boundary_node_index ( boundary_element_node(1:boundary_element_order,1:boundary_element_num) );

  i4mat_write ( boundary_element_filename, boundary_element_order, ...
    boundary_element_num, boundary_element_node );

  fprintf ( 1, '  Wrote the boundary face coordinates to "%s".\n', ...
    boundary_element_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TET_MESH_BOUNDARY:\n' );
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
function [ j1, j2, j3 ] = i4i4i4_sort_a ( i1, i2, i3 )

%*****************************************************************************80
%
%% I4I4I4_SORT_A ascending sorts a triple of integers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I1, I2, I3, the values to sort.
%
%    Output, integer J1, J2, J3, the sorted values.
%
  j1 = min ( min ( i1, i2 ), min ( i2, i3 ) );
  j2 = min ( max ( i1, i2 ), ...
       min ( max ( i2, i3 ), max ( i3, i1 ) ) );
  j3 = max ( max ( i1, i2 ), max ( i2, i3 ) );

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
    error ( 'I4MAT_WRITE0 - Error!' );
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
function a_cum = i4vec_cum ( n, a )

%*****************************************************************************80
%
%% I4VEC_CUM computes the cumulutive sum of the entries of an I4VEC.
%
%  Example:
%
%    Input:
%
%      A = (/ 1, 2, 3, 4 /)
%
%    Output:
%
%      A_CUM = (/ 1, 3, 6, 10 /)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer A(N), the vector to be summed.
%
%    Output, integer A_CUM(N), the cumulative sum of the entries of A.
%
  a_cum(1) = a(1);

  for i = 2 : n
    a_cum(i) = a_cum(i-1) + a(i);
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
function [ boundary_node_num, boundary_element_num, boundary_node_mask ] = ...
  tet_mesh_boundary_count ( element_order, element_num, element_node, node_num )

%*****************************************************************************80
%
%% TET_MESH_BOUNDARY_COUNT counts boundary faces and nodes in a tet mesh.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 December 2010
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
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), the
%    nodes that make up each element.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Output, integer BOUNDARY_NODE_NUM, the number of boundary nodes.
%
%    Output, integer BOUNDARY_ELEMENT_NUM, the number of boundary faces.
%
%    Output, integer BOUNDARY_NODE_MASK(NODE_NUM), is 0 for
%    interior nodes, 1 for boundary nodes.
%
  faces = zeros ( 5, 4 * element_num );
%
%  Step 1.
%  From the list of nodes forming tetrahedron T, of the form: 
%
%    (I,J,K,L)
%
%  or
%
%    (I,J,K,L,I+J,I+K,I+L,J+K,J+L,K+L),
%    (1,2,3,4, 5,  6,  7,  8,  9, 10 ),
%
%  construct the four face relations:
%
%    F = 1: (J,K,L,F,T)
%    F = 2: (I,K,L,F,T)
%    F = 3: (I,J,L,F,T)
%    F = 4: (I,J,K,F,T)
%
%  If T is actually order 10, we can retrieve the indices of the midside
%  nodes from the values of F and T.  In that case, the 4 faces are:
%
%    F = 1: 2, 3, 4, 8, 10, 9
%    F = 2: 1, 3, 4, 6, 10, 7
%    F = 3: 1, 2, 4, 5,  9, 7
%    F = 4: 1, 2, 3, 5,  8, 6
%
%  In order to make matching easier, we reorder each triple of nodes
%  into ascending order.
%
  for element = 1 : element_num

    i = element_node(1,element);
    j = element_node(2,element);
    k = element_node(3,element);
    l = element_node(4,element);

    [ a, b, c ] = i4i4i4_sort_a ( j, k, l );

    faces(1:5,4*(element-1)+1) = [ a, b, c, 1, element ]';

    [ a, b, c ] = i4i4i4_sort_a ( i, k, l );

    faces(1:5,4*(element-1)+2) = [ a, b, c, 2, element ]';

    [ a, b, c ] = i4i4i4_sort_a ( i, j, l );

    faces(1:5,4*(element-1)+3) = [ a, b, c, 3, element ]';

    [ a, b, c ] = i4i4i4_sort_a ( i, j, k );

    faces(1:5,4*(element-1)+4) = [ a, b, c, 4, element ]';

  end
%
%  Step 2. Perform an ascending dictionary sort on the neighbor relations.
%  We only intend to sort on rows 1:3; the routine we call here
%  sorts on rows 1 through 5 but that won't hurt us.
%
%  What we need is to find cases where two tetrahedrons share a face.
%  By sorting the columns of the FACES array, we will put shared faces
%  next to each other.
%
  faces = sortrows ( faces' )';
%
%  Step 3. Neighboring faces show up as consecutive columns with
%  identical first three entries.  Count columns which don't have
%  a following column that matches the first three entries.
%
  boundary_element_num = 0;
  face = 1;

  boundary_node_mask(1:node_num) = 0;

  while ( face <= 4 * element_num )

    if ( face < 4 * element_num )

      if ( all ( faces(1:3,face) == faces(1:3,face+1) ) )
        face = face + 2;
        continue
      end

    end

    boundary_element_num = boundary_element_num + 1;
%
%  The vertices of the triangle are boundary nodes.
%
    boundary_node_mask(faces(1:3,face)) = 1;
%
%  For quadratic tetrahedrons, we need to add three more side nodes.
%  We retrieve the face index by F = FACES(4,*).
%  We can determine the local indices from the value of F.
%  We can determine the global indices from ELEMENT_NODE.
%
    if ( element_order == 10 )

      f = faces(4,face);
      element = faces(5,face);

      if ( f == 1 )
        boundary_node_mask(element_node(8,element)) = 1;
        boundary_node_mask(element_node(10,element)) = 1;
        boundary_node_mask(element_node(9,element)) = 1;
      elseif ( f == 2 )
        boundary_node_mask(element_node(6,element)) = 1;
        boundary_node_mask(element_node(10,element)) = 1;
        boundary_node_mask(element_node(7,element)) = 1;
      elseif ( f == 3 )
        boundary_node_mask(element_node(5,element)) = 1;
        boundary_node_mask(element_node(9,element)) = 1;
        boundary_node_mask(element_node(7,element)) = 1;
      elseif ( f == 4 )
        boundary_node_mask(element_node(5,element)) = 1;
        boundary_node_mask(element_node(8,element)) = 1;
        boundary_node_mask(element_node(6,element)) = 1;
      end

    end

    face = face + 1;

  end

  boundary_node_num = sum ( boundary_node_mask(1:node_num) );

  return
end
function boundary_element_node = tet_mesh_boundary_set ( element_order, ...
  element_num, element_node, boundary_element_order, boundary_element_num, ...
  boundary_element_node )

%*****************************************************************************80
%
%% TET_MESH_BOUNDARY_SET sets the boundary faces in a tet mesh.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 December 2010
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
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), the
%    nodes that make up each element.
%
%    Input, integer BOUNDARY_ELEMENT_ORDER, the order of the boundary faces.
%
%    Input, integer BOUNDARY_ELEMENT_NUM, the number of boundary faces.
%
%    Output, integer 
%    BOUNDARY_ELEMENT_NODE(BOUNDARY_ELEMENT_ORDER,BOUNDARY_ELEMENT_NUM),
%    the nodes that make up each boundary face.
%
  faces = zeros ( 5, 4 * element_num );
%
%  Step 1.
%  From the list of nodes forming tetrahedron T, of the form: 
%
%    (I,J,K,L)
%
%  or
%
%    (I,J,K,L,I+J,I+K,I+L,J+K,J+L,K+L),
%    (1,2,3,4, 5,  6,  7,  8,  9, 10 ),
%
%  construct the four face relations:
%
%    F = 1: (J,K,L,F,T)
%    F = 2: (I,K,L,F,T)
%    F = 3: (I,J,L,F,T)
%    F = 4: (I,J,K,F,T)
%
%  If T is actually order 10, we can retrieve the indices of the midside
%  nodes from the values of F and T.  In that case, the 4 faces are:
%
%    F = 1: 2, 3, 4, 8, 10, 9
%    F = 2: 1, 3, 4, 6, 10, 7
%    F = 3: 1, 2, 4, 5,  9, 7
%    F = 4: 1, 2, 3, 5,  8, 6
%
%  In order to make matching easier, we reorder each triple of nodes
%  into ascending order.
%
  for element = 1 : element_num

    i = element_node(1,element);
    j = element_node(2,element);
    k = element_node(3,element);
    l = element_node(4,element);

    [ a, b, c ] = i4i4i4_sort_a ( j, k, l );

    faces(1:5,4*(element-1)+1) = [ a, b, c, 1, element ]';

    [ a, b, c ] = i4i4i4_sort_a ( i, k, l );

    faces(1:5,4*(element-1)+2) = [ a, b, c, 2, element ]';

    [ a, b, c ] = i4i4i4_sort_a ( i, j, l );

    faces(1:5,4*(element-1)+3) = [ a, b, c, 3, element ]';

    [ a, b, c ] = i4i4i4_sort_a ( i, j, k );

    faces(1:5,4*(element-1)+4) = [ a, b, c, 4, element ]';

  end
%
%  Step 2. Perform an ascending dictionary sort on the neighbor relations.
%  We only intend to sort on rows 1:3; the routine we call here
%  sorts on rows 1 through 5 but that won't hurt us.
%
%  What we need is to find cases where two tetrahedrons share a face.
%  By sorting the columns of the FACES array, we will put shared faces
%  next to each other.
%
  faces = sortrows ( faces' )';
%
%  Step 3. Neighboring faces show up as consecutive columns with
%  identical first three entries.  Count columns which don't have
%  a following column that matches the first three entries.
%
  boundary_element = 0;
  face = 1;

  boundary_element_node = zeros ( boundary_element_order, boundary_element_num );

  while ( face <= 4 * element_num )

    if ( face < 4 * element_num )

      if ( all ( faces(1:3,face) == faces(1:3,face+1) ) )
        face = face + 2;
        continue
      end

    end

    boundary_element = boundary_element + 1;

    f = faces(4,face);
    element = faces(5,face);

    if ( f == 1 )
      boundary_element_node(1,boundary_element) = element_node(2,element);
      boundary_element_node(2,boundary_element) = element_node(3,element);
      boundary_element_node(3,boundary_element) = element_node(4,element);
    elseif ( f == 2 )
      boundary_element_node(1,boundary_element) = element_node(1,element);
      boundary_element_node(2,boundary_element) = element_node(3,element);
      boundary_element_node(3,boundary_element) = element_node(4,element);
    elseif ( f == 3 )
      boundary_element_node(1,boundary_element) = element_node(1,element);
      boundary_element_node(2,boundary_element) = element_node(2,element);
      boundary_element_node(3,boundary_element) = element_node(4,element);
    elseif ( f == 4 )
      boundary_element_node(1,boundary_element) = element_node(1,element);
      boundary_element_node(2,boundary_element) = element_node(2,element);
      boundary_element_node(3,boundary_element) = element_node(3,element);
    end
%
%  For quadratic tetrahedrons, we need to add three more side nodes.
%
    if ( element_order == 10 )

      if ( f == 1 )
        boundary_element_node(4,boundary_element) = element_node(8,element);
        boundary_element_node(5,boundary_element) = element_node(10,element);
        boundary_element_node(6,boundary_element) = element_node(9,element);
      elseif ( f == 2 )
        boundary_element_node(4,boundary_element) = element_node(6,element);
        boundary_element_node(5,boundary_element) = element_node(10,element);
        boundary_element_node(6,boundary_element) = element_node(7,element);
      elseif ( f == 3 )
        boundary_element_node(4,boundary_element) = element_node(5,element);
        boundary_element_node(5,boundary_element) = element_node(9,element);
        boundary_element_node(6,boundary_element) = element_node(7,element);
      elseif ( f == 4 )
        boundary_element_node(4,boundary_element) = element_node(5,element);
        boundary_element_node(5,boundary_element) = element_node(8,element);
        boundary_element_node(6,boundary_element) = element_node(6,element);
      end

    end

    face = face + 1;

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
