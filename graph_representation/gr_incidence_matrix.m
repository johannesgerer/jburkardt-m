function incidence_matrix = gr_incidence_matrix ( node_num, ...
  node_coordinates, edge_num, edge_nodes )

%*****************************************************************************80
%
%% GR_INCIDENCE_MATRIX computes the incidence matrix.
%
%  Discussion:
%
%    The incidence matrix is of order EDGE_NUM by NODE_NUM.
%
%    A(I,J) = 1 if edge I uses node J.
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
%    Output, integer INCIDENCE_MATRIX(EDGE_NUM,NODE_NUM), the incidence
%    matrix.
%
  incidence_matrix = zeros ( edge_num, node_num );

  for e = 1 : edge_num
    for i = 1 : 2
      n = edge_nodes(i,e);
      incidence_matrix(e,n) = incidence_matrix(e,n) + 1;
    end
  end

  return
end
