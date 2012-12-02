function [ dim_num, node_num, element_num, element_order, node_data_num, ...
  node_coord, element_node, node_data ] = fem_read ( node_coord_file_name, ...
  element_file_name, node_data_file_name )

%*****************************************************************************80
%
%% FEM_READ reads data files associated with a finite element solution.
%
%  Discussion:
%
%    This program reads the node, element and data files that define
%    a finite element geometry and data based on that geometry:
%    * a set of nodes, 
%    * a set of elements based on those nodes, 
%    * a set of data values associated with each node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_COORD_FILE_NAME, the name of the node coordinate
%    file.  If this argument is not supplied, it will be requested.  
%
%    Input, string ELEMENT_FILE_NAME, the name of the element file.  If
%    this argument is not supplied, it will be requested.  If the interactive
%    response is blank, then the program will assume that no element information
%    is to be supplied.  (But the node coordinates must be available and may 
%    be plotted.  And if a node data file is supplied, then the data can be 
%    plotted against the node coordinates without using any finite element 
%    structure.)
%
%    Input, string NODE_DATA_FILE_NAME, the name of the node data file.  If
%    this argument is not supplied, it will be requested.  If the interactive
%    response is blank, then the program will assume that no node data information
%    is to be supplied.  (But the node coordinates will be available and may be 
%    plotted.  And if an element file is supplied, then the elements can also 
%    be displayed.)
%
%    Output, integer DIM_NUM, the spatial dimension, inferred from the
%    "shape" of the data in the node file.
%
%    Output, integer NODE_NUM, the number of nodes, inferred from the 
%    number of lines of data in the node coordinate file.
%
%    Output, integer ELEMENT_NUM, the number of elements, inferred from the
%    number of lines of data in the element file.
%
%    Output, integer ELEMENT_ORDER, the order of the elements, inferred from
%    the number of items in the first line of the element file.
%
%    Output, integer NODE_DATA_NUM, the number of data items per node,
%    inferred from the number of items in the first line of the node data file.
%
%    Output, real NODE_COORD(DIM_NUM,NODE_NUM), the coordinates of nodes.
%
%    Output, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM); 
%    the global index of local node I in element J.
%
%    Output, real NODE_DATA(NODE_DATA_NUM,NODE_NUM), the data values associated
%    with each node.
%

%
%  Get the file names, if not specified on command line.
%
  if ( nargin < 1 )
    node_coord_file_name = [];
  end

  if ( nargin < 2 )
    element_file_name = [];
  end

  if ( nargin < 3 )
    node_data_file_name = [];
  end

  [ node_coord_file_name, element_file_name, node_data_file_name ] = ...
    file_name_specification ( node_coord_file_name, element_file_name, ...
    node_data_file_name );

  if ( isempty ( node_coord_file_name ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  No node coordinate file name was supplied!\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  NO ELEMENT OR NODE DATA WILL BE READ!\n' );
    return;
  end

  if ( isempty ( element_file_name ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  No element file name was supplied.\n' );
    fprintf ( 1, '  Therefore, no element data will be returned.\n' );
  end

  if ( isempty ( node_data_file_name ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  No node data file name was supplied!\n' );
    fprintf ( 1, '  Therefore, no node data will be returned.\n' );
  end
%
%  Read the node coordinate file.
%
  [ dim_num, node_num ] = r8mat_header_read ( node_coord_file_name );

  if ( ~isempty ( element_file_name ) )
    [ element_order, element_num ] = i4mat_header_read ( element_file_name );
  else
    element_order = 0;
    element_num = 0;
  end

  if ( ~isempty ( node_data_file_name ) )

    [ node_data_num, node_num2 ] = r8mat_header_read ( node_data_file_name );

    if ( node_num2 ~= node_num )
      fprintf ( 1, '\n' );
      fprintf ( 1, ...
        '  The number of nodes in the node coordinate file is %d.\n', ...
        node_num );
      fprintf ( 1, ...
        '  but the number in the node data file is %d\n', node_num2 );
      fprintf ( 1, '  Because of this, no node data will be stored.\n' );
      node_data_num = 0;
    end

  else
    node_data_num = 0;
  end

  node_coord = r8mat_data_read ( node_coord_file_name, dim_num, node_num );

  element_node = i4mat_data_read ( element_file_name, element_order, ...
    element_num );

  if ( 0 < node_data_num )
    node_data = r8mat_data_read ( node_data_file_name, node_data_num, ...
      node_num );
  else
    node_data = [];
  end

  return
end
