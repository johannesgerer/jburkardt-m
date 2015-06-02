function triangle_to_fem ( prefix )

%*****************************************************************************80
%
%% MAIN is the main program for TRIANGLE_TO_FEM.
%
%  Discussion:
%
%    TRIANGLE_TO_FEM converts mesh data from TRIANGLE format to FEM format.
%
%  Usage:
%
%    triangle_to_fem prefix
%
%    where 'prefix' is the common filename prefix:
%
%    * 'prefix'.node contains the triangle node coordinates,
%    * 'prefix'.ele contains the triangle element node connectivity.
%    * 'prefix'_nodes.txt will contain the node coordinates.
%    * 'prefix'_elements.txt will contain the element node connectivity.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 October 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_TO_FEM\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Read a mesh description created by TRIANGLE:\n' );
  fprintf ( 1, '  * "prefix".node, node coordinates.\n' );
  fprintf ( 1, '  * "prefix".ele, element connectivity.\n' );
  fprintf ( 1, '  Write two simple FEM files listing nodes and elements.\n' );
  fprintf ( 1, '  * "prefix"_nodes.txt, node coordinates.\n' );
  fprintf ( 1, '  * "prefix"_elements.txt, element connectivity.\n' );
%
%  Get the filename prefix.
%
  if ( nargin < 1 )

    prefix = input ( 'Enter the filename prefix:  ' );

  end
%
%  Create the filenames.
%
  triangle_node_filename = strcat ( prefix, '.node' );
  triangle_element_filename = strcat ( prefix, '.ele' );
  fem_node_filename = strcat ( prefix, '_nodes.txt' );
  fem_element_filename = strcat ( prefix, '_elements.txt' );
%
%  Read the triangle node size information.
%
  [ node_num, m, node_att_num, node_marker_num ] = node_size_read ( ...
    triangle_node_filename );
%
%  Read the triangle element size information.
%
  [ element_num, element_order, element_att_num ] = element_size_read ( ...
    triangle_element_filename );
%
%  Report sizes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Size information from TRIANGLE files:\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
  fprintf ( 1, '  Number of nodes NODE_NUM = %d\n', node_num );
  fprintf ( 1, '  NODE_ATT_NUM = %d\n', node_att_num );
  fprintf ( 1, '  NODE_MARKER_NUM = %d\n', node_marker_num );
  fprintf ( 1, '  Number of elements ELEMENT_NUM = %d\n', element_num );
  fprintf ( 1, '  Element order ELEMENT_ORDER = %d\n', element_order );
  fprintf ( 1, '  ELEMENT_ATT_NUM = %d\n', element_att_num );
%
%  Read data.
%
  [ node_x, node_att, node_marker ] = node_data_read ( ...
    triangle_node_filename, node_num, m, node_att_num, node_marker_num );

  [ element_node, element_att ] = element_data_read ( ...
    triangle_element_filename, element_num, element_order, element_att_num );
%
%  Write data.
%
  r8mat_write ( fem_node_filename, m, node_num, node_x );

  i4mat_write ( fem_element_filename, element_order, element_num, ...
    element_node );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_TO_FEM:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ element_node, element_att ] = element_data_read ( ...
  element_filename, element_num, element_order, element_att_num )

%*****************************************************************************80
%
%% ELEMENT_DATA_READ reads the data from an element file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ELEMENT_FILENAME, the name of the file.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer ELEMENT_ATT_NUM, number of element attributes 
%    listed on each node record.
%
%    Output, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), 
%    the indices of the nodes that make up each element.
%
%    Output, real ELEMENT_ATT(ELEMENT_ATT_NUM,ELEMENT_NUM), the 
%    attributes of each element.
%
  element = 0;

  input = fopen ( element_filename, 'rt' );

  if ( input < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ELEMENT_DATA_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'ELEMENT_DATA_READ - Fatal error!' );
  end
%
%  Create format.
%
  format = '%d';
  for i = 1 : element_order
    format = strcat ( format, '%d' );
  end
  for i = 1 : element_att_num
    format = strcat ( format, '%g' );
  end
%
%  Create arrays.
%
  element_node = zeros ( element_order, element_num );
  element_att = zeros ( element_att_num, element_num );
%
%  Read values and place in the arrays.
%
  while ( 1 )

    text = fgets ( input );

    if ( text == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ELEMENT_DATA_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'ELEMENT_DATA_READ - Fatal error!' );
    end

    if ( s_len_trim ( text ) == 0 )
      continue
    end

    if ( text(1) == '#' )
      continue
    end
%
%  Ignore the dimension line.
%
    if ( element == 0 )

    else

      [ value, count ] = sscanf ( text, format );

      if ( count < 1 + element_order + element_att_num )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'ELEMENT_DATA_READ - Fatal error!\n' );
        fprintf ( 1, '  Line did not have enough data.\n' );
        error ( 'ELEMENT_DATA_READ - Fatal error!' );
      end

      j = 1;

      for i = 1 : element_order
        j = j + 1;
        element_node(i,element) = value(j);
      end

      for i = 1 : element_att_num
        element_att(i,element) = value(j);
      end

    end

    element = element + 1;

    if ( element_num < element )
      break
    end

  end

  fclose ( input );

  return
end
function [ element_num, element_order, element_att_num ] = ...
  element_size_read ( element_filename )

%*****************************************************************************80
%
%% ELEMENT_SIZE_READ reads the header information from an element file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ELEMENT_FILENAME, the name of the 
%    element file.
%
%    Output, integer ELEMENT_NUM, the number of elements.
%
%    Output, integer ELEMENT_ORDER, the order of the elements.
%
%    Output, integer ELEMENT_ATT_NUM, the number of 
%    element attributes.
%
  input = fopen ( element_filename, 'rt' );

  if ( input < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ELEMENT_SIZE_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'ELEMENT_SIZE_READ - Fatal error!' );
  end

  while ( 1 )

    text = fgets ( input );

    if ( text == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ELEMENT_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'ELEMENT_SIZE_READ - Fatal error!' );
    end

    if ( s_len_trim ( text ) == 0 )
      continue
    end

    if ( text(1) == '#' )
      continue
    end

    [ value, count ] = sscanf ( text, '%d%d%d%d' );

    if ( count < 3 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ELEMENT_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Header line did not have 3 value integers.\n' );
      error ( 'ELEMENT_SIZE_READ - Fatal error!' );
    end

    element_num = value(1);
    element_order = value(2);
    element_att_num = value(3);

    break

  end

  fclose ( input );

  return
end
function i4mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% I4MAT_WRITE writes an I4MAT file.
%
%  Discussion:
%
%    An I4MAT is an array of I4's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2010
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
      fprintf ( output_unit, '  %d', round ( table(i,j) ) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function [ node_coord, node_att, node_marker ] = node_data_read ( ...
  node_filename, node_num, node_dim, node_att_num, node_marker_num )

%*****************************************************************************80
%
%% NODE_DATA_READ reads the data from a node file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2014
%
%  Author:
%
%    John Burkardt
%
% Parameters:
%
%   Input, string NODE_FILENAME, the name of the node file.
%
%   Input, integer NODE_NUM, the number of nodes.
%
%   Input, integer NODE_DIM, the spatial dimension.
%
%   Input, integer NODE_ATT_NUM, number of node attributes 
%   listed on each node record.
%
%   Input, integer NODE_MARKER_NUM, 1 if every node record 
%   includes a final boundary marker value.
%
%   Output, real NODE_COORD(NODE_DIM,NODE_NUM), the nodal 
%   coordinates.
%
%   Output, real NODE_ATT(NODE_ATT_NUM,NODE_NUM), the nodal 
%   attributes.
%
%   Output, integer NODE_MARKER(NODE_MARKER_NUM,NODE_NUM), the 
%   node markers.
%
  node = 0;

  input = fopen ( node_filename, 'rt' );

  if ( input < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NODE_DATA_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'NODE_DATA_READ - Fatal error!' );
  end
%
%  Create format.
%
  format = '%d';
  for i = 1 : node_dim
    format = strcat ( format, '%g' );
  end
  for i = 1 : node_att_num
    format = strcat ( format, '%g' );
  end
  for i = 1 : node_marker_num
    format = strcat ( format, '%d' );
  end
%
%  Create arrays.
%
  node_coord = zeros ( node_dim, node_num );
  node_att = zeros ( node_att_num, node_num );
  node_marker = zeros ( node_marker_num, node_num );
%
%  Read values and place in the arrays.
%
  while ( 1 )

    text = fgets ( input );

    if ( text == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'NODE_DATA_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'NODE_DATA_READ - Fatal error!' );
    end

    if ( s_len_trim ( text ) == 0 )
      continue
    end

    if ( text(1) == '#' )
      continue
    end
%
%  Ignore the dimension line.
%
    if ( node == 0 )

    else

      [ value, count ] = sscanf ( text, format );

      if ( count < 1 + node_dim + node_att_num + node_marker_num )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'NODE_DATA_READ - Fatal error!\n' );
        fprintf ( 1, '  Line did not have enough data.\n' );
        error ( 'NODE_DATA_READ - Fatal error!' );
      end

      j = 1;

      for i = 1 : node_dim
        j = j + 1;
        node_coord(i,node) = value(j);
      end

      for i = 1 : node_att_num
        j = j + 1;
        node_att(i,node) = value(j);
      end

      for i = 1 : node_marker_num
        j = j + 1;
        node_marker(i,node) = value(j);
      end

    end

    node = node + 1;

    if ( node_num < node )
      break
    end

  end

  fclose ( input );

  return
end
function [ node_num, node_dim, node_att_num, node_marker_num ] = ...
  node_size_read ( node_filename )

%*****************************************************************************80
%
%% NODE_SIZE_READ reads the header information from a node file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_FILENAME, the name of the node file.
%
%    Output, integer NODE_NUM, the number of nodes.
%
%    Output, integer NODE_DIM, the spatial dimension.
%
%    Output, integer NODE_ATT_NUM, number of node attributes 
%    listed on each node record.
%
%    Output, integer NODE_MARKER_NUM, 1 if every node record 
%    includes a final boundary marker value.
%
  input = fopen ( node_filename, 'rt' );

  if ( input < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NODE_SIZE_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'NODE_SIZE_READ - Fatal error!' );
  end

  while ( 1 )

    text = fgets ( input );

    if ( text == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'NODE_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'NODE_SIZE_READ - Fatal error!' );
    end

    if ( s_len_trim ( text ) == 0 )
      continue
    end

    if ( text(1) == '#' )
      continue
    end

    [ value, count ] = sscanf ( text, '%d%d%d%d' );

    if ( count < 4 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'NODE_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Header line did not have 4 value integers.\n' );
      error ( 'NODE_SIZE_READ - Fatal error!' );
    end

    node_num = value(1);
    node_dim = value(2);
    node_att_num = value(3);
    node_marker_num = value(4);

    break

  end

  fclose ( input );

  return
end
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2010
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
%  Alternative print statements include:
%
%     fprintf ( output_unit, '  %24.16e', table(i,j) );
%     fprintf ( output_unit, '  %14.6e', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %g', table(i,j) );
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
