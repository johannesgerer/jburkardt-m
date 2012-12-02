function node_rep = node_merge ( dim_num, node_num, node_xy, tolerance )

%*****************************************************************************80
%
%% NODE_MERGE detects nodes that should be merged.
%
%  Discussion:
%
%    Two nodes "should" be merged if they are within TOLERANCE distance
%    of each other.
%
%    With a tolerance of 0, only exactly equal nodes are counted.
%
%    With a positive tolerance, a pair of nodes inside a circle of
%    radius TOLERANCE result in a count of 1 duplicate.
%
%    However, what do we do if nodes A, B and C are arranged in a line,%
%    with A and B just within TOLERANCE of each other, and B and C just
%    within tolerance of each other?  What we do here is make a choice
%    that can be defended consistently.  A and B define an equivalence
%    class because they are closer than TOLERANCE.  C is then added to
%    this equivalence class, because it is within TOLERANCE of at least
%    on thing in that equivalence class.
%
%    Thus, if 100 nodes are separated pairwise by slightly less
%    than TOLERANCE, a total of 99 duplicates will be counted.
%
%    The program starts out by giving each node its own label.
%    If it finds that two nodes should be merged, then the index of
%    one node is used as the label for both.  This process continues
%    until all nodes have been considered.  The number of unique nodes
%    is the number of unique values in the output quantity NODE_REP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(DIM_NUM,NODE_NUM), the nodes.
%
%    Input, real TOLERANCE, the maximum distance between
%    two nodes regarded as duplicate.
%
%    Output, integer NODE_REP(NODE_NUM), the "representative" of each node.
%    NODE_REP(NODE) is the index of a node which is within TOLERANCE of node
%    NODE, or for which a chain of nodes can be found, all having the
%    same representative, and all of which are pairwise closer than TOLERANCE.
%
  for node1 = 1 : node_num
    node_rep(node1) = node1;
  end

  for node1 = 1 : node_num

    rep_dist(1:node_num) = inf;

    for node2 = 1 : node_num

      dist = sqrt ( sum ( ...
        ( node_xy(1:dim_num,node1) - node_xy(1:dim_num,node2) ).^2 ) );

      rep = node_rep(node2);

      if ( dist < rep_dist(rep) )
        rep_dist(rep) = dist;
      end

    end

    for node2 = 1 : node_num
      rep = node_rep(node2);
      if ( rep_dist(rep) <= tolerance )
        node_rep(node2) = node1;
      end
    end

  end

  return
end
