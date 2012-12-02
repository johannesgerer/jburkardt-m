function tri_surface_to_stla ( node_file_name, triangle_file_name, stla_file_name )

%*****************************************************************************80
%
%% TRI_SURFACE_TO_STLA converts a TRI_SURFACE file to an ASCII STL file.
%
%  Usage:
%
%    tri_surface_to_stla ( 'node_filename', 'element_filename', 'stla_filename' )
%
%    where
%
%    'node_filename' is the name of the TRI_SURFACE node file;
%    'element_filename' is the name of the TRI_SURFACE element file;
%    'stla_filename' is the name of the ASCII STL file to be created.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_FILE_NAME, the TRI_SURFACE node file to be read.
%
%    Input, string TRIANGLE_FILE_NAME, the  TRI_SURFACE triangle file to be read.
%
%    Input, string STLA_FILE_NAME, the ASCII STL file to be written.
%
  timestamp ( );
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
%  Compute the normal vectors.
%
  triangle_normal = stla_face_normal_compute ( node_num, triangle_num, ...
    node_xyz, triangle_node );
%
%  Write the data to the STLA file.
%
  stla_write ( stla_file_name, node_num, triangle_num, node_xyz, ...
    triangle_node, triangle_normal );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  STLA data written to "%s".\n', stla_file_name );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRI_SURFACE_TO_STLA:\n' );
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
function v3 = r8vec_cross_3d ( v1, v2 )

%*****************************************************************************80
%
%% R8VEC_CROSS_3D computes the cross product of two R8VEC's in 3D.
%
%  Discussion:
%
%    The cross product in 3D can be regarded as the determinant of the
%    symbolic matrix:
%
%          |  i  j  k |
%      det | x1 y1 z1 |
%          | x2 y2 z2 |
%
%      = ( y1 * z2 - z1 * y2 ) * i
%      + ( z1 * x2 - x1 * z2 ) * j
%      + ( x1 * y2 - y1 * x2 ) * k
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real V1(3), V2(3), the two vectors.
%
%    Output, real V3(3), the cross product vector.
%
  v3(1) = v1(2) * v2(3) - v1(3) * v2(2);
  v3(2) = v1(3) * v2(1) - v1(1) * v2(3);
  v3(3) = v1(1) * v2(2) - v1(2) * v2(1);

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
function face_normal = stla_face_normal_compute ( node_num, face_num, ...
  node_xyz, face_node )

%*****************************************************************************80
%
%% STLA_FACE_NORMAL_COMPUTE computes normal vectors for an ASCII StereoLithography file.
%
%  Discussion:
%
%    This routine computes the normal vector to each triangular face
%    in the STLA solid.  If the nodes of each triangular face are
%    listed in counterclockwise order (as seen from outside the solid),
%    then the normal vectors will be properly outward facing.
%
%    The normal vectors will have unit Euclidean norm.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    3D Systems, Inc,
%    Stereolithography Interface Specification,
%    October 1989.
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the node coordinates.
%
%    Input, integer FACE_NODE(3,FACE_NUM), the nodes making faces.
%
%    Input, integer FACE_MAX, the maximum number of faces.
%
%    Output, real FACE_NORMAL(3,FACE_NUM), the normal vector at each face.
%
  face_normal = zeros ( 3, face_num );
  
  for face = 1 : face_num

    n1 = face_node(1,face);
    n2 = face_node(2,face);
    n3 = face_node(3,face);

    v1(1:3) = node_xyz(1:3,n2) - node_xyz(1:3,n1);
    v2(1:3) = node_xyz(1:3,n3) - node_xyz(1:3,n1);

    face_normal(1:3,face) = r8vec_cross_3d ( v1, v2 );

    norm = sqrt ( sum ( ( face_normal(1:3,face) ).^2 ) );

    if ( norm ~= 0.0 )
      face_normal(1:3,face) = face_normal(1:3,face) / norm;
    end

  end

  return
end
function stla_write ( output_file_name, node_num, face_num, node_xyz, ...
  face_node, face_normal )

%*****************************************************************************80
%
%% STLA_WRITE writes graphics information to an ASCII StereoLithography file.
%
%  Example:
%
%    solid MYSOLID
%      facet normal 0.4 0.4 0.2
%        outerloop
%          vertex  1.0 2.1 3.2
%          vertex  2.1 3.7 4.5
%          vertex  3.1 4.5 6.7
%        end loop
%      end facet
%      ...
%      facet normal 0.2 0.2 0.4
%        outerloop
%          vertex  2.0 2.3 3.4
%          vertex  3.1 3.2 6.5
%          vertex  4.1 5.5 9.0
%        end loop
%      end facet
%    end solid MYSOLID
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    3D Systems, Inc,
%    Stereolithography Interface Specification,
%    October 1989.
%
%  Parameters:
%
%    Input, string OUTPUT_FILE_NAME, the name of the output file.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the node coordinates.
%
%    Input, integer FACE_NODE(3,FACE_NUM), the nodes making faces.
%
%    Input, integer FACE_MAX, the maximum number of faces.
%
%    Input, real FACE_NORMAL(3,FACE_NUM), the normal vector at each face.
%
  text_num = 0;
%
%  Open the file.
%
  iunit = fopen ( output_file_name, 'wt' );

  if ( iunit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STLA_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', output_file_name );
    error ( 'STLA_WRITE - Fatal error!' );
  end

  fprintf ( iunit, 'solid MYSOLID\n' );
  text_num = text_num + 1;

  for face = 1 : face_num

    fprintf ( iunit, '  facet normal  %14f  %14f  %14f\n', ...
      face_normal(1:3,face) );
    text_num = text_num + 1;

    fprintf ( iunit, '    outer loop\n' );
    text_num = text_num + 1;

    for vertex = 1 : 3

      node = face_node(vertex,face);

      fprintf ( iunit, '      vertex    %14f  %14f  %14f\n', ...
        node_xyz(1:3,node) );
      text_num = text_num + 1;

    end

    fprintf ( iunit, '    end loop\n' );
    text_num = text_num + 1;
    fprintf ( iunit, '  end facet\n' );
    text_num = text_num + 1;

  end

  fprintf ( iunit, 'end solid MYSOLID\n' );

  fclose ( iunit );

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
function [ node_xyz, triangle_node ] = tri_surface_read ( node_file_name, ...
  triangle_file_name, dim_num, node_num, order_num, triangle_num )

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
  [ dim_num, node_num ] = r8mat_header_read ( node_file_name );

  if ( dim_num < 2 || 3 < dim_num ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_SURFACE_SIZE - Warning!\n' );
    fprintf ( 1, '  The spatial dimension DIM_NUM = %d\n', dim_num );
    fprintf ( 1, '  This seems an unlikely value.\n' );
  end

  [ order_num, triangle_num ] = i4mat_header_read ( triangle_file_name );
 
  if ( order_num ~= 3 && order_num ~= 6 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_SURFACE_SIZE - Fatal error!\n' );
    fprintf ( 1, '  The "order" of the triangles seems to be %d\n', order_num );
    fprintf ( 1, '  Only the values 3 and 6 are acceptable.\n' );
    error ( 'TRI_SURFACE_SIZE - Fatal error!\n' );
  end

  return
end
