function degree = graph_arc_degree ( nnode, nedge, inode, jnode )

%*****************************************************************************80
%
%% GRAPH_ARC_DEGREE determines the degree of the nodes of a graph.
%
%  Definition:
%
%    The degree of a node is the number of edges that include the node.
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
%    Input, integer NEDGE, the number of edges.
%
%    Input, integer INODE(NEDGE), JNODE(NEDGE), the pairs of nodes
%    that form the edges.
%
%    Output, integer DEGREE(NNODE), the degree of each node, 
%    that is, the number of edges that include the node.
%
  degree(1:nnode) = 0;

  for i = 1 : nedge

    n = inode(i);

    if ( 1 <= n && n <= nnode )
      degree(n) = degree(n) + 1;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'GRAPH_ARC_DEGREE - Fatal error!\n' );
      fprintf ( 1, '  Out-of-range node value = %d\n', n );
      error ( 'GRAPH_ARC_DEGREE - Fatal error!' );
    end

    n = jnode(i);

    if ( 1 <= n && n <= nnode )
      degree(n) = degree(n) + 1;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'GRAPH_ARC_DEGREE - Fatal error!\n' );
      fprintf ( 1, '  Out-of-range node value = %d\n', n );
      error ( 'GRAPH_ARC_DEGREE - Fatal error!' );
    end

  end

  return
end

