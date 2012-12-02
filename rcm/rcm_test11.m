function rcm_test11 ( )

%*****************************************************************************80
%
%% TEST11 tests TRIANGULATION_ORDER6_ADJ_COUNT
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
  fprintf ( 1, 'TEST11\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER6_ADJ_COUNT counts the (lower)\n' );
  fprintf ( 1, '  adjacencies defined by a triangulation.\n' );

  [ node_num, triangle_num, hole_num ] = ...
    triangulation_order6_example2_size ( );

  [ node_xy, triangle_node, triangle_neighbor ] = ...
    triangulation_order6_example2 ( node_num, triangle_num );

  [ adj_num, adj_row ] = triangulation_order6_adj_count ( node_num, ...
    triangle_num, triangle_node, triangle_neighbor );

  i4vec_print ( node_num+1, adj_row, '  ADJ_ROW' );

  return
end
