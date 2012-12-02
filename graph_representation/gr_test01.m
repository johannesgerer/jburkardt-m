function gr_test01 ( node_num, node_coordinates, edge_num, edge_nodes );

%*****************************************************************************80
%
%% GR_TEST01 tests GR_ADJACENCY_LIST.
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
  fprintf ( 1, 'GR_TEST01:\n' );
  fprintf ( 1, '  GR_ADJACENCY_LIST computes the adjacency list.\n' );

  adjacency_list = gr_adjacency_list ( node_num, node_coordinates, ...
    edge_num, edge_nodes );

  i4vec_print ( 2 * edge_num, adjacency_list, '  The adjacency list:' );

  return
end
