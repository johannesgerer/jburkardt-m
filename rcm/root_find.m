function [ root, level_num, level_row, level ] = root_find ( root, ...
  adj_num, adj_row, adj, mask, node_num )

%*****************************************************************************80
%
%% ROOT_FIND finds a pseudo-peripheral node.
%
%  Discussion:
%
%    The diameter of a graph is the maximum distance (number of edges)
%    between any two nodes of the graph.
%
%    The eccentricity of a node is the maximum distance between that
%    node and any other node of the graph.
%
%    A peripheral node is a node whose eccentricity equals the
%    diameter of the graph.
%
%    A pseudo-peripheral node is an approximation to a peripheral node;
%    it may be a peripheral node, but all we know is that we tried our
%    best.
%
%    The routine is given a graph, and seeks pseudo-peripheral nodes,
%    using a modified version of the scheme of Gibbs, Poole and
%    Stockmeyer.  It determines such a node for the section subgraph
%    specified by MASK and ROOT.
%
%    The routine also determines the level structure associated with
%    the given pseudo-peripheral node; that is, how far each node
%    is from the pseudo-peripheral node.  The level structure is
%    returned as a list of nodes LS, and pointers to the beginning
%    of the list of nodes that are at a distance of 0, 1, 2, ...,
%    NODE_NUM-1 from the pseudo-peripheral node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2007
%
%  Author:
%
%    Original FORTRAN77 version by Alan George, Joseph Liu.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Alan George, Joseph Liu,
%    Computer Solution of Large Sparse Positive Definite Systems,
%    Prentice Hall, 1981.
%
%    Norman Gibbs, William Poole, Paul Stockmeyer,
%    An Algorithm for Reducing the Bandwidth and Profile of a Sparse Matrix,
%    SIAM Journal on Numerical Analysis,
%    Volume 13, pages 236-250, 1976.
%
%    Norman Gibbs,
%    Algorithm 509: A Hybrid Profile Reduction Algorithm,
%    ACM Transactions on Mathematical Software,
%    Volume 2, pages 378-387, 1976.
%
%  Parameters:
%
%    Input, integer ROOT a node in the the component of the graph for 
%    which a pseudo-peripheral node is sought.
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1).  Information about row I is stored
%    in entries ADJ_ROW(I) through ADJ_ROW(I+1)-1 of ADJ.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure.
%    For each row, it contains the column indices of the nonzero entries.
%
%    Input, integer MASK(NODE_NUM), specifies a section subgraph.  Nodes
%    for which MASK is zero are ignored by FNROOT.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Output, integer ROOT, the pseudo-peripheral node obtained.
%
%    Output, integer LEVEL_NUM, is the number of levels in the level structure
%    rooted at the node ROOT.
%
%    Output, integer LEVEL_ROW(NODE_NUM+1), LEVEL(NODE_NUM), the
%    level structure array pair containing the level structure found.
%

%
%  Determine the level structure rooted at ROOT.
%
  [ mask, level_num, level_row, level ] = level_set ( root, adj_num, ...
    adj_row, adj, mask, node_num );
%
%  Count the number of nodes in this level structure.
%
  iccsze = level_row(level_num+1) - 1;
%
%  Extreme case:
%    A complete graph has a level set of only a single level.
%    Every node is equally good (or bad).
%
  if ( level_num == 1 )
    return
  end
%
%  Extreme case:
%    A "line graph" 0--0--0--0--0 has every node in its only level.
%    By chance, we've stumbled on the ideal root.
%
  if ( level_num == iccsze )
    return
  end
%
%  Pick any node from the last level that has minimum degree
%  as the starting point to generate a new level set.
%
  while ( 1 )

    mindeg = iccsze;

    jstrt = level_row(level_num);
    root = level(jstrt);

    if ( jstrt < iccsze )

      for j = jstrt : iccsze

        node = level(j);
        ndeg = 0;
        kstrt = adj_row(node);
        kstop = adj_row(node+1)-1;

        for k = kstrt : kstop
          nabor = adj(k);
          if ( 0 < mask(nabor) )
            ndeg = ndeg+1;
          end
        end

        if ( ndeg < mindeg )
          root = node;
          mindeg = ndeg;
        end

      end

    end
%
%  Generate the rooted level structure associated with this node.
%
    [ mask, level_num2, level_row, level ] = level_set ( root, adj_num, ...
      adj_row, adj, mask, node_num );
%
%  If the number of levels did not increase, accept the new ROOT.
%
    if ( level_num2 <= level_num )
      break
    end

    level_num = level_num2;
%
%  In the unlikely case that ROOT is one endpoint of a line graph,
%  we can exit now.
%
    if ( iccsze <= level_num )
      break
    end

  end

  return
end
