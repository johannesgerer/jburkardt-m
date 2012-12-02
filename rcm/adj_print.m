function adj_print ( node_num, adj_num, adj_row, adj, title )

%*****************************************************************************80
%
%% ADJ_PRINT prints adjacency information.
%
%  Discussion:
%
%    The list has the form:
%
%    Row   Nonzeros
%
%    1       2   5   9
%    2       7   8   9   15   78   79   81  86  91  99
%          100 103
%    3      48  49  53
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
%    Input, integer ADJ_ROW(NODE_NUM+1), organizes the adjacency entries
%    into rows.  The entries for row I are in entries ADJ_ROW(I)
%    through ADJ_ROW(I+1)-1.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure, which contains,
%    for each row, the column indices of the nonzero entries.
%
%    Input, string TITLE, a title to be printed.
%
  adj_print_some ( node_num, 1, node_num, adj_num, adj_row, adj, title );

  return
end
