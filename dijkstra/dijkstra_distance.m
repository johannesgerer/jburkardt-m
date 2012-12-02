function mind = dijkstra_distance ( nv, ohd )

%*****************************************************************************80
%
%% DIJKSTRA_DISTANCE uses Dijkstra's minimum distance algorithm.
%
%  Discussion:
%
%    We essentially build a tree.  We start with only node 0 connected
%    to the tree, and this is indicated by setting CONNECTED(0) = 1.
%
%    We initialize MIND(I) to the one step distance from node 0 to node I.
%    
%    Now we search among the unconnected nodes for the node MV whose minimum
%    distance is smallest, and connect it to the tree.  For each remaining
%    unconnected node I, we check to see whether the distance from 0 to MV
%    to I is less than that recorded in MIND(I), and if so, we can reduce
%    the distance.
%
%    After NV-1 steps, we have connected all the nodes to 0, and computed
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
%
%  Attach one more node on each iteration.
%
  for step = 2 : nv
%
%  Find the nearest unconnected node.
%
    [ md, mv ] = find_nearest ( nv, mind, connected );

    if ( mv == - 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DIJKSTRA_DISTANCE - Warning!\n' );
      fprintf ( 1, '  Search terminated early.\n' );
      fprintf ( 1, '  Graph might not be connected.\n' );
      return
    end
%
%  Mark this node as connected.
%
    connected(mv) = 1;
%
%  Having determined the minimum distance to node MV, see if
%  that reduces the minimum distance to other nodes.
%
    mind = update_mind ( nv, mv, connected, ohd, mind );

  end

  return
end
