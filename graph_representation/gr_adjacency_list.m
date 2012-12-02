function adjacency_list = gr_adjacency_list ( node_num, ...
  node_coordinates, edge_num, edge_nodes )

%*****************************************************************************80
%
%% ADJACENCY_LIST returns the adjacency list for a graph.
%
%  Discussion:
%
%    The adjacency list is a vector listing all the neighbors of node 1,
%    followed by all the neighbors of node 2, and so on.  The adjacency
%    pointer vector is useful to be able to locate the neighbors for
%    a given node within the adjacency list.
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
%    Output, integer ADJACENCY_LIST(2*EDGE_NUM), the adjacency list.
%
  adjacency_list = zeros ( 2 * edge_num, 1 );

  adjacency_pointer = gr_adjacency_pointer ( node_num, node_coordinates, ...
    edge_num, edge_nodes );

  degree = zeros ( node_num, 1 );

  for e = 1 : edge_num

    n1 = edge_nodes(1,e);
    n2 = edge_nodes(2,e);

    k = adjacency_pointer(n1) + degree(n1);
    adjacency_list(k) = n2;
    degree(n1) = degree(n1) + 1;

    k = adjacency_pointer(n2) + degree(n2);
    adjacency_list(k) = n1;
    degree(n2) = degree(n2) + 1;

  end

  return
end
