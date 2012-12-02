function adjacency_structure = gr_adjacency_structure ( node_num, ...
  node_coordinates, edge_num, edge_nodes )

%*****************************************************************************80
%
%% GR_ADJACENCY_STRUCTURE returns the adjacency structure of a graph.
%
%  Discussion:
%
%    Since we are using MATLAB, we return an actual structure.
%    That is, a cell array.  Entry {I} of the cell array is a
%    vector containing all the nodes which share an edge with
%    node I.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_COORDINATES(2,NODE_NUM), the coordinates of the nodes.
%
%    Input, integer EDGE_NUM, the number of edges.
%
%    Input, integer EDGE_NODES(2,EDGE_NUM), the indices of the two nodes
%    that form each edge.
%
%    Output, cell array ADJACENCY_STRUCTURE{NODE_NUM}, the
%    adjacency structure.
%
  adjacency_list = gr_adjacency_list ( node_num, ...
    node_coordinates, edge_num, edge_nodes );

  adjacency_pointer = gr_adjacency_pointer ( node_num, ...
    node_coordinates, edge_num, edge_nodes );

  adjacency_structure = cell ( node_num );

  for i = 1 : node_num
    i1 = adjacency_pointer(i);
    i2 = adjacency_pointer(i+1) - 1;
    adjacency_structure{i} = adjacency_list(i1:i2);
  end

  return
end
