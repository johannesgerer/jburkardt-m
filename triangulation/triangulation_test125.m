function triangulation_test125 ( )

%*****************************************************************************80
%
%% TEST125 tests TRIANGULATION_ORDER3_ADJ_SET2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 July 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST125\n' );
  fprintf ( 1, '  For an order3 triangulation:\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER3_ADJ_COUNT counts adjacencies\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER3_ADJ_SET2 sets adjacencies\n' );
  fprintf ( 1, '  as a pair of vectors IA(*), JA(*).\n' );
%
%  Get the sizes.
%
  [ node_num, triangle_num, hole_num ] = ...
    triangulation_order3_example1_size ( );
%
%  Get the data.
%
  [ node_xy, triangle_node, triangle_neighbor ] = ...
    triangulation_order3_example1 ( node_num, triangle_num );
%
%  Get the count of the adjacencies.
%
  [ adj_num, adj_col ] = triangulation_order3_adj_count ( node_num, ...
    triangle_num, triangle_node, triangle_neighbor );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of adjacency entries is %d\n', adj_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Adjacency pointers:\n' );
  fprintf ( 1, '\n' );
  for node = 1 : node_num
    fprintf ( 1, '  %8d  %8d  %8d\n', node, adj_col(node), adj_col(node+1)-1 );
  end
%
%  Get the adjacencies.
%
  [ ia, ja ] = triangulation_order3_adj_set2 ( node_num, ...
    triangle_num, triangle_node, triangle_neighbor, adj_num, adj_col );
%
%  Print the adjacencies.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node adjacencies stored in IA(*) and JA(*):\n' );
  fprintf ( 1, '\n' );

  for adj = 1 : adj_num

    fprintf ( 1, '  %8d  (%2d,%2d)\n', adj, ia(adj), ja(adj) );

  end

  return
end
