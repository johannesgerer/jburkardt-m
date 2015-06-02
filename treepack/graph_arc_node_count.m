function nnode = graph_arc_node_count ( nedge, inode, jnode )

%*****************************************************************************80
%
%% GRAPH_ARC_NODE_COUNT counts the number of nodes in a graph.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 July 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NEDGE, the number of edges.
%
%    Input, integer INODE(NEDGE), JNODE(NEDGE).  INODE(I) and 
%    JNODE(I) are the start and end nodes of the I-th edge.
%
%    Output, integer NNODE, the number of distinct nodes.
%

%
%  Copy all the node labels into KNODE,
%  sort KNODE,
%  count the unique entries.  
%
%  That's NNODE.
%
  knode(1:nedge) = inode(1:nedge);
  knode(nedge+1:nedge+nedge) = jnode(1:nedge);

  knode = i4vec_sort_heap_a ( 2*nedge, knode );

  nnode = i4vec_sorted_unique_count ( 2*nedge, knode );

  return
end
