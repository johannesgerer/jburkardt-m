function result = graph_arc_is_tree ( nedge, inode, jnode, nnode )

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
%    Input, integer INODE(NEDGE), JNODE(NEDGE).  INODE(I) and 
%    JNODE(I) are the start and end nodes of the I-th edge of the graph G.
%
%    Input, integer NEDGE, the number of edges in the graph G.
%
%    Input, integer NNODE, the number of nodes.
%
%    Output, integer RESULT.
%    0, the graph is not a tree.
%    1, the graph is a tree.
%
  [ adj, nnode2 ] = graph_arc_to_graph_adj ( nedge, inode, jnode );

  result = graph_adj_is_tree ( adj, nnode );

  return
end

