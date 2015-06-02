function gr_test ( )

%*****************************************************************************80
%
%% GR_TEST tests the GRAPH_REPRESENTATION library.
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
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GR_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the GRAPH_REPRESENTATION library.\n' );

  node_coordinates = ( load ( 'simple_node_coordinates.txt' ) )';
  [ dim, node_num ] = size ( node_coordinates );
  edge_nodes = ( load ( 'simple_edges.txt' ) )';
  [ two, edge_num ] = size ( edge_nodes );

  i4mat_transpose_print ( 2, edge_num, edge_nodes, ...
    '  The edge node array (transposed):' );
  r8mat_transpose_print ( dim, node_num, node_coordinates,
    '  The node coordinates (transposed):' );

  gr_test01 ( node_num, node_coordinates, edge_num, edge_nodes );
  gr_test02 ( node_num, node_coordinates, edge_num, edge_nodes );
  gr_test03 ( node_num, node_coordinates, edge_num, edge_nodes );
  gr_test04 ( node_num, node_coordinates, edge_num, edge_nodes );
  gr_test05 ( node_num, node_coordinates, edge_num, edge_nodes );
  gr_test06 ( node_num, node_coordinates, edge_num, edge_nodes );
  gr_test07 ( node_num, node_coordinates, edge_num, edge_nodes );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GR_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
