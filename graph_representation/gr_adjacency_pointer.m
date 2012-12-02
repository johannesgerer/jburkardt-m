function adjacency_pointer = gr_adjacency_pointer ( node_num, ...
  node_coordinates, edge_num, edge_nodes )

%*****************************************************************************80
%
%% GR_ADJACENCY_POINTER returns the adjacency pointer for a graph.
%
%  Discussion:
%
%    For node I, the I-th entry of the adjacency pointer points to the
%    first entry in the adjacency list for node I.  The (I+1)-st entry,
%    minus one, points to the last such entry.
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
%    Output, integer ADJACENCY_POINTER(NODE_NUM+1), the adjacency pointer.
%
  degree = zeros ( node_num, 1 );

  for e = 1 : edge_num
    for i = 1 : 2
      n = edge_nodes(i,e);
      degree(n) = degree(n) + 1;
    end
  end

  adjacency_pointer = zeros(node_num+1,1);
  adjacency_pointer(1) = 1;
  for i = 2 : node_num + 1
    adjacency_pointer(i) = adjacency_pointer(i-1) + degree(i-1);
  end

  return
end
