function [ mask, level_num, level_row, level ] = level_set ( root, adj_num, ...
  adj_row, adj, mask, node_num )

%*****************************************************************************80
%
%% LEVEL_SET generates the connected level structure rooted at a given node.
%
%  Discussion:
%
%    Only nodes for which MASK is nonzero will be considered.
%
%    The root node chosen by the user is assigned level 1, and masked.
%    All (unmasked) nodes reachable from a node in level 1 are
%    assigned level 2 and masked.  The process continues until there
%    are no unmasked nodes adjacent to any node in the current level.
%    The number of levels may vary between 2 and NODE_NUM.
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
%    Input, integer ROOT, the node at which the level structure
%    is to be rooted.
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1).  Information about row I is stored
%    in entries ADJ_ROW(I) through ADJ_ROW(I+1)-1 of ADJ.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure.
%    For each row, it contains the column indices of the nonzero entries.
%
%    Input, integer MASK(NODE_NUM).  On input, only nodes with nonzero
%    MASK are to be processed.  On output, those nodes which were included
%    in the level set have MASK set to 1.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Output, integer MASK(NODE_NUM).  On input, only nodes with nonzero
%    MASK are to be processed.  On output, those nodes which were included
%    in the level set have MASK set to 1.
%
%    Output, integer LEVEL_NUM, the number of levels in the level
%    structure.  ROOT is in level 1.  The neighbors of ROOT
%    are in level 2, and so on.
%
%    Output, integer LEVEL_ROW(NODE_NUM+1), LEVEL(NODE_NUM), the rooted
%    level structure.
%
  mask(root) = 0;
  level(1) = root;
  level_num = 0;
  lvlend = 0;
  iccsze = 1;
%
%  LBEGIN is the pointer to the beginning of the current level, and
%  LVLEND points to the end of this level.
%
  while ( 1 )

    lbegin = lvlend + 1;
    lvlend = iccsze;
    level_num = level_num + 1;
    level_row(level_num) = lbegin;
%
%  Generate the next level by finding all the masked neighbors of nodes
%  in the current level.
%
    for i = lbegin : lvlend

      node = level(i);
      jstrt = adj_row(node);
      jstop = adj_row(node+1)-1;

      for j = jstrt : jstop

        nbr = adj(j);

        if ( mask(nbr) ~= 0 )
          iccsze = iccsze + 1;
          level(iccsze) = nbr;
          mask(nbr) = 0;
        end

      end

    end
%
%  Compute the current level width (the number of nodes encountered.)
%  If it is positive, generate the next level.
%
    lvsize = iccsze - lvlend;

    if ( lvsize <= 0 )
      break
    end

  end

  level_row(level_num+1) = lvlend + 1;
%
%  Reset MASK to 1 for the nodes in the level structure.
%
  mask(level(1:iccsze)) = 1;

  return
end
