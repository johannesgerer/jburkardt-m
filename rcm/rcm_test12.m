function rcm_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests TRIANGULATION_ORDER6_ADJ_SET
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER6_ADJ_SET sets the (lower)\n' );
  fprintf ( 1, '  adjacencies defined by a triangulation.\n' );

  [ node_num, triangle_num, hole_num ] = ...
    triangulation_order6_example2_size ( );

  [ node_xy, triangle_node, triangle_neighbor ] = ...
    triangulation_order6_example2 ( node_num, triangle_num );

  i4mat_transpose_print ( 6, triangle_num, triangle_node, ...
    '  TRIANGLE_NODE' );

  [ adj_num, adj_row ] = triangulation_order6_adj_count ( node_num, ...
    triangle_num, triangle_node, triangle_neighbor );

  adj = triangulation_order6_adj_set ( node_num, triangle_num, triangle_node, ...
    triangle_neighbor, adj_num, adj_row );

  adj_print ( node_num, adj_num, adj_row, adj, '  ADJ array:' );

  bandwidth = adj_bandwidth ( node_num, adj_num, adj_row, adj );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  ADJ bandwidth = %d\n', bandwidth );

  return
end
