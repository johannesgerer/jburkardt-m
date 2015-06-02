function [ adj, nnode ] = graph_arc_to_graph_adj ( nedge, inode, jnode )

%*****************************************************************************80
%
%% GRAPH_ARC_TO_GRAPH_ADJ converts an arc list graph to an adjacency graph.
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
%    Input, integer INODE(NEDGE), JNODE(NEDGE), the edge array for 
%    an undirected graph.  The I-th edge connects nodes INODE(I) and JNODE(I).
%
%    Output, integer ADJ(NNODE,NNODE), the adjacency information.
%
%    Output, integer NNODE, the number of nodes.
%

%
%  Determine the number of nodes.
%
  nnode = graph_arc_node_count ( nedge, inode, jnode );

  adj(1:nnode,1:nnode) = 0;

  for k = 1 : nedge
    i = inode(k);
    j = jnode(k);
    adj(i,j) = 1;
    adj(j,i) = 1;
  end

  return
end
