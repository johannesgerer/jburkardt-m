function perm = genrcm ( node_num, adj_num, adj_row, adj )

%*****************************************************************************80
%
%% GENRCM finds the reverse Cuthill-Mckee ordering for a general graph.
%
%  Discussion:
%
%    For each connected component in the graph, the routine obtains
%    an ordering by calling RCM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2007
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
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1).  Information about row I is stored
%    in entries ADJ_ROW(I) through ADJ_ROW(I+1)-1 of ADJ.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure.
%    For each row, it contains the column indices of the nonzero entries.
%
%    Output, integer PERM(NODE_NUM), the RCM ordering.
%
%  Local Parameters:
%
%    Local, integer LEVEL_ROW(NODE_NUM+1), the index vector for a level
%    structure.  The level structure is stored in the currently unused
%    spaces in the permutation vector PERM.
%
%    Local, integer MASK(NODE_NUM), marks variables that have been numbered.
%
  mask(1:node_num) = 1;

  num = 1;

  for i = 1 : node_num
%
%  For each masked connected component...
%
    if ( mask(i) ~= 0 )

      root = i;
%
%  Find a pseudo-peripheral node ROOT.  The level structure found by
%  ROOT_FIND is stored starting at PERM(NUM).
%
      [ root, level_num, level_row, level ] = root_find ( root, ...
        adj_num, adj_row, adj, mask, node_num );
%
%  RCM orders the component using ROOT as the starting node.
%
      [ mask, level, iccsze ] = rcm ( root, adj_num, adj_row, adj, mask, ...
        node_num );

      perm(num:num+iccsze-1) = level(1:iccsze);

      num = num + iccsze;
%
%  We can stop once every node is in one of the connected components.
%
      if ( node_num < num )
        return
      end

    end

  end

  return
end
