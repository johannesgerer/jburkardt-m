function node_order = triangulation_node_order ( triangle_order, ...
  triangle_num, triangle_node, node_num )

%*****************************************************************************80
%
%% TRIANGULATION_NODE_ORDER determines the order of nodes in a triangulation.
%
%  Discussion:
%
%    The order of a node is the number of triangles that use that node
%    as a vertex.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM), the nodes
%    that make up the triangles.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Output, integer NODE_ORDER(NODE_NUM), the order of each node.
%
  node_order(1:node_num) = 0;

  for triangle = 1 : triangle_num
    for i = 1 : triangle_order
      node = triangle_node(i,triangle);
      if ( node < 1 | node_num < node )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'TRIANGULATION_NODE_ORDER - Fatal error!\n' );
        fprintf ( 1, '  Illegal entry in TRIANGLE_NODE.\n' );
        error ( 'TRIANGULATION_NODE_ORDER - Fatal error!' );
      else
        node_order(node) = node_order(node) + 1;
      end
    end
  end

  return
end
