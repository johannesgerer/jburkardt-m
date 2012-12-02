function stla_to_tri_surface_fast ( stla_file_name, node_file_name, ...
  triangle_file_name )

%*****************************************************************************80
%
%% STLA_TO_TRI_SURFACE_FAST converts an ASCII STL file to a TRI_SURFACE file.
%
%  Discussion:
%
%    This function makes use of the "fast" routines STLA_SIZE_FAST and
%    STLA_READ_FAST, which may be much faster when reading large files.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string STLA_FILE_NAME, the name of the ASCII STL file to be read.
%
%    Input, string NODE_FILE_NAME, the name of the TRI_SURFACE node file to 
%    be written.
%
%    Input, string TRIANGLE_FILE_NAME, the name of the TRI_SURFACE triangle 
%    file to be written.
%

%
%  Get the size of the STLA data.
%
  [ solid_num, node_num, triangle_num, text_num ] = stla_size_fast ( stla_file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  STLA file "%s".\n', stla_file_name );
  fprintf ( 1, '  Number of solids   = %d\n', solid_num );
  fprintf ( 1, '  Number of nodes    = %d\n', node_num );
  fprintf ( 1, '  Number of faces    = %d\n', triangle_num );
  fprintf ( 1, '  Number of textures = %d\n', text_num );
%
%  Read the STLA data.
%
  [ node_xyz, triangle_node, triangle_normal ] = stla_read_fast ( stla_file_name, ...
    node_num, triangle_num );
%
%  Write the data to the TRI_SURFACE files.
%
  dim_num = size ( node_xyz, 1 );
  order_num = 3;

  tri_surface_write ( node_file_name, triangle_file_name, dim_num, node_num, ...
    order_num, triangle_num, node_xyz, triangle_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  TRI_SURFACE data written to:\n' );
  fprintf ( 1, '  node file     "%s".\n', node_file_name );
  fprintf ( 1, '  triangle_file "%s".\n', triangle_file_name );

  return
end
function i4mat_write0 ( output_filename, m, n, table )

%*****************************************************************************80
%
%% I4MAT_WRITE0 writes an I4MAT file with no header.
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
    fprintf ( 1, 'I4MAT_WRITE0 - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'I4MAT_WRITE0 - Error!' );
    return;
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
function r8mat_write0 ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE0 writes an R8MAT file with no header.
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
    fprintf ( 1, 'R8MAT_WRITE0 - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE0 - Error!' );
    return;
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
function [ node_xyz, face_node, face_normal ] = stla_read_fast ( ...
  input_file_name, node_num, face_num )

%*****************************************************************************80
%
%% STLA_READ_FAST reads graphics information from an ASCII StereoLithography file.
%
%  Discussion:
%
%    This routine should be faster than STLA_READ, since it does little
%    error checking, and uses native MATLAB commands like SSCANF to 
%    read the data directly.
%
%  Modified:
%
%    16 February 2007
%
%  Author:
%
%    Bill Seufzer,
%    NASA Langley
%
%  Reference:
%
%    3D Systems, Inc,
%    Stereolithography Interface Specification,
%    October 1989.
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
%    Input, integer NODE_NUM, the number of vertices defined.
%
%    Input, integer FACE_NUM, the number of faces defined.
%
%    Output, real NODE_XYZ(3,NODE_NUM), the coordinates of points.
%
%    Output, integer FACE_NODE(3,FACE_NUM), the nodes that make up each face.
%
%    Output, real FACE_NORMAL(3,FACE_NUM), the normal vector
%    at each face.
% 
  node_xyz = [];
  face_node = [];
  face_normal = [];
%
%  If no file input, try to get one from the user.
%
  if ( nargin < 1 )
    input_file_name = input ( 'Enter the name of the ASCII STL file.' );
    if ( isempty ( input_file_name ) )
      return
    end
  end
%
%  If no size input, scan the file.
%
  if ( nargin < 3 )
    [ solid_num, node_num, face_num, text_num ] = stla_size_fast ( ...
      input_file_name );  
  end
%
%  Open the file.
%
  input_file_unit = fopen ( input_file_name, 'r' );
  
  if ( input_file_unit < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STLA_READ_FAST - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'STLA_READ_FAST - Fatal error!' )
    return
  end
%
%  Allocate space.
%
  solid = 0;
  node = 0;
  face = 0;

  node_xyz = zeros(3,node_num);
  face_node = zeros(3,face_num);
  face_normal = zeros(3,face_num);
%
%  Read the text, one line at a time.
%
  while ( 1 )

    text = fgetl ( input_file_unit );
%
%  On end of input, FGETL returns a -1 instead of a character array.
%
    if ( ~ischar ( text ) )
      break
    end
%    
%  Left justify the string (no initial blanks).
%  Lowercase the string.
%
    text = lower ( strjust ( text, 'left' ) );
%
%  Locate the first word by finding the indices of the whitespace characters.
%
    blanks = find ( isspace ( text ) == 1 );

    if ( isempty ( blanks ) )
      word1 = text;
    else
      word1 = text(1:blanks(1)-1);
    end
%
%  Action depends on initial keyword.
%
    switch word1

       case 'solid'

         solid = solid + 1;

       case 'facet'

         face = face + 1;
         face_normal(:,face) = sscanf ( text, '%*s %*s %f %f %f' );

       case 'vertex'

         node = node + 1;
         node_xyz(:,node) = sscanf ( text, '%*s %f %f %f' );

       case 'endloop'

         face_node(:,face) = [ node-2; node-1; node ];
            
       otherwise

     end

  end
%
%  Close the file.
%
  fclose ( input_file_unit );

  return
end
function [ solid_num, node_num, face_num, text_num ] = stla_size_fast ( ...
  input_file_name )

%*****************************************************************************80
%
%% STLA_SIZE_FAST determines sizes associated with an STLA file.
%
%  Discussion:
%
%    This routine assumes that the file is a legal STLA file.
%
%    To perform checks on the file, call STLA_CHECK first.
%
%    Note that the counts for the number of nodes and edges are
%    overestimates, since presumably, most nodes will be defined several
%    times, once for each face they are part of, and most edges will
%    be defined twice.
%
%  Modified:
%
%    16 February 2007
%
%  Author:
%
%    Bill Seufzer,
%    NASA, Langley
%
%  Reference:
%
%    3D Systems, Inc,
%    Stereolithography Interface Specification,
%    October 1989.
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
%    Output, integer SOLID_NUM, the number of solids defined.
%    Presumably, this is 1.
%
%    Output, integer NODE_NUM, the number of vertices defined.
%
%    Output, integer FACE_NUM, the number of faces defined.
%
%    Output, integer TEXT_NUM, the number of lines of text.
%
  solid_num = -1;
  node_num = -1;
  face_num = -1;
  text_num = -1;
%
%  If no file input, try to get one from the user.
%
  if ( nargin < 1 )
    input_file_name = input ( 'Enter the name of the ASCII STL file.' );
    if ( isempty ( input_file_name ) )
      return
    end
  end

  input_file_unit = fopen ( input_file_name, 'r' );
  
  if ( input_file_unit < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STLA_SIZE_FAST - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'STLA_SIZE_FAST - Fatal error!' )
    return
  end

  solid_num = 0;
  node_num = 0;
  face_num = 0;
  text_num = 0;
%
%  Read the text, one line at a time.
%
  while ( 1 )

    text = fgetl ( input_file_unit );
%
%  On end of input, FGETL returns a -1 instead of a character array.
%
    if ( ~ischar ( text ) )
      break
    end

    text_num = text_num + 1;
%    
%  Left justify the string (no initial blanks).
%  Lowercase the string.
%
    text = lower ( strjust ( text, 'left' ) );
%
%  Locate the first word by finding the indices of the whitespace characters.
%
    blanks = find ( isspace ( text ) == 1 );
%
%  If there are no blanks, the first word is the whole string.
%  Otherwise, the first word is the string before the first blank.
%
    if ( isempty ( blanks ) )
      word1 = text;
    else
      word1 = text(1:blanks(1)-1);
    end
%
%  Count occurrences of "SOLID", "FACET" or "VERTEX".  
%
    switch word1

      case 'solid'
        solid_num = solid_num + 1;
      case 'facet'
        face_num = face_num + 1;
      case 'vertex'
        node_num = node_num + 1;
      otherwise
      
    end
    
  end
%
%  Close the file.
%
  fclose ( input_file_unit );

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
function tri_surface_write ( node_file_name, triangle_file_name, dim_num, ...
  node_num, order_num, triangle_num, node_xyz, triangle_node )

%*****************************************************************************80
%
%% TRI_SURFACE_WRITE writes graphics information to a pair of TRI_SURFACE files.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 August 2009
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
%    Input, real NODE_XYZ(DIM_NUM,NODE_NUM), the node coordinates.
%
%    Input, integer TRIANGLE_NODE(ORDER_NUM,TRIANGLE_NUM), 
%    the nodes that form the triangles.
%
  r8mat_write0 ( node_file_name, dim_num, node_num, node_xyz );

  i4mat_write0 ( triangle_file_name, order_num, triangle_num, ...
    triangle_node );

  return
end
