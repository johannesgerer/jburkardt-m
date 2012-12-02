function mind = dijkstra_fun ( nv, ohd )

%*****************************************************************************80
%
%% DIJKSTRA_FUN uses Dijkstra's minimum distance algorithm.
%
%  Discussion:
%
%    We essentially build a tree.  We start with only node 1 connected
%    to the tree, and this is indicated by setting CONNECTED(1) = 1.
%
%    We initialize MIND(I) to the one step distance from node 1 to node I.
%
%    Now we search among the unconnected nodes for the node MV whose minimum
%    distance is smallest, and connect it to the tree.  For each remaining
%    unconnected node I, we check to see whether the distance from 1 to MV
%    to I is less than that recorded in MIND(I), and if so, we can reduce
%    the distance.
%
%    After NV-1 steps, we have connected all the nodes to 1, and computed
%    the correct minimum distances.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2010
%
%  Author:
%
%    Original C version by Norm Matloff, CS Dept, UC Davis.
%    This MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, integer OHD(NV,NV), the distance of the direct link between
%    nodes I and J.
%
%    Output, integer MIND(NV), the minimum distance from node 1 to each node.
%

%
%  Start out with only node 1 connected to the tree.
%
  connected(1) = 1;
  connected(2:nv) = 0;
%
%  Initialize the minimum distance to the one-step distance.
%
  mind(1:nv) = ohd(1,1:nv);

  spmd
    nth = numlabs ( );
    my_s = floor ( ( ( labindex ( ) - 1 ) * nv ) / nth ) + 1;
    my_e = floor (   ( labindex ( )       * nv ) / nth );
    fprintf ( 1, 'Worker %d has nodes S = %d to E = %d\n', labindex ( ), my_s, my_e );
  end

  lab_count = nth{1};
%
%  Attach one more node on each iteration.
%
  for step = 2 : nv
%
%  Each worker looks at the nodes it is responsible for, and
%  finds the unconnected node with the smallest value of MIND.
%
    spmd
      [ my_md, my_mv ] = find_nearest ( my_s, my_e, nv, mind, connected );
    end
%
%  Client determines the minimum distance found by the workers.
%
    md = Inf;
    mv = -1;

    for i = 1 : lab_count
      if ( my_md{i} < md )
        md = my_md{i};
        mv = my_mv{i};
      end
    end
%
%  Update the distance information.
%
    fprintf ( 1, 'Adding node %d\n', mv );
    connected(mv) = 1;
    mind(mv) = md;
%
%  Each worker updates the minimum distance information for the nodes
%  it is responsible for.
%
    spmd
      my_mind = update_mind ( my_s, my_e, nv, mv, connected, ohd, mind );
    end
%
%  The client updates the global copy.
%
    mind = [];
    for i = 1 : lab_count
      mind = [ mind my_mind{:} ];
    end

  end

  return
end
function [ d, v ] = find_nearest ( my_s, my_e, nv, mind, connected )

%*****************************************************************************80
%
%% FIND_NEAREST finds the nearest unconnected node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2010
%
%  Author:
%
%    Original C version by Norm Matloff, CS Dept, UC Davis.
%    This MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, integer MY_S, MY_E, the first and last nodes to check.
%
%    Input, integer NV, the number of nodes.
%
%    Input, integer MIND(NV), the currently computed minimum distance from
%    node 1 to each node.
%
%    Input, integer CONNECTED(NV), is 1 for each connected node, whose
%    minimum distance to node 1 has been determined.
%
%    Output, integer D, the distance from node 1 to the nearest
%    unconnected node in the range S to E.
%
%    Output, integer V, the index of the nearest unconnected node
%    in the range S to E.
%
  d = Inf;
  v = -1;
  for i = my_s : my_e
    if ( ~connected(i) && mind(i) < d )
      d = mind(i);
      v = i;
    end
  end
  return;
end
function my_mind = update_mind ( my_s, my_e, nv, mv, connected, ohd, mind )

%*****************************************************************************80
%
%% UPDATE_MIND updates the minimum distance vector.
%
%  Discussion:
%
%    We've just determined the minimum distance to node MV.
%
%    For each node I which is not connected yet,
%    check whether the route from node 1 to MV to I is shorter
%    than the currently known minimum distance.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2010
%
%  Author:
%
%    Original C version by Norm Matloff, CS Dept, UC Davis.
%    This MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, integer MY_S, MY_E, the first and last nodes to check.
%
%    Input, integer MV, the node whose minimum distance to node 1
%    has just been determined.
%
%    Input, integer CONNECTED(NV), is 1 for each connected node, whose
%    minimum distance to node 1 has been determined.
%
%    Input, integer OHD(NV)(NV), the distance of the direct link between
%    nodes I and J.
%
%    Input, integer MIND(NV), the currently computed minimum distances
%    from node 1 to each node.
%
%    Output, integer MY_MIND(:), the updated computed minimum distances
%    from node 1 to nodes MY_S through MY_E.
%
  for i = my_s : my_e
    if ( ~connected(i) )
      if ( ohd(mv,i) < Inf )
        mind(i) = min ( mind(i), mind(mv) + ohd(mv,i) );
      end
    end
  end

  my_mind = mind(my_s:my_e);

  return
end
