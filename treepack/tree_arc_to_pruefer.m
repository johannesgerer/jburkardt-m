function code = tree_arc_to_pruefer ( nnode, inode, jnode )

%*****************************************************************************80
%
%% TREE_ARC_TO_PRUEFER is given a labeled tree, and computes its Pruefer code.
%
%  Discussion:
%
%    A tree is an undirected graph of N nodes, which uses N-1 edges,
%    and is connected.  
%
%    A graph with N-1 edges is not guaranteed to be a tree, and so this
%    routine must first check that condition before proceeding.
%
%    The Pruefer code is a correspondence between all labeled trees of
%    N nodes, and all list of N-2 integers between 1 and N (with repetition
%    allowed).  The number of labeled trees on N nodes is therefore N**(N-2).
%
%  Method:
%
%    The Pruefer code is constructed from the tree as follows:
%
%    A terminal node on the tree is defined as a node with only one neighbor.
%
%    Consider the set of all terminal nodes on the tree.  Take the one
%    with the highest label, I.  Record the label of its neighbor, J.
%    Delete node I and the edge between node I and J.
%
%    J is the first entry in the Pruefer code for the tree.   Repeat
%    the operation a total of N-2 times to get the complete code.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2013
%
%  Reference:
%
%    Dennis Stanton, Dennis White,
%    Constructive Combinatorics,
%    Springer Verlage, New York, 1986.
%
%  Parameters:
%
%    Input, integer NNODE, the number of nodes.
%
%    Input, integer INODE(NNODE-1), JNODE(NNODE-1), the edge array 
%    of the tree.  The I-th edge joins nodes INODE(I) and JNODE(I).
%
%    Output, integer CODE(NNODE-2), the Pruefer code of the tree.
%

%
%  Is this graph really a tree?
%
  nedge = nnode - 1;
  result = graph_arc_is_tree ( nedge, inode, jnode, nnode );

  if ( result == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TREE_ARC_TO_PRUEFER - Fatal error!\n' );
    fprintf ( 1, '  This graph is NOT a tree.\n' );
    error ( 'TREE_ARC_TO_PRUEFER - Fatal error!' );
  end
%
%  Compute the degree of each node.
%
  nedge = nnode - 1;
  degree = graph_arc_degree ( nnode, nedge, inode, jnode );
%
%  Compute the next term of the Pruefer code.
%
  for i = 1 : nnode - 2
%
%  Find the terminal node with the highest label.
%
    iterm = 0;
 
    for j = 1 : nnode
      if ( degree(j) == 1 )
        iterm = j;
      end
    end
%
%  Find the edge that includes this node, and note the
%  index of the other node.
%
    for j = 1 : nnode - 1

      jsave = j;
 
      if ( inode(j) == iterm )
        i2 = 2;
        break
      elseif ( jnode(j) == iterm )
        i2 = 1;
        break
      end
 
    end
%
%  Delete the edge from the tree.
%
    degree(inode(jsave)) = degree(inode(jsave)) - 1;
    degree(jnode(jsave)) = degree(jnode(jsave)) - 1;
%
%  Add the neighbor of the node to the Pruefer code.
%
    if ( i2 == 1 )
      code(i) = inode(jsave);
    else
      code(i) = jnode(jsave);
    end
%
%  Negate the nodes in the edge list to mark them as used.
%
    inode(jsave) = - inode(jsave);
    jnode(jsave) = - jnode(jsave);
 
  end
%
%  Before returning, restore the original form of the edge list.
%
  inode(1:nnode-1) = abs ( inode(1:nnode-1) );
  jnode(1:nnode-1) = abs ( jnode(1:nnode-1) );
 
  return
end
