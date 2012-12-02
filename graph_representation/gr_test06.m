function gr_test06 ( node_num, node_coordinates, edge_num, edge_nodes );

%*****************************************************************************80
%
%% GR_TEST06 tests GR_GRF.
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
  fprintf ( 1, 'GR_TEST06:\n' );
  fprintf ( 1, '  GR_GRF creates a GRF file from a graph.\n' );

  gr_grf ( node_num, node_coordinates, ...
    edge_num, edge_nodes );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created the GRF file "graph.grf".\n' );

  return
end
