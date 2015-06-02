function code = tree_rooted_code ( nnode, parent )

%*****************************************************************************80
%
%% TREE_ROOTED_CODE returns the code of a rooted tree.
%
%  Discussion:
%
%    This code for a rooted tree depends on the node ordering, so it's actually
%    the code for a labeled rooted tree.  To eliminate the effects of node
%    labeling, one could choose as the code for a tree the maximum of all
%    the codes associated with the different possible labelings of the tree.
%    There are more effective ways of arriving at this code than simply
%    generating all possible codes and comparing them.  
%
%    For a tree with NNODES, the code is a list of 2*NNODE 0's and 1's,
%    describing a traversal of the tree starting at an imaginary node 0,
%    moving "down" to the root (a code entry of 1), and then moving
%    "down" (1) or "up" (0) as the tree is traversed in a depth first
%    manner.  The final move must be from the root up to the imaginary
%    node 0.
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
%    Output, integer CODE(2*NNODE), the code for the tree.
%

%
%  Find the root.
%
  father = 0;
  for i = 1 : nnode
    if ( parent(i) == 0 )
      k = 1;
      code(1) = 1;
      father = i;
      break
    end
  end

  if ( father == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TREE_ROOTED_CODE - Fatal error!\n' );
    fprintf ( 1, '  Could not find the root.\n' );
    error ( 'TREE_ROOTED_CODE - Fatal error!' );
  end

  while ( father ~= 0 ) 

    k = k + 1;
    code(k) = 0;

    for son = 1 : nnode
      if ( parent(son) == father )
        code(k) = 1;
        father = son;
        break
      end
    end

    if ( code(k) == 0 )
      parent(father) = - parent(father);
      father = - parent(father);
    end

  end

  parent(1:nnode) = - parent(1:nnode);

  return
end
