function [ adj_num, adj_row ] = tet_mesh_order10_adj_count ( node_num, ...
  tetra_num, tetra_node )

%*****************************************************************************80
%
%% TET_MESH_ORDER10_ADJ_COUNT counts the number of nodal adjacencies.
%
%  Discussion:
%
%    Assuming that the tet mesh is to be used in a finite element
%    computation, we declare that two distinct nodes are "adjacent" if and
%    only if they are both included in some tetrahedron.
%
%    It is the purpose of this routine to determine the number of
%    such adjacency relationships.
%
%    The initial count gets only the (I,J) relationships, for which
%    node I is strictly less than node J.  This value is doubled
%    to account for symmetry.
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
%    Output, integer ADJ_NUM, the total number of adjacency relationships,
%
%    Output, integer ADJ_ROW(NODE_NUM+1), the ADJ pointer array.
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
%  Get the number of unique columns.
%
  pair_unique_num = i4col_sorted_unique_count ( 2, pair_num, pair );
%
%  The number of adjacencies is TWICE this value, plus the number of nodes.
%
  adj_num = 2 * pair_unique_num;
%
%  Now set up the ADJ_ROW counts.
%
  adj_row(1:node_num) = 0;

  for k = 1 : pair_num

    if ( 1 < k )
      if ( pair(1,k-1) == pair(1,k) && pair(2,k-1) == pair(2,k) )
        continue
      end
    end

    i = pair(1,k);
    j = pair(2,k);

    adj_row(i) = adj_row(i) + 1;
    adj_row(j) = adj_row(j) + 1;

  end
%
%  We used ADJ_ROW to count the number of entries in each row.
%  Convert it to pointers into the ADJ array.
%
  adj_row(2:node_num+1) = adj_row(1:node_num);

  adj_row(1) = 1;
  for i = 2 : node_num + 1
    adj_row(i) = adj_row(i-1) + adj_row(i);
  end

  return
end
