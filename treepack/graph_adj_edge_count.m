function nedge = graph_adj_edge_count ( adj, nnode )

%*****************************************************************************80
%
%% GRAPH_ADJ_EDGE_COUNT counts the number of edges in a graph.
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
%    Input, integer ADJ(NNODE,NNODE), the adjacency information.
%    ADJ(I,J) is 1 if there is an edge from node I to node J.
%
%    Input, integer NNODE, the number of nodes.
%
%    Output, integer NEDGE, the number of edges in the graph.
%
  nedge = 0;

  for i = 1 : nnode
    for j = 1 : nnode

      if ( i == j )
        nedge = nedge + 2 * adj(i,j);
      else
        nedge = nedge + adj(i,j);
      end

    end
  end

  nedge = floor ( nedge / 2 );

  return
end

