function degree = gr_degree ( node_num, node_coordinates, edge_num, edge_nodes )

%*****************************************************************************80
%
%% GR_DEGREE computes the degree of the nodes in a graph.
%
%  Discussion:
%
%    The degree of a node is the number of times the node occurs
%    as one endpoint of an edge.
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
%    Output, integer DEGREE(NODE_NUM), the degree vector.
%
  degree = zeros ( node_num, 1 );

  for e = 1 : edge_num
    for i = 1 : 2
      n = edge_nodes(i,e);
      degree(n) = degree(n) + 1;
    end
  end

  return
end
