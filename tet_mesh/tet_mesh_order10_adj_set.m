function adj = tet_mesh_order10_adj_set ( node_num, tetra_num, tetra_node, ...
  adj_num, adj_row )

%*****************************************************************************80
%
%% TET_MESH_ORDER10_ADJ_SET sets the nodal adjacency matrix.
%
%  Discussion:
%
%    A compressed format is used for the nodal adjacency matrix.
%
%    It is assumed that we know ADJ_NUM, the number of adjacency entries
%    and the ADJ_ROW array, which keeps track of the list of slots
%    in ADJ where we can store adjacency information for each row.
%
%    We essentially repeat the work of TET_MESH_ORDER4_ADJ_COUNT, but
%    now we have a place to store the adjacency information.
%
%    A copy of the ADJ_ROW array is useful, as we can use it to keep track
%    of the next available entry in ADJ for adjacencies associated with
%    a given row.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(10,TETRA_NUM), the nodes that make up the
%    tetrahedrons.
%
%    Input, integer ADJ_NUM, the total number of adjacency relationships,
%
%    Input, integer ADJ_ROW(NODE_NUM+1), the ADJ pointer array.
%
%    Output, integer ADJ(ADJ_NUM), the adjacency information.
%

%
%  Each order 10 tetrahedron defines 45 adjacency pairs.
%
  k = 0;
  for i = 1 : 9
    for j = i + 1 : 10
      pair(1,k*tet_num+1:(k+1)*tet_num) = tet_node(i,1:tet_num);
      pair(2,k*tet_num+1:(k+1)*tet_num) = tet_node(j,1:tet_num);
      k = k + 1;
    end
  end
%
%  Force the nodes of each pair to be listed in ascending order.
%
  pair_num = 45 * tetra_num;
  pair = i4col_sort2_a ( 2, pair_num, pair );
%
%  Rearrange the columns in ascending order.
%
  pair = i4col_sort_a ( 2, pair_num, pair );
%
%  Mark all entries of ADJ so we will know later if we missed one.
%
  adj(1:adj_num) = -1;
%
%  Copy the ADJ_ROW array and use it to keep track of the next
%  free entry for each row.
%
  adj_row_copy(1:node_num) = adj_row(1:node_num);
%
%  Now set up the ADJ_ROW counts.
%
  for k = 1 : pair_num

    if ( 1 < k )
      if ( pair(1,k-1) == pair(1,k) && pair(2,k-1) == pair(2,k) )
        continue
      end
    end

    i = pair(1,k);
    j = pair(2,k);

    adj(adj_row_copy(i)) = j;
    adj_row_copy(i) = adj_row_copy(i) + 1;
    adj(adj_row_copy(j)) = i;
    adj_row_copy(j) = adj_row_copy(j) + 1;

  end

  return
end
