function value = adj_contains_ij ( node_num, adj_num, adj_row, adj, i, j )

%*****************************************************************************80
%
%% ADJ_CONTAINS_IJ determines if (I,J) is in an adjacency structure.
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
%    John Burkardt
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
%
%    Input, integer I, J, the two nodes, for which we want to know
%    whether I is adjacent to J.
%
%    Output, logical VALUE, is TRUE if I = J, or the adjacency
%    structure contains the information that I is adjacent to J.
%
  FALSE = 0;
  TRUE = 1;
%
%  Symmetric entries are not stored.
%
  if ( i == j )
    value = TRUE;
    return
  end
%
%  Illegal I, J entries.
%
  if ( node_num < i )
    value = FALSE;
    return
  elseif ( i < 1 )
    value = FALSE;
    return
  elseif ( node_num < j )
    value = FALSE;
    return
  elseif ( j < 1 )
    value = FALSE;
    return
  end
%
%  Search the adjacency entries already stored for row I,
%  to see if J has already been stored.
%
  klo = adj_row(i);
  khi = adj_row(i+1) - 1;

  for k = klo : khi

    if ( adj(k) == j )
      value = TRUE;
      return
    end

  end

  value = FALSE;

  return
end
