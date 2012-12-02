function rcm_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests GENRCM
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 January 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  GENRCM generates the Reverse Cuthill McKee ordering.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Do the test twice.  On the second test, randomly\n' );
  fprintf ( 1, '  permute the initial nodes.\n' );

  [ node_num, triangle_num, hole_num ] = ...
    triangulation_order3_example2_size ( );

  for test = 1 : 2

    [ node_xy, triangle_node, triangle_neighbor ] = ...
      triangulation_order3_example2 ( node_num, triangle_num );
%
%  Randomly permute the nodes.
%
    if ( test == 2 )

      seed = 123456789;

      [ perm, seed ] = perm_uniform ( node_num, seed );

      i4vec_print ( node_num, perm, '  The random permutation:' );

      for i = 1 : 3
        for j = 1 : triangle_num
          node = triangle_node(i,j);
          triangle_node(i,j) = perm ( node );
        end
      end

    end

    i4mat_transpose_print ( 3, triangle_num, triangle_node, ...
      '  TRIANGLE_NODE:' );

    [ adj_num, adj_row ] = triangulation_order3_adj_count ( node_num, ...
      triangle_num, triangle_node, triangle_neighbor );

    adj = triangulation_order3_adj_set ( node_num, triangle_num, ...
      triangle_node, triangle_neighbor, adj_num, adj_row );

    adj_print ( node_num, adj_num, adj_row, adj, '  ADJ array:' );

    bandwidth = adj_bandwidth ( node_num, adj_num, adj_row, adj );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  ADJ bandwidth = %d\n', bandwidth );

    perm = genrcm ( node_num, adj_num, adj_row, adj );

    i4vec_print ( node_num, perm, '  The RCM permutation:' );

    perm_inv = perm_inverse3 ( node_num, perm );

    bandwidth = adj_perm_bandwidth ( node_num, adj_num, adj_row, adj, ...
      perm, perm_inv );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Permuted ADJ bandwidth = %d\n', bandwidth );

  end

  return
end
