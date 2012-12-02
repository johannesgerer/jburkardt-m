function triangulation_corner ( prefix )

%*****************************************************************************80
%
%% MAIN is the main program for TRIANGULATION_CORNER
%
%  Discussion:
%
%    TRIANGULATION_CORNER tries to alter a triangular mesh in
%    cases where two sides of a triangle lie on the boundary.
%
%    The program reads the node and triangle data, computes the triangle
%    neighbor information, and writes it to a file.
%
%  Usage:
%
%    triangulation_corner ( 'prefix' )
%
%    where 'prefix' is the common filename prefix:
%
%    * 'prefix'_nodes.txt contains the node coordinates,
%    * 'prefix'_elements.txt contains the element definitions.
%    * 'prefix'_corner_nodes.txt will contain the revised node coordinates,
%    * 'prefix'_corner_elements.txt will contain the revised element definitions.
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
  fprintf ( 1, 'TRIANGULATION_CORNER\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read a node dataset of NODE_NUM points in 2 dimensions.\n' );
  fprintf ( 1, '  Read an associated triangle file of TRIANGLE_NUM \n' );
  fprintf ( 1, '  triangles using 3 or 6 nodes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Any triangle which has exactly two sides on the boundary\n' );
  fprintf ( 1, '  is a corner triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  If there are any corner triangles this program tries to\n' );
  fprintf ( 1, '  eliminate them.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1,'  The "repaired" triangle file is written out.\n' );
%
%  The command line argument is the common filename prefix.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_CORNER:\n' );

    prefix = input ( ...
      'Please enter the filename prefix:' );

  end
%
%  Create the filenames.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
  node_corner_filename = strcat ( prefix, '_corner_nodes.txt' );
  element_corner_filename = strcat ( prefix, '_corner_elements.txt' );
%
%  Read the node data.
%
  [ dim_num, node_num ] = r8mat_header_read (  node_filename );

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
    fprintf ( 1, 'TRIANGULATION_CORNER - Fatal error!\n' );
    fprintf ( 1, '  Data is not for a 3-node or 6-node triangulation.\n' );
    error ( 'TRIANGULATION_L2Q - Fatal error!' );
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
  triangle_neighbor = triangulation_order3_neighbor_triangles ( ...
    triangle_order, triangle_num, triangle_node );

%  Examine the triangle neighbor array.
%
  OFFSET = 1;
  negative_total(OFFSET+0:OFFSET+3) = 0;

  for triangle = 1 : triangle_num

    negative = 0;
    for neighbor = 1 : 3
      if ( triangle_neighbor(neighbor,triangle) < 0 )
        negative = negative + 1;
      end
    end

    negative_total(OFFSET+negative) = negative_total(OFFSET+negative) + 1;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of boundary sides     Number of triangles\n' );
  fprintf ( 1, '\n' );
  for i = 0 : 3
    fprintf ( 1, '            %8d            %8d\n', i, negative_total(OFFSET+i) );
  end
%
%  Try to patch problems.
%
  if ( 0 < negative_total(OFFSET+3) )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_CORNER - Fatal error!\n' );
    fprintf ( 1, '  There is at least one triangle with all sides\n' );
    fprintf ( 1, '  on the boundary.\n' );
    return

  elseif ( 0 == negative_total(OFFSET+2) )

    fprintf ( 1,  '\n' );
    fprintf ( 1,  'TRIANGULATION_CORNER:\n' );
    fprintf ( 1,  '  No corner triangles were found.\n' );
    fprintf ( 1,  '  No corrections need to be made.\n' );
    return

  else
%
%  We need the triangles to be oriented properly.
%
    negative = 0;

    for triangle = 1 : triangle_num

      t3(1:2,1:3) = node_xy(1:2,triangle_node(1:3,triangle));

      area = triangle_area_2d ( t3 );

      if ( area < 0.0 )

        negative = negative + 1;

        node                      = triangle_node(2,triangle);
        triangle_node(2,triangle) = triangle_node(3,triangle);
        triangle_node(3,triangle) = node;

        if ( triangle_order == 6 )
          node                      = triangle_node(4,triangle);
          triangle_node(4,triangle) = triangle_node(6,triangle);
          triangle_node(6,triangle) = node;
        end

        neighbor                      = triangle_neighbor(1,triangle);
        triangle_neighbor(1,triangle) = triangle_neighbor(3,triangle);
        triangle_neighbor(3,triangle) = neighbor;

      end

    end

    if ( 0 < negative )
      fprintf ( 1,  '\n' );
      fprintf ( 1, 'TRIANGULATION_CORNER:\n' );
      fprintf ( 1, '  Reoriented %d triangles.', negative );
      fprintf ( 1,  '\n' );
    else
      fprintf ( 1,  '\n' );
      fprintf ( 1, 'TRIANGULATION_CORNER:\n' );
      fprintf ( 1, '  Triangles were already properly oriented.\n' );
      fprintf ( 1,  '\n' );
    end
%
%  Now consider each triangle that has exactly two boundary sides.
%
    for triangle1 = 1 : triangle_num 

      negative = 0;
      for neighbor = 1 : 3
        if ( triangle_neighbor(neighbor,triangle1) < 0 )
          negative = negative + 1;
        end
      end

     if ( negative == 2 )

       triangle2 = -1;

       for neighbor = 1 : 3
         if ( 0 < triangle_neighbor(neighbor,triangle1) )
           triangle2 = triangle_neighbor(neighbor,triangle1);
           t1_to_t2 = neighbor;
         end
       end

       fprintf ( 1, '  Adjusting triangle %d using triangle %d\n', ...
         triangle1, triangle2 );

       t2_to_t1 = -1;
       for neighbor = 1 : 3
         if ( triangle_neighbor(neighbor,triangle2) == triangle1 )
           t2_to_t1 = neighbor;
         end
       end

       n1_index = i4_wrap ( t1_to_t2 - 1, 1, 3 );
       node = triangle_node(n1_index,triangle1);

       n1_index = i4_wrap ( t1_to_t2 + 1, 1, 3 );
       n2_index = i4_wrap ( t2_to_t1 - 1, 1, 3 );
       triangle_node(n1_index,triangle1) = triangle_node(n2_index,triangle2);

       n2_index = i4_wrap ( t2_to_t1 + 1, 1, 3 );
       triangle_node(n2_index,triangle2) = node;

       if ( triangle_order == 6 )
%
%  Adjust coordinates of the new midside node.
%
         j1 = i4_wrap ( t1_to_t2 - 1, 1, 3 );
         j2 = i4_wrap ( t1_to_t2 + 3, 4, 6 );
         j3 = i4_wrap ( t2_to_t1 - 1, 1, 3 );

         node1 = triangle_node(j1,triangle1);
         node2 = triangle_node(j2,triangle1);
         node3 = triangle_node(j3,triangle2);

         node_xy(1,node2) = 0.5D+00 * ( node_xy(1,node1) + node_xy(1,node3) );
         node_xy(2,node2) = 0.5D+00 * ( node_xy(2,node1) + node_xy(2,node3) );
%
%  Update the triangle array.
%
         j1 = i4_wrap ( t1_to_t2 + 4, 4, 6 );
         j2 = i4_wrap ( t1_to_t2 + 3, 4, 6 );
         j3 = i4_wrap ( t2_to_t1 + 4, 4, 6 );
         j4 = i4_wrap ( t2_to_t1 + 3, 4, 6 );

         node                        = triangle_node(j1,triangle1);
         triangle_node(j1,triangle1) = triangle_node(j2,triangle1);
         triangle_node(j2,triangle1) = triangle_node(j3,triangle2);
         triangle_node(j3,triangle2) = triangle_node(j4,triangle2);
         triangle_node(j4,triangle2) = node;

       end
%
%  Update the neighbor array.
%
       n2_index = i4_wrap ( t2_to_t1 + 1, 1, 3 );
       triangle = triangle_neighbor(n2_index,triangle2);
       triangle_neighbor(n2_index,triangle2) = triangle1;
       triangle_neighbor(t2_to_t1,triangle2) = -1;

       n1_index = i4_wrap ( t1_to_t2 + 1, 1, 3 );
       triangle_neighbor(n1_index,triangle1) = triangle2;
       triangle_neighbor(t1_to_t2,triangle1) = triangle;

     end

    end
%
%  Write out the corrected triangle file.
%
    i4mat_write ( element_corner_filename, triangle_order, triangle_num, ...
      triangle_node );

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_CORNER:\n' );
    fprintf ( 1, '  New triangle file with repaired corners written to \n' );
    fprintf ( 1, '  "%s".\n', element_corner_filename );
%
%  Write out the corrected node coordinate file.
%
    r8mat_write ( node_corner_filename, dim_num, node_num, node_xy );

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_CORNER:\n' );
    fprintf ( 1, '  New node coordinate file with adjusted midside nodes\n' );
    fprintf ( 1, '  written to "%s".\n', node_corner_filename );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_CORNER\n' );
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
%  Discussion:
%
%    If the triangle's vertices are given in counterclockwise order,
%    the area will be positive.  If the triangle's vertices are given
%    in clockwise order, the area will be negative!
%
%    An earlier version of this routine always returned the absolute
%    value of the computed area.  I am convinced now that that is
%    a less useful result!  For instance, by returning the signed 
%    area of a triangle, it is possible to easily compute the area 
%    of a nonconvex polygon as the sum of the (possibly negative) 
%    areas of triangles formed by node 1 and successive pairs of vertices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real AREA, the area of the triangle.
%
  area = 0.5 * ( ...
      t(1,1) * ( t(2,2) - t(2,3) ) ...
    + t(1,2) * ( t(2,3) - t(2,1) ) ...
    + t(1,3) * ( t(2,1) - t(2,2) ) );


  return
end

