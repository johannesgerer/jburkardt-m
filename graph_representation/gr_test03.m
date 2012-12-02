function gr_test03 ( node_num, node_coordinates, edge_num, edge_nodes );

%*****************************************************************************80
%
%% GR_TEST03 tests GR_ADJACENCY_POINTER.
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
  fprintf ( 1, 'GR_TEST03:\n' );
  fprintf ( 1, '  GR_ADJACENCY_POINTER computes the adjacency pointer.\n' );

  adjacency_pointer = gr_adjacency_pointer ( node_num, node_coordinates, ...
    edge_num, edge_nodes );

  i4vec_print ( node_num + 1, adjacency_pointer, '  The adjacency pointer:' );

  return
end
