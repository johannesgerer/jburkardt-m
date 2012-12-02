function node_order = tet_mesh_node_order ( tetra_order, tetra_num, ...
  tetra_node, node_num )

%*****************************************************************************80
%
%% TET_MESH_NODE_ORDER: determines the order of nodes.
%
%  Discussion:
%
%    The order of a node is the number of tetrahedrons that use that node
%    as a vertex.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TETRA_ORDER, the order of the tetrahedrons.
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(TETRA_ORDER,TETRA_NUM), the nodes
%    that make up the tetrahedrons.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Output, integer NODE_ORDER(NODE_NUM), the order of each node.
%
  node_order(1:node_num) = 0;

  for tetra = 1 : tetra_num
    for i = 1 : tetra_order
      node = tetra_node(i,tetra);
      if ( node < 1 | node_num < node )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'TET_MESH_NODE_ORDER - Fatal error!\n' );
        fprintf ( 1, '  Illegal entry in TETRA_NODE.\n' );
        error ( 'TET_MESH_NODE_ORDER - Fatal error!' );
      else
        node_order(node) = node_order(node) + 1;
      end
    end
  end

  return
end
