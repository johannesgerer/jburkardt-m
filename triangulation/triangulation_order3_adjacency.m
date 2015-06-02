function adj = triangulation_order3_adjacency ( node_num, element_num, ...
  element_node )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_ADJACENCY computes the full adjacency matrix
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes in the
%    triangulation.
%
%    Input, integer ELEMENT_NUM, the number of triangles in
%    the triangulation.
%
%    Input, integer ELEMENT_NODE(3,ELEMENT_NUM),
%    the nodes making up each triangle.
%
%    Output, integer ADJ(NODE_NUM,NODE_NUM), the adjacency
%    matrix.  ADJ(I,J) is 1 if nodes I and J are adjacent, that is,
%    they are immediate neighbors on an edge of the triangulation.
%
  adj = zeros ( node_num, node_num );

  for element = 1 : element_num
    adj ( element_node(1,element), element_node(2,element) ) = 1;
    adj ( element_node(1,element), element_node(3,element) ) = 1;
    adj ( element_node(2,element), element_node(1,element) ) = 1;
    adj ( element_node(2,element), element_node(3,element) ) = 1;
    adj ( element_node(3,element), element_node(1,element) ) = 1;
    adj ( element_node(3,element), element_node(2,element) ) = 1;
  end

  return
end
