function [ deg, iccsze, ls ] = degree ( root, adj_num, adj_row, adj, mask, ...
  node_num )

%*****************************************************************************80
%
%% DEGREE computes the degrees of the nodes in the connected component.
%
%  Discussion:
%
%    The connected component is specified by MASK and ROOT.
%    Nodes for which MASK is zero are ignored.
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
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1).  Information about row I is stored
%    in entries ADJ_ROW(I) through ADJ_ROW(I+1)-1 of ADJ.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure.
%    For each row, it contains the column indices of the nonzero entries.
%
%    Input, integer MASK(NODE_NUM), is nonzero for those nodes which are
%    to be considered.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Output, integer DEG(NODE_NUM), contains, for each  node in the connected
%    component, its degree.
%
%    Output, integer ICCSZE, the number of nodes in the connected component.
%
%    Output, integer LS(NODE_NUM), stores in entries 1 through ICCSIZE the nodes
%    in the connected component, starting with ROOT, and proceeding
%    by levels.
%

%
%  The sign of ADJ_ROW(I) is used to indicate if node I has been considered.
%
  ls(1) = root;
  adj_row(root) = -adj_row(root);
  lvlend = 0;
  iccsze = 1;
%
%  LBEGIN is the pointer to the beginning of the current level, and
%  LVLEND points to the end of this level.
%
  while ( 1 )

    lbegin = lvlend + 1;
    lvlend = iccsze;
%
%  Find the degrees of nodes in the current level,
%  and at the same time, generate the next level.
%
    for i = lbegin : lvlend

      node = ls(i);
      jstrt = -adj_row(node);
      jstop = abs ( adj_row(node+1) ) - 1;
      ideg = 0;

      for j = jstrt : jstop

        nbr = adj(j);

        if ( mask(nbr) ~= 0 )

          ideg = ideg + 1;

          if ( 0 <= adj_row(nbr) )
            adj_row(nbr) = -adj_row(nbr);
            iccsze = iccsze + 1;
            ls(iccsze) = nbr;
          end

        end

      end

      deg(node) = ideg;

    end
%
%  Compute the current level width.
%
    lvsize = iccsze - lvlend;
%
%  If the current level width is nonzero, generate another level.
%
    if ( lvsize == 0 )
      break
    end

  end
%
%  Reset ADJ_ROW to its correct sign and return.
%
  for i = 1 : iccsze
    node = ls(i);
    adj_row(node) = -adj_row(node);
  end

  return
end
