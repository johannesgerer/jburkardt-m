function [ adj_num, adj_row, adj ] = adj_insert_ij ( node_num, adj_max, ...
  adj_num, adj_row, adj, i, j )

%*****************************************************************************80
%
%% ADJ_INSERT_IJ inserts (I,J) into an adjacency structure.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ADJ_MAX, the maximum number of adjacency entries.
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1).  Information about row I is stored
%    in entries ADJ_ROW(I) through ADJ_ROW(I+1)-1 of ADJ.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure.
%
%    Input, integer I, J, the two nodes which are adjacent.
%
%    Output, integer ADJ_NUM, the updated number of adjacency entries.
%
%    Output, integer ADJ_ROW(NODE+1), the updated row pointers.
%
%    Output, integer ADJ(ADJ_NUM), the updated adjacency structure.
%

%
%  A new adjacency entry must be made.
%  Check that we're not exceeding the storage allocation for ADJ.
%
  if ( adj_max < adj_num + 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ADJ_INSERT_IJ - Fatal error!\n' );
    fprintf ( 1, '  All available storage has been used.\n' );
    fprintf ( 1, '  No more information can be stored!\n' );
    fprintf ( 1, '  This error occurred for \n' );
    fprintf ( 1, '  Row I = %d\n', i );
    fprintf ( 1, '  Column J = %d\n', j );
    error ( 'ADJ_INSERT_IJ - Fatal error!' );
  end
%
%  The action is going to occur between ADJ_ROW(I) and ADJ_ROW(I+1)-1:
%
  j_spot = adj_row(i);

  for k = adj_row(i) : adj_row(i+1)-1
    if ( adj(k) == j )
      return
    elseif ( adj(k) < j )
      j_spot = k + 1;
    else
      break
    end
  end

  adj(j_spot+1:adj_num+1) = adj(j_spot:adj_num);
  adj(j_spot) = j;

  adj_row(i+1:node_num+1) = adj_row(i+1:node_num+1) + 1;

  adj_num = adj_num + 1;

  return
end
