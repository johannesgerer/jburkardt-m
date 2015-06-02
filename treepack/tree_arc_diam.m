function [ diam, label, n1, n2 ] = tree_arc_diam ( nnode, inode, jnode )

%*****************************************************************************80
%
%% TREE_ARC_DIAM computes the "diameter" of a tree.
%
%  Discussion:
%
%    A tree is an undirected graph of N nodes, which uses N-1 edges,
%    and is connected.  
%
%    A graph with N-1 edges is not guaranteed to be a tree, and so this
%    routine must first check that condition before proceeding.
%
%    The diameter of a graph is the length of the longest possible
%    path that never repeats an edge.
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
%    Input, integer INODE(NNODE-1), JNODE(NNODE-1), the edges 
%    of the tree.  Edge I connects nodes INODE(I) and JNODE(I).
%
%    Output, integer DIAM, the length of the longest path 
%    in the tree.
%
%    Output, integer LABEL(NNODE), marks the path between 
%    nodes N1 and N2.  Node I is in this path if LABEL(I) is 1.
%
%    Output, integer N1, N2, the indices of two nodes in the 
%    tree which are separated by DIAM edges.
%
  diam = 0;
  label = [];
  n1 = 0;
  n2 = 0;

  if ( nnode <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TREE_ARC_DIAM - Fatal error!\n' );
    fprintf ( 1, '  NNODE <= 0.\n' );
    error ( 'TREE_ARC_DIAM - Fatal error!' );
  end

  if ( nnode == 1 )
    diam = 0;
    n1 = 1;
    n2 = 1;
    return
  end
%
%  Is this graph really a tree?
%
  nedge = nnode - 1;
  result = graph_arc_is_tree ( nedge, inode, jnode, nnode );

  if ( result == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TREE_ARC_DIAM - Fatal error!\n' );
    fprintf ( 1, '  This graph is NOT a tree.\n' );
    error ( 'TREE_ARC_DIAM - Fatal error!' );
  end

  label = i4vec_indicator ( nnode );
%
%  On step K:
%
%    Identify the terminal and interior nodes.
%
%    If there are no interior nodes left, 
%
%      then there are just two nodes left at all.  The diameter is 2*K-1, 
%      and a maximal path extends between the nodes whose labels are 
%      contained in the two remaining terminal nodes.
%
%    Else
%
%      The label of each terminal node is passed to its interior neighbor.
%      If more than one label arrives, take any one.
%
%      The terminal nodes are removed.
%
  kstep = 0;

  while ( 1 )

    kstep = kstep + 1;
%
%  Compute the degree of each node.
%
    degree(1:nnode) = 0;        

    for j = 1 : nedge

      k = inode(j);
      if ( 0 < k )
        degree(k) = degree(k) + 1;
      end

      k = jnode(j);
      if ( 0 < k )
        degree(k) = degree(k) + 1;
      end

    end
%
%  Count the number of interior nodes.
%
    invals = 0;
    for i = 1 : nnode
      if ( 1 < degree(i) )
        invals = invals + 1;
      end
    end
%
%  If there are 1 or 0 interior nodes, it's time to stop.
%
    if ( invals == 1 )

      diam = 2 * kstep;
      break
    
    elseif ( invals == 0 )

      diam = 2 * kstep - 1;
      break

    end
%
%  If there are at least two interior nodes, then chop off the 
%  terminal nodes and pass their labels inward.
%
    for k = 1 : nnode

      if ( degree(k) == 1 )

        for j = 1 : nedge

          if ( inode(j) == k )
            nabe = jnode(j);
            label(nabe) = label(k);
            inode(j) = - inode(j);
            jnode(j) = - jnode(j);
          else if ( jnode(j) == k )
            nabe = inode(j);
            label(nabe) = label(k);
            inode(j) = - inode(j);
            jnode(j) = - jnode(j);
          end

        end

      end

    end

  end
%
%  Now get the labels from two of the remaining terminal nodes.
%  The nodes represented by these labels will be a diameter apart.
%
  n1 = 0;
  n2 = 0;

  for i = 1 : nnode
    if ( degree(i) == 1 )
      if ( n1 == 0 )
        n1 = label(i);
      elseif ( n2 == 0 )
        n2 = label(i);
      end
    end
  end
%
%  Set the labels of the interior node (if any) and nodes marked
%  N1 and N2 to 1, and all others to 0.  This will label the nodes on the path.
%
  if ( invals == 1 )

    for i = 1 : nnode
      if ( 1 < degree(i) )
        label(i) = 1;
      end
    end

  end

  for i = 1 : nnode
    if ( label(i) == n1 || label(i) == n2 )
      label(i) = 1;
    else
      label(i) = 0;
    end
  end
%
%  Clean up the arrays.
%
  for j = 1 : nedge
    inode(j) = abs ( inode(j) );
    k = inode(j);
    jnode(j) = abs ( jnode(j) );
    k = jnode(j);
  end

  return
end
