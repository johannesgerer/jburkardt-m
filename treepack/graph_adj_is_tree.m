function result = graph_adj_is_tree ( adj, nnode )

%*****************************************************************************80
%
%% GRAPH_ADJ_IS_TREE determines whether a graph is a tree.
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
%    Input, integer ADJ(NNODE,NNODE), the adjacency matrix for the 
%    graph.  ADJ(I,J) is nonzero if there is an edge from node I to node J.
%
%    Input, integer NNODE, the number of nodes.
%
%    Output, integer RESULT.
%    0, the graph is not a tree.
%    1, the graph is a tree.
%
  if ( nnode <= 1 )
    result = 1;
    return
  end
%
%  Every node must be connected to every other node.
%
  result = graph_adj_is_node_connected ( adj, nnode );

  if ( result == 0 )
    return
  end
%
%  There must be exactly NNODE-1 edges.
%
  nedge = graph_adj_edge_count ( adj, nnode );

  if ( nedge == nnode - 1 )
    result = 1;
  else
    result = 0;
  end

  return
end
