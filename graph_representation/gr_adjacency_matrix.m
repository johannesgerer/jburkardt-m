function adjacency_matrix = gr_adjacency_matrix ( node_num, node_coordinates, ...
  edge_num, edge_nodes )

%*****************************************************************************80
%
%% GR_ADJACENCY_MATRIX computes the adjacency matrix.
%
%  Discussion:
%
%    Entry A(I,J) contains the number of edges between node I and node J.
%    Ordinarily, this would be 0 or 1.
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
%    Output, integr ADJACENCY_MATRIX(NODE_NUM,NODE_NUM), the
%    adjacency matrix.
%
  adjacency_matrix = zeros ( node_num, node_num );

  for e = 1 : edge_num
    n1 = edge_nodes(1,e);
    n2 = edge_nodes(2,e);
    adjacency_matrix(n1,n2) = adjacency_matrix(n1,n2) + 1;
    adjacency_matrix(n2,n1) = adjacency_matrix(n2,n1) + 1;
  end

  return
end
