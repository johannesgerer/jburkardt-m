function [ node_num, element_num, node_xy, element_node, element_neighbor ] ...
  = grid_read ( prefix )

%*****************************************************************************80
%
%% GRID_READ reads the finite element grid information.
%
%  Problem specification:
%
%    The user defines the geometry by supplying data files
%    which list the node coordinates, and the nodes that make up
%    each element, and the neighbors of each element.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string PREFIX, the filename prefix.
%
%    Output, integer NODE_NUM, the number of nodes.
%
%    Output, integer ELEMENT_NUM, the number of elements.
%
%    Output, real NODE_XY(2,NODE_NUM), the point coordinates.
%
%    Output, integer ELEMENT_NODE(3,ELEMENT_NUM), the nodes that make 
%    up the elements.
%
%    Output, integer ELEMENT_NEIGHBOR(3,ELEMENT_NUM), the element neighbors on 
%    each side.  If there is no element neighbor on a particular side, the 
%    value of should be negative. 
%

%
%  Create the file names.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
  element_neighbor_filename = strcat ( prefix, '_element_neighbors.txt' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node file is "%s".\n', node_filename );
  fprintf ( 1, '  Element file is "%s".\n', element_filename );
  fprintf ( 1, '  Element neighbor file is "%s".\n', element_neighbor_filename );
%
%  Read the node coordinate file.
%
  [ dim_num, node_num ] = r8mat_header_read ( node_filename );

  fprintf ( 1, '  Number of nodes =          %d\n', node_num );

  node_xy = r8mat_data_read ( node_filename, dim_num, node_num );
%
%  Read the element description file.
%
  [ element_order, element_num ] = i4mat_header_read ( element_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Element order =            %d\n', element_order );
  fprintf ( 1, '  Number of elements =       %d\n', element_num );

  element_node = i4mat_data_read ( element_filename, element_order, ...
    element_num );
%
%  Detect and correct zero-based indexing of the nodes.
%
  element_node = mesh_base_one ( element_order, element_num, element_node );
%
%  Read the element neighbor file.
%
  [ three, element_num ] = i4mat_header_read ( element_neighbor_filename );

  element_neighbor = i4mat_data_read ( element_neighbor_filename, 3, ...
    element_num );

  return
end
