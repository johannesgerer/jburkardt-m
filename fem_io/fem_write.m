function fem_write ( node_coord_file_name, element_file_name, ...
  node_data_file_name, dim_num, node_num, element_num, element_order, ...
  node_data_num, node_coord, element_node, node_data )

%*****************************************************************************80
%
%% FEM_WRITE writes data files associated with a finite element solution.
%
%  Discussion:
%
%    This program writes the node, element and data files that define
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
%    24 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_COORD_FILE_NAME(*), the name of the node coordinate
%    file. 
%
%    Input, string ELEMENT_FILE_NAME(*), the name of the element file.
%
%    Input, string NODE_DATA_FILE_NAME(*), the name of the node data file. 
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer NODE_DATA_NUM, the number of data items per node.
%
%    Input, real NODE_COORD(DIM_NUM,NODE_NUM), the coordinates of nodes.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM); 
%    the global index of local node I in element J.
%
%    Input, real NODE_DATA(NODE_DATA_NUM,NODE_NUM), the data values associated
%    with each node.
%
  r8mat_write ( node_coord_file_name, dim_num, node_num, node_coord );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_WRITE wrote node coordinates to "%s".\n', ...
    node_coord_file_name );
%
%  Write the element file.
%
  i4mat_write ( element_file_name, element_order, element_num, element_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_WRITE wrote element data to "%s".\n', ...
    element_file_name );
%
%  Write the node data file.
%
  r8mat_write ( node_data_file_name, node_data_num, node_num, node_data );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_WRITE wrote node data to "%s".\n', ...
    node_data_file_name );

  return
end

