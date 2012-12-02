function [ adj_col_free, adj_row ] = ns_adj_insert ( v1, v2, variable_num, ...
  adj_num, adj_col_free, adj_row )

%*****************************************************************************80
%
%% NS_ADJ_INSERT inserts an adjacency into a compressed column adjacency matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer V1, V2, the indices of two items which are adjacent.
%
%    Input, integer VARIABLE_NUM, the number of items.
%
%    Input, integer ADJ_NUM, the number of entries available in ADJ_ROW.
%
%    Input, integer ADJ_COL_FREE(VARIABLE_NUM), contains the next free
%    location in which an entry for a given column can be stored.  
%
%    Input, integer ADJ_ROW(ADJ_NUM), the row indices of the Navier Stokes
%    variable adjacency matrix.
%
%    Output, integer ADJ_COL_FREE(VARIABLE_NUM), two pointers have been updated.
%
%    Output, integer ADJ_ROW(ADJ_NUM), two new entries have been added.
%
  adj_row(adj_col_free(v1)) = v2;
  adj_col_free(v1) = adj_col_free(v1) + 1;

  if ( v1 == v2 )
    return
  end

  adj_row(adj_col_free(v2)) = v1;
  adj_col_free(v2) = adj_col_free(v2) + 1;

  return
end
