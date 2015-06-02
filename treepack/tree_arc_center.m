function [ center, eccent, parity ] = tree_arc_center ( nnode, inode, jnode )

%*****************************************************************************80
%
%% TREE_ARC_CENTER computes the center, eccentricity, and parity of a tree.
%
%  Discussion:
%
%    A tree is an undirected graph of N nodes, which uses N-1 edges,
%    and is connected.  
%
%    A graph with N-1 edges is not guaranteed to be a tree, and so this
%    routine must first check that condition before proceeding.
%
%    The edge distance between two nodes I and J is the minimum number of
%    edges that must be traversed in a path from I and J.
%
%    The eccentricity of a node I is the maximum edge distance between
%    node I and the other nodes J in the graph.
%
%    The radius of a graph is the minimum eccentricity over all nodes
%    in the graph.
%
%    The diameter of a graph is the maximum eccentricity over all nodes
%    in the graph.
%
%    The center of a graph is the set of nodes whose eccentricity is 
%    equal to the radius, that is, the set of nodes of minimum eccentricity.
%
%    For a tree, the center is either a single node, or a pair of
%    neighbor nodes.
%
%    The parity of the tree is 1 if the center is a single node, or 2 if
%    the center is 2 nodes.
%
%    The center of a tree can be found by removing all "leaves", that is,
%    nodes of degree 1.  This step is repeated until only 1 or 2 nodes
%    are left.
%
%    Thanks to Alexander Sax for pointing out that a previous version of the
%    code was failing when the tree had an odd parity, that is, a single
%    center node, 15 April 2013.
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
%    Input, integer INODE(NNODE-1), JNODE(NNODE-1), the edges of
%    the tree.  Edge I connects nodes INODE(I) and JNODE(I).
%
%    Output, integer CENTER(2).  CENTER(1) is the index of the
%    first node in the center.  CENTER(2) is 0 if there is only one node
%    in the center, or else the index of the second node.
%
%    Output, integer ECCENT, the eccentricity of the nodes in 
%    the center, and the radius of the the tree.
%
%    Output, integer PARITY, the parity of the tree, which is
%    normally 1 or 2.
%
  eccent = 0;
  center(1) = 0;
  center(2) = 0;
  parity = 0;

  if ( nnode <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TREE_ARC_CENTER - Fatal error!\n' );
    fprintf ( 1, '  NNODE <= 0.\n' );
    error ( 'TREE_ARC_CENTER - Fatal error!' );
  elseif ( nnode == 1 )
    eccent = 0;
    center(1) = 1;
    center(2) = 0;
    parity = 1;
    return
  elseif ( nnode == 2 )
    eccent = 1;
    center(1) = 1;
    center(2) = 2;
    parity = 2;
    return
  end
%
%  Is this graph really a tree?
%
  nedge = nnode - 1;
  result = graph_arc_is_tree ( nedge, inode, jnode, nnode );

  if ( result == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TREE_ARC_CENTER - Fatal error!\n' );
    fprintf ( 1, '  This graph is NOT a tree.\n' );
    error ( 'TREE_ARC_CENTER - Fatal error!' );
  end
%
%  Compute the degrees.
%
  degree = graph_arc_degree ( nnode, nedge, inode, jnode );
%
%  Defoliate the tree.
%
  nnode2 = nnode;

  while ( 1 )

    eccent = eccent + 1;
%
%  Find and mark the leaves.
%
    nleaf = 0;

    for i = 1 : nnode

      if ( degree(i) == 1 )
        nleaf = nleaf + 1;
        list(nleaf) = i;
      end

    end
%
%  Delete the leaves.
%
    for ileaf = 1 : nleaf

      i = list(ileaf);

      iedge = 0;
      j = 0;

      while ( 1 )

        iedge = iedge + 1;

        if ( nedge < iedge )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'TREE_ARC_CENTER - Fatal error!\n' );
          fprintf ( 1, '  Data or algorithm failure.\n' );
          error ( 'TREE_ARC_CENTER - Fatal error!' );
        end

        if ( inode(iedge) == i )
          j = jnode(iedge);
          inode(iedge) = - inode(iedge);
          jnode(iedge) = - jnode(iedge);
        elseif ( jnode(iedge) == i )
          j = inode(iedge);
          inode(iedge) = - inode(iedge);
          jnode(iedge) = - jnode(iedge);
        end

        if ( j ~= 0 )
          break
        end

      end

      degree(i) = -1;
      nnode2 = nnode2 - 1;
      degree(j) = degree(j) - 1;
%
%  If the other node has degree 0, we must have just finished
%  stripping all leaves from the tree, leaving a single node.
%  Don't kill it here.  It is our odd center.
%
%     if ( degree(j) == 0 )
%       nnode2 = nnode2 - 1;
%     end

    end
%
%  Find the remaining nodes.
%
    nnode2 = 0;

    for i = 1 : nnode

      if ( 0 <= degree(i) )
        nnode2 = nnode2 + 1;
        list(nnode2) = i;
      end

    end
%
%  If at least 3, more pruning is required.
%
    if ( nnode2 < 3 )
      break
    end

  end
%
%  If only one or two nodes left, we are done.
%
  parity = nnode2;

  center(1:nnode2) = list(1:nnode2);
  inode(1:nedge) = abs ( inode(1:nedge) );
  jnode(1:nedge) = abs ( jnode(1:nedge) );

  return
end

