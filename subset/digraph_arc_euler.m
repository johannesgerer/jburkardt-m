function [ success, trail ] = digraph_arc_euler ( nnode, nedge, inode, jnode )

%*****************************************************************************80
%
%% DIGRAPH_ARC_EULER returns an Euler circuit in a digraph.
%
%  Description:
%
%    An Euler circuit of a digraph is a path which starts and ends at
%    the same node and uses each directed edge exactly once.  A digraph is
%    eulerian if it has an Euler circuit.  The problem is to decide whether
%    a given digraph is eulerian and to find an Euler circuit if the
%    answer is affirmative.
%
%    A digraph has an Euler circuit if and only if the number of incoming
%    edges is equal to the number of outgoing edges at each node.
%
%    This characterization gives a straightforward procedure to decide whether
%    a digraph is eulerian.  Furthermore, an Euler circuit in an eulerian
%    digraph G of NEDGE edges can be determined by the following method:
%
%      STEP 1: Choose any node U as the starting node, and traverse any edge
%      ( U, V ) incident to node U, and than traverse any unused edge incident
%      to node U.  Repeat this process of traversing unused edges until the
%      starting node U is reached.  Let P be the resulting walk consisting of
%      all used edges.  If all edges of G are in P, than stop.
%
%      STEP 2: Choose any unused edge ( X,  Y) in G such that X is
%      in P and Y is not in P.  Use node X as the starting node and
%      find another walk Q using all unused edges as in step 1.
%
%      STEP 3: Walk P and walk Q share a common node X, they can be merged
%      to form a walk R by starting at any node S of P and to traverse P
%      until node X is reached; than, detour and traverse all edges of Q
%      until node X is reached and continue to traverse the edges of P until
%      the starting node S is reached.  Set P = R.
%
%      STEP 4: Repeat steps 2 and 3 until all edges are used.
%
%    The running time of the algorithm is O ( NEDGE ).
%
%    The digraph is assumed to be connected.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 July 2004
%
%  Author:
%
%    Original FORTRAN77 version by Hang Tong Lau.
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Hang Tong Lau,
%    Algorithms on Graphs,
%    Tab Books, 1989.
%
%  Parameters:
%
%    Input, integer NNODE, the number of nodes.
%
%    Input, integer NEDGE, the number of edges.
%
%    Input, integer INODE(NEDGE), JNODE(NEDGE); the I-th edge starts at node
%    INODE(I) and ends at node JNODE(I).
%
%    Output, logical SUCCESS, is TRUE if an Euler circuit was found,
%    and FALSE otherwise.
%
%    Output, integer TRAIL(NEDGE).  TRAIL(I) is the edge number of the I-th
%    edge in the Euler circuit.
%

%
%  Check if the digraph is eulerian.
%
  trail(1:nedge) = 0;
  endnod(1:nedge) = 0;

  for i = 1 : nedge
    j = inode(i);
    trail(j) = trail(j) + 1;
    j = jnode(i);
    endnod(j) = endnod(j) + 1;
  end

  for i = 1 : nnode
    if ( trail(i) ~= endnod(i) )
      success = 0;
      return
    end
  end
%
%  The digraph is eulerian; find an Euler circuit.
%
  success = 1;
  lensol = 1;
  lenstk = 0;
%
%  Find the next edge.
%
  stacks = zeros ( 100, 1 );

  while ( 1 )

    if ( lensol == 1 )

      endnod(1) = inode(1);
      stacks(1) = 1;
      stacks(2) = 1;
      lenstk = 2;

    else

      l = lensol - 1;

      if ( lensol ~= 2 )
        endnod(l) = inode(trail(l)) + jnode(trail(l)) - endnod(l-1);
      end

      k = endnod(l);

      for i = 1 : nedge
        candid(i) = ( k == jnode(i) );
      end

      for i = 1 : l
        candid(trail(i)) = 0;
      end

      len = lenstk;

      for i = 1 : nedge

        if ( candid(i) )
          len = len + 1;
          stacks(len) = i;
        end

      end

      stacks(len+1) = len - lenstk;
      lenstk = len + 1;

    end

    while ( 1 )

      istak = stacks(lenstk);
      lenstk = lenstk - 1;

      if ( istak ~= 0 )
        break
      end

      lensol = lensol - 1;

      if ( lensol == 0 )
        trail = i4vec_reverse ( nedge, trail );
        return
      end

    end

    trail(lensol) = stacks(lenstk);
    stacks(lenstk) = istak - 1;

    if ( lensol == nedge )
      break
    end

    lensol = lensol + 1;

  end

  trail = i4vec_reverse ( nedge, trail );

  return
end
