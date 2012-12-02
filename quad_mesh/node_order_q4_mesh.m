function node_order = node_order_q4_mesh ( element_num, element_node, ...
  node_num )

%*****************************************************************************80
%
%% NODE_ORDER_Q4_MESH determines the order of nodes in a Q4 mesh.
%
%  Discussion:
%
%    The order of a node is the number of elements that use that node
%    as a vertex.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(4,ELEMENT_NUM),
%    the nodes that make up the elements.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Output, integer NODE_ORDER(NODE_NUM), the order of each node.
%
  element_order = 4;

  node_order(1:node_num) = 0;

  for element = 1 : element_num
    for i = 1 : element_order
      node = element_node(i,element);
      if ( node < 1 | node_num < node )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'NODE_ORDER_Q4_MESH - Fatal error!\n' );
        fprintf ( 1, '  Illegal entry in ELEMENT_NODE.\n' );
        exit ( 'NODE_ORDER_Q4_MESH - Fatal error!' );
      else
        node_order(node) = node_order(node) + 1;
      end
    end
  end

  return
end
