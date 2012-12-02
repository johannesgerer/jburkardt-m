function [ mask, perm, iccsze ] = rcm ( root, adj_num, adj_row, adj, ...
  mask, node_num )

%*****************************************************************************80
%
%% RCM renumbers a connected component by the reverse Cuthill McKee algorithm.
%
%  Discussion:
%
%    The connected component is specified by a node ROOT and a mask.
%    The numbering starts at the root node.
%
%    An outline of the algorithm is as follows:
%
%    X(1) = ROOT.
%
%    for ( I = 1 to N-1)
%      Find all unlabeled neighbors of X(I),
%      assign them the next available labels, in order of increasing degree.
%
%    When done, reverse the ordering.
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
%  Parameters:
%
%    Input, integer ROOT, the node that defines the connected component.
%    It is used as the starting point for the RCM ordering.
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1).  Information about row I is stored
%    in entries ADJ_ROW(I) through ADJ_ROW(I+1)-1 of ADJ.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure.
%    For each row, it contains the column indices of the nonzero entries.
%
%    Input, integer MASK(NODE_NUM), a mask for the nodes.  Only
%    those nodes with nonzero input mask values are considered by the
%    routine.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Output, integer MASK(NODE_NUM), the nodes numbered by RCM have 
%    their mask values set to zero.
%
%    Output, integer PERM(NODE_NUM), the RCM ordering.
%
%    Output, integer ICCSZE, the size of the connected component
%    that has been numbered.
%
%  Local Parameters:
%
%    Workspace, integer DEG(NODE_NUM), a temporary vector used to hold
%    the degree of the nodes in the section graph specified by mask and root.
%

%
%  Find the degrees of the nodes in the component specified by MASK and ROOT.
%
  [ deg, iccsze, perm ] = degree ( root, adj_num, adj_row, adj, mask, ...
    node_num );

  mask(root) = 0;

  if ( iccsze <= 1 )
    return
  end

  lvlend = 0;
  lnbr = 1;
%
%  LBEGIN and LVLEND point to the beginning and
%  the end of the current level respectively.
%
  while ( lvlend < lnbr )

    lbegin = lvlend + 1;
    lvlend = lnbr;

    for i = lbegin : lvlend
%
%  For each node in the current level...
%
      node = perm(i);
      jstrt = adj_row(node);
      jstop = adj_row(node+1) - 1;
%
%  Find the unnumbered neighbors of NODE.
%
%  FNBR and LNBR point to the first and last neighbors
%  of the current node in PERM.
%
      fnbr = lnbr + 1;

      for j = jstrt : jstop

        nbr = adj(j);

        if ( mask(nbr) ~= 0 )
          lnbr = lnbr + 1;
          mask(nbr) = 0;
          perm(lnbr) = nbr;
        end

      end
%
%  If no neighbors, skip to next node in this level.
%
      if ( lnbr <= fnbr )
        continue
      end
%
%  Sort the neighbors of NODE in increasing order by degree.
%  Linear insertion is used.
%
      k = fnbr;

      while ( k < lnbr )

        l = k;
        k = k + 1;
        nbr = perm(k);

        while ( fnbr < l )

          lperm = perm(l);

          if ( deg(lperm) <= deg(nbr) )
            break
          end

          perm(l+1) = lperm;
          l = l-1;

        end

        perm(l+1) = nbr;

      end

    end

  end
%
%  We now have the Cuthill-McKee ordering.  Reverse it.
%
  perm = i4vec_reverse ( iccsze, perm );

  return
end
