function gr_test02 ( node_num, node_coordinates, edge_num, edge_nodes );

%*****************************************************************************80
%
%% GR_TEST02 tests GR_ADJACENCY_MATRIX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GR_TEST02:\n' );
  fprintf ( 1, '  GR_ADJACENCY_MATRIX computes the adjacency matrix.\n' );

  adjacency_matrix = gr_adjacency_matrix ( node_num, node_coordinates, ...
    edge_num, edge_nodes );

  i4mat_print ( node_num, node_num, adjacency_matrix, ...
    '  The adjacency matrix:' );

  return
end
