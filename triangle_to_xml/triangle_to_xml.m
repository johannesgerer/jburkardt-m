function triangle_to_xml ( prefix )

%*****************************************************************************80
%
%% MAIN is the main program for TRIANGLE_TO_XML.
%
%  Discussion:
%
%    TRIANGLE_TO_XML converts mesh data from TRIANGLE format to XML format.
%
%  Usage:
%
%    triangle_to_xml prefix
%
%    where 'prefix' is the common filename prefix:
%
%    * 'prefix'.node contains the triangle node coordinates,
%    * 'prefix'.ele contains the triangle element node connectivity.
%    * 'prefix.xml will contain the XML mesh file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 October 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_TO_XML\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Read a mesh description created by TRIANGLE:\n' );
  fprintf ( 1, '  * "prefix".node, node coordinates.\n' );
  fprintf ( 1, '  * "prefix".ele, element connectivity.\n' );
  fprintf ( 1, '  Write a corresponding XML mesh file.\n' );
  fprintf ( 1, '  * "prefix".xml.\n' );
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
  xml_filename = strcat ( prefix, '.xml' );
%
%  Read the triangle node size information.
%
  [ node_num, m, node_att_num, node_marker_num ] = triangle_node_size_read ( ...
    triangle_node_filename );
%
%  Read the triangle element size information.
%
  [ element_num, element_order, element_att_num ] = triangle_element_size_read ( ...
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
%  Read TRIANGLE data.
%
  [ node_x, node_att, node_marker ] = triangle_node_data_read ( ...
    triangle_node_filename, node_num, m, node_att_num, node_marker_num );

  [ element_node, element_att ] = triangle_element_data_read ( ...
    triangle_element_filename, element_num, element_order, element_att_num );
%
%  Write XML data.
%
  xml_mesh2d_write ( xml_filename, m, node_num, node_x, ...
    element_order, element_num, element_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved XML mesh in file "%s"\n', xml_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_TO_XML:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function element_node = mesh_base_zero ( node_num, element_order, ...
  element_num, element_node )

%*****************************************************************************80
%
%% MESH_BASE_ZERO ensures that the element definition is zero-based.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 May 2013
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
    fprintf ( 1, 'MESH_BASE_ZERO:\n' );
    fprintf ( 1, '  The element indexing appears to be 0-based!\n' );
    fprintf ( 1, '  No conversion is necessary.\n' );
  elseif ( node_min == 1 && node_max == node_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_BASE_ZERO:\n' );
    fprintf ( 1, '  The element indexing appears to be 1-based!\n' );
    fprintf ( 1, '  This will be converted to 0-based.\n' );
    element_node(1:element_order,1:element_num) = ...
      element_node(1:element_order,1:element_num) - 1;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_BASE_ZERO - Warning!\n' );
    fprintf ( 1, '  The element indexing is not of a recognized type.\n' );
    fprintf ( 1, '  NODE_MIN = %d\n', node_min );
    fprintf ( 1, '  NODE_MAX = %d\n', node_max );
    fprintf ( 1, '  NODE_NUM = %d\n', node_num );
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
function [ element_node, element_att ] = triangle_element_data_read ( ...
  element_filename, element_num, element_order, element_att_num )

%*****************************************************************************80
%
%% TRIANGLE_ELEMENT_DATA_READ reads the data from an element file.
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
    fprintf ( 1, 'TRIANGLE_ELEMENT_DATA_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'TRIANGLE_ELEMENT_DATA_READ - Fatal error!' );
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
      fprintf ( 1, 'TRIANGLE_ELEMENT_DATA_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'TRIANGLE_ELEMENT_DATA_READ - Fatal error!' );
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
        fprintf ( 1, 'TRIANGLE_ELEMENT_DATA_READ - Fatal error!\n' );
        fprintf ( 1, '  Line did not have enough data.\n' );
        error ( 'TRIANGLE_ELEMENT_DATA_READ - Fatal error!' );
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
  triangle_element_size_read ( element_filename )

%*****************************************************************************80
%
%% TRIANGLE_ELEMENT_SIZE_READ reads the header information from an element file.
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
    fprintf ( 1, 'TRIANGLE_ELEMENT_SIZE_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'TRIANGLE_ELEMENT_SIZE_READ - Fatal error!' );
  end

  while ( 1 )

    text = fgets ( input );

    if ( text == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TRIANGLE_ELEMENT_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'TRIANGLE_ELEMENT_SIZE_READ - Fatal error!' );
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
      fprintf ( 1, 'TRIANGLE_ELEMENT_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Header line did not have 3 value integers.\n' );
      error ( 'TRIANGLE_ELEMENT_SIZE_READ - Fatal error!' );
    end

    element_num = value(1);
    element_order = value(2);
    element_att_num = value(3);

    break

  end

  fclose ( input );

  return
end
function [ node_coord, node_att, node_marker ] = triangle_node_data_read ( ...
  node_filename, node_num, node_dim, node_att_num, node_marker_num )

%*****************************************************************************80
%
%% TRIANGLE_NODE_DATA_READ reads the data from a node file.
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
    fprintf ( 1, 'TRIANGLE_NODE_DATA_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'TRIANGLE_NODE_DATA_READ - Fatal error!' );
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
      fprintf ( 1, 'TRIANGLE_NODE_DATA_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'TRIANGLE_NODE_DATA_READ - Fatal error!' );
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
        fprintf ( 1, 'TRIANGLE_NODE_DATA_READ - Fatal error!\n' );
        fprintf ( 1, '  Line did not have enough data.\n' );
        error ( 'TRIANGLE_NODE_DATA_READ - Fatal error!' );
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
  triangle_node_size_read ( node_filename )

%*****************************************************************************80
%
%% TRIANGLE_NODE_SIZE_READ reads the header information from a node file.
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
    fprintf ( 1, 'TRIANGLE_NODE_SIZE_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'TRIANGLE_NODE_SIZE_READ - Fatal error!' );
  end

  while ( 1 )

    text = fgets ( input );

    if ( text == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TRIANGLE_NODE_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'TRIANGLE_NODE_SIZE_READ - Fatal error!' );
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
      fprintf ( 1, 'TRIANGLE_NODE_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Header line did not have 4 value integers.\n' );
      error ( 'TRIANGLE_NODE_SIZE_READ - Fatal error!' );
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
function xml_mesh2d_write ( xml_filename, m, node_num, node_x, ...
  element_order, element_num, element_node )

%*****************************************************************************80
%
%% XML_MESH2D_WRITE writes a 2D mesh as a DOLFIN XML file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 June 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Anders Logg, Kent-Andre Mardal, Garth Wells,
%    Automated Solution of Differential Equations by the Finite Element
%    Method: The FEniCS Book,
%    Lecture Notes in Computational Science and Engineering,
%    Springer, 2011,
%    ISBN13: 978-3642230981
%
%  Parameters:
%
%    Input, string XML_FILENAME, the name of the DOLFIN XML file to create.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_X(M,NODE_NUM), the node coordinates.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), the nodes
%    that make up each element.
%

%
%  Enforce 0-based indexing.
%
  element_node = mesh_base_zero ( node_num, element_order, element_num, ...
    element_node );
%
%  Open the file.
%
  xml = fopen ( xml_filename, 'wt' );

  if ( xml < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XML_MESH2D_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'XML_MESH2D_WRITE - Error!' );
  end
%
%  Write the data.
%
  fprintf ( xml, '<?xml version="1.0" encoding="UTF-8"?>\n' );
  fprintf ( xml, '\n' );
  fprintf ( xml, '<dolfin xmlns:dolfin="http://www.fenics.org/dolfin/">\n' );
  fprintf ( xml, '  <mesh celltype="triangle" dim="2">\n' );

  fprintf ( xml, '    <vertices size="%d">\n', node_num );
  for node = 1 : node_num
    fprintf ( xml, '      <vertex index ="%d" x ="%g" y ="%g"/>\n', ...
      node - 1, node_x(1:m,node) );
  end
  fprintf ( xml, '    </vertices>\n' );

  fprintf ( xml, '    <cells size="%d">\n', element_num );
  for element = 1 : element_num
    fprintf ( xml, ...
      '      <triangle index ="%d" v0 ="%d" v1 ="%d" v2 ="%d"/>\n', ...
      element - 1, element_node(1:3,element) );
  end
  fprintf ( xml, '    </cells>\n' );
  fprintf ( xml, '  </mesh>\n' );
  fprintf ( xml, '</dolfin>\n' );

  fclose ( xml );

  return
end
