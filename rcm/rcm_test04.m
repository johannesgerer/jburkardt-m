function rcm_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests GENRCM
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2007
%
%  Author:
%
%    John Burkardt
%
  triangle_order = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  GENRCM generates the Reverse Cuthill McKee ordering.\n' );

  [ node_num, triangle_num, hole_num ] = ...
    triangulation_order6_example2_size ( );

  [ node_xy, triangle_node, triangle_neighbor ] = ...
    triangulation_order6_example2 ( node_num, triangle_num );
%
%  Randomly permute the nodes.
%
  seed = 123456789;

  [ perm, seed ] = perm_uniform ( node_num, seed );

  i4vec_print ( node_num, perm, '  The random permutation:' );

  for i = 1 : triangle_order
    for j = 1 : triangle_num
      node = triangle_node(i,j);
      triangle_node(i,j) = perm ( node );
    end
  end

  i4mat_transpose_print ( triangle_order, triangle_num, triangle_node, ...
    '  Permuted TRIANGLE_NODE' );

  [ adj_num, adj_row ] = triangulation_order6_adj_count ( node_num, ...
    triangle_num, triangle_node, triangle_neighbor );

  adj = triangulation_order6_adj_set ( node_num, triangle_num, ...
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

  return
end
