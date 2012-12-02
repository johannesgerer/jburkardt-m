function triangulation_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests TRIANGULATION_ORDER3_ADJ_COUNT, TRIANGULATION_ORDER3_ADJ_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  For an order3 triangulation:\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER3_ADJ_COUNT counts adjacencies\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER3_ADJ_SET sets adjacencies.\n' );
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
  adj = triangulation_order3_adj_set ( node_num, ...
    triangle_num, triangle_node, triangle_neighbor, adj_num, adj_col );
%
%  Print the adjacencies.
%
  for node = 1 : node_num

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Nodes adjacent to node %d\n', node );
    fprintf ( 1, '\n' );

    for k = adj_col(node) : adj_col(node+1)-1
      fprintf ( 1, '  %d\n', adj(k) );
    end

  end

  return
end
