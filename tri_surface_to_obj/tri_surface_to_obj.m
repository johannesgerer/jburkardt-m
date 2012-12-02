function tri_surface_to_stla ( node_file_name, triangle_file_name, obj_file_name )

%*****************************************************************************80
%
%% TRI_SURFACE_TO_OBJ transfers 3D graphics from a TRI_SURFACE file to an OBJ file.
%
%  Usage:
%
%    tri_surface_to_obj ( 'node_file', 'element_file', 'obj_file' )
%
%    where
%
%    'node_file' lists the coordinates of nodes;
%    'element_file' lists the indices of nodes forming elements;
%    'obj_file' is the name of the OBJ file to be created.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_FILE_NAME, the name of the TRI_SURFACE node file to be read.
%
%    Input, string TRIANGLE_FILE_NAME, the name of the TRI_SURFACE triangle 
%    file to be read.
%
%    Input, string OBJ_FILE_NAME, the name of the OBJ file to be written.
%

%
%  Get the size of the TRI_SURFACE data.
%
  [ dim_num, node_num, order_num, triangle_num ] = tri_surface_size ( ...
    node_file_name, triangle_file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  TRI_SURFACE data:\n' );
  fprintf ( 1, '  node file     "%s".\n', node_file_name );
  fprintf ( 1, '  triangle_file "%s".\n', triangle_file_name );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension   = %d\n', dim_num );
  fprintf ( 1, '  Number of nodes     = %d\n', node_num );
  fprintf ( 1, '  Triangle order      = %d\n', order_num );
  fprintf ( 1, '  Number of triangles = %d\n', triangle_num );
%
%  Read the TRI_SURFACE data.
%
  [ node_xyz, triangle_node ] = tri_surface_read ( node_file_name, ...
    triangle_file_name, dim_num, node_num, order_num, triangle_num );
%
%  Rename some things.
%
  face_num = triangle_num;
  order_max = 3;
  face_order(1:face_num) = 3;
%
%  Compute the normal vectors...OK, we'll leave that til later!
%
  normal_num = 0;
  normal_value = [];
  normal_index = [];
%
%  Write the data to the OBJ file.
%
  obj_write ( obj_file_name, node_num, face_num, normal_num, ...
    order_max, node_xyz, face_order, triangle_node, normal_value, normal_index )

  fprintf ( 1, '\n' );
  fprintf ( 1, '  OBJ data written to "%s".\n', obj_file_name );

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
    column_num = -1;
    return;
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
    row_num = -1;
    return;
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
  table = [];
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
    return;
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
function obj_write ( output_file_name, node_num, face_num, normal_num, ...
  order_max, node_xyz, face_order, face_node, normal_vector, vertex_normal )

%*****************************************************************************80
%
%% OBJ_WRITE writes graphics information to an Alias OBJ file.
%
%  Discussion:
%
%    If no normal vectors are supplied (NORMAL_NUM <= 0) then
%    a simple format is used for the "F" records.  Otherwise,
%    the "v//vn" format is used.
%
%  Example:
%
%    #  no_normals.obj
%
%    g Group002
%
%    v -3.269770 -39.572201 0.876128
%    v -3.263720 -39.507999 2.160890
%    ...
%    v 0.000000 -9.988540 0.000000
%
%    f 8 9 11 10
%    f 12 13 15 14
%    ...
%    f 788 806 774
%
%    #  normals_supplied.obj
%
%    g Group001
%
%    v -3.269770 -39.572201 0.876128
%    v -3.263720 -39.507999 2.160890
%    ...
%    v 0.000000 -9.988540 0.000000
%
%    vn 0.0 1.0 0.0
%    vn 1.0 0.0 0.0
%    ...
%    vn 0.0 0.0 1.0
%
%    f 8//1 9//2 11//3 10//4
%    f 12//5 13//6 15//7 14//8
%    ...
%    f 788//800 806//803 774//807
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILE_NAME, the name of the output file.
%
%    Input, integer NODE_NUM, the number of points.
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, integer NORMAL_NUM, the number of normal vectors.
%
%    Input, integer ORDER_MAX, the maximum number of vertices per face.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the coordinates of points.
%
%    Input, integer FACE_ORDER(FACE_NUM), the number of vertices per face.
%
%    Input, integer FACE_NODE(ORDER_MAX,FACE_NUM), the nodes making faces.
%
%    Input, real NORMAL_VECTOR(3,NORMAL_NUM), normal vectors.
%
%    Input, integer VERTEX_NORMAL(ORDER_MAX,FACE_NUM), the indices of normal
%    vectors per vertex.
%
  output_file_unit = fopen ( output_file_name, 'wt' );

  if ( output_file_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'OBJ_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file "%s".\n', ...
      output_file_name );
    return
  end

  text_num = 0;

  fprintf ( output_file_unit, '# %s\n', output_file_name );
  fprintf ( output_file_unit, '#  created by OBJ_WRITE.\n' );
  fprintf ( output_file_unit, '\n' );
  fprintf ( output_file_unit, 'g Group001\n' );

  text_num = text_num + 4;
%
%  V: vertex coordinates.
%  For some reason, a fourth "coordinate" may be recommended.
%  What is its meaning?
%
  if ( 0 < node_num )
    fprintf ( output_file_unit, '\n' );
    text_num = text_num + 1;
  end

  w = 1.0;
  for node = 1 : node_num
    fprintf ( output_file_unit, 'v  %f  %f  %f  %f\n',  node_xyz(1:3,node), w );
    text_num = text_num + 1;
  end
%
%  VN: normal vectors.
%
  if ( 0 < normal_num )

    fprintf ( output_file_unit, '\n' );
    text_num = text_num + 1;

    for normal = 1 : normal_num
      fprintf ( output_file_unit, 'vn  %f  %f  %f\n', normal_vector(1:3,normal) );
      text_num = text_num + 1;
    end

  end
%
%  F: Faces, specified as a list of triples, one triple for each vertex:
%    vertex index/vertex texture index/vertex normal index
%
  if ( 0 < face_num )
    fprintf ( output_file_unit, '\n' );
    text_num = text_num + 1;
  end

  for face = 1 : face_num

    text = 'f';

    if ( normal_num <= 0 )

      for vertex = 1 : face_order(face)
        fprintf ( output_file_unit, '  %d', face_node(vertex,face) );
      end
      fprintf ( output_file_unit, '\n' );
      text_num = text_num + 1;

    else

      for vertex = 1 : face_order(face)
        fprintf ( output_file_unit, '  %d//%d', ...
          face_node(vertex,face), vertex_normal(vertex,face) );
      end
      fprintf ( output_file_unit, '\n' );
      text_num = text_num + 1;

    end

  end

  fclose ( output_file_unit );
%
%  Report.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'OBJ_WRITE:\n' );
  fprintf ( 1, '  Wrote %d text lines to "%s".\n', ...
    text_num, output_file_name );

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
  table = [];
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
    return;
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
function [ node_xyz, triangle_node ] = tri_surface_read ( node_file_name, ...
  triangle_file_name, dim_num, node_num, order_num, triangle_num )

%*****************************************************************************80
%
%% TRI_SURFACE_READ reads graphics information from a pair of TRI_SURFACE files.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_FILE_NAME, the name of the node file.
%
%    Input, string TRIANGLE_FILE_NAME, the name of the triangle file.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer NODE_NUM, the number of points.
%
%    Input, integer ORDER_NUM, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Output, real NODE_XYZ(DIM_NUM,NODE_NUM), the node coordinates.
%
%    Output, integer TRIANGLE_NODE(ORDER_NUM,TRIANGLE_NUM), 
%    the nodes that form the triangles.
%
  node_xyz = zeros ( dim_num, node_num );
  triangle_node = zeros ( order_num, triangle_num );

  node_xyz = r8mat_data_read ( node_file_name, dim_num, node_num );

  triangle_node = i4mat_data_read ( triangle_file_name, order_num, ...
    triangle_num );

  return
end
function [ dim_num, node_num, order_num, triangle_num ] = tri_surface_size ( ...
  node_file_name, triangle_file_name )

%*****************************************************************************80
%
%% TRI_SURFACE_SIZE determines the size of a TRI_SURFACE object.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_FILE_NAME, the name of the node file.
%
%    Input, string TRIANGLE_FILE_NAME, the name of the triangle file.
%
%    Output, integer DIM_NUM, the spatial dimension.
%
%    Output, integer NODE_NUM, the number of nodes.
%
%    Output, integer ORDER_NUM, the order of the triangles.
%
%    Output, integer TRIANGLE_NUM, the number of triangles.
%
  dim_num = -1;
  node_num = -1;
  triangle_num = -1;

  [ dim_num, node_num ] = r8mat_header_read ( node_file_name );

  if ( dim_num < 2 | 3 < dim_num ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_SURFACE_SIZE - Warning!\n' );
    fprintf ( 1, '  The spatial dimension DIM_NUM = %d\n', dim_num );
    fprintf ( 1, '  This seems an unlikely value.\n' );
  end

  [ order_num, triangle_num ] = i4mat_header_read ( triangle_file_name );
 
  if ( order_num ~= 3 & order_num ~= 6 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_SURFACE_SIZE - Fatal error!\n' );
    fprintf ( 1, '  The "order" of the triangles seems to be %d\n', order_num );
    fprintf ( 1, '  Only the values 3 and 6 are acceptable.\n' );
    error ( 'TRI_SURFACE_SIZE - Fatal error!\n' );
  end

  return
end
