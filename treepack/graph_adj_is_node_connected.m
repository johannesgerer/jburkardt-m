function result = graph_adj_is_node_connected ( adj, nnode )

%*****************************************************************************80
%
%% GRAPH_ADJ_IS_NODE_CONNECTED determines if a graph is nodewise connected.
%
%  Definition:
%
%    A graph is nodewise connected if, from every node, there is a path
%    to any other node.
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
%    0, the graph is not nodewise connected.
%    1, the graph is nodewise connected.
%

%
%  FOUND(I) is 1 if node I has been reached.
%  LIST(I) contains a list of the nodes as they are reached.
%
  list(1:nnode) = 0;
  found(1:nnode) = 0;
%
%  Start at node 1.
%
  found(1) = 1;
  list(1) = 1;
  ilo = 1;
  ihi = 1;
%
%  From the batch of nodes found last time, LIST(ILO:IHI),
%  look for unfound neighbors, and store their indices in LIST(JLO:JHI).
%
  while ( 1 )

    jlo = ihi + 1;
    jhi = ihi;

    for ii = ilo : ihi

      i = list(ii);

      for j = 1 : nnode

        if ( adj(i,j) ~= 0 || adj(j,i) ~= 0 )

          if ( found(j) == 0 )
            jhi = jhi + 1;
            list(jhi) = j;
            found(j) = 1;
          end

        end

      end

    end
%
%  If no neighbors were found, exit.
%
    if ( jhi < jlo )
      break
    end
%
%  If neighbors were found, then go back and find THEIR neighbors.
%
    ilo = jlo;
    ihi = jhi;
    
  end
%
%  No more neighbors were found.  Have we reached all nodes?
%
  if ( ihi == nnode )
    result = 1;
  else
    result = 0;
  end

  return
end

