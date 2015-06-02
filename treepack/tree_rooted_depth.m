function [ depth, depth_node ] = tree_rooted_depth ( nnode, parent )

%*****************************************************************************80
%
%% TREE_ROOTED_DEPTH returns the depth of a rooted tree.
%
%  Definition:
%
%    The depth of any node of a rooted tree is the number of edges in 
%    the shortest path from the root to the node.
%
%    The depth of the rooted tree is the maximum of the depths
%    of all the nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NNODE, the number of nodes.
%
%    Input, integer PARENT(NNODE), is the parent node of each node.
%    The node with parent 0 is the root.
%
%    Output, integer DEPTH, the depth of the tree.
%
%    Output, integer DEPTH_NODE(NNODE), the depth of each node.
%

%
%  Find the root.
%
  root = 0;
  for i = 1 : nnode
    if ( parent(i) == 0 )
      root = i;
      break
    end
  end

  if ( root == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TREE_ROOTED_DEPTH - Fatal error!\n' );
    fprintf ( 1, '  Could not find the root.\n' );
    error ( 'TREE_ROOTED_DEPTH - Fatal error!' );
  end
%
%  Determine the depth of each node by moving towards the node.
%  If you reach a node whose depth is already known, stop early.
%
  depth_node(1:nnode) = 0;

  for i = 1 : nnode

    j = i;

    while ( j ~= root )

      depth_node(i) = depth_node(i) + 1;
      j = parent(j);

      if ( 0 < depth_node(j) )
        depth_node(i) = depth_node(i) + depth_node(j);
        break
      end

    end

  end
%
%  Determine the maximum depth.
%
  depth = max ( depth_node(1:nnode) );

  return
end

