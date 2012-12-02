function gr_grf ( node_num, node_coordinates, edge_num, edge_nodes )

%*****************************************************************************80
%
%% GR_GRF writes a GRF file of a graph.
%
%  Discussion:
%
%    To keep things simple, the GRF file is always named "graph.grf".
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
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_COORDINATES(2,NODE_NUM), the coordinates of the nodes.
%
%    Input, integer EDGE_NUM, the number of edges.
%
%    Input, integer EDGE_NODES(2,EDGE_NUM), the indices of the two nodes
%    that form each edge.
%
  adjacency_pointer = gr_adjacency_pointer( node_num, node_coordinates, ...
    edge_num, edge_nodes );

  adjacency_list = gr_adjacency_list ( node_num, ...
    node_coordinates, edge_num, edge_nodes );

  grf_filename = 'graph.grf';

  grf_fid = fopen ( grf_filename, 'wt' );
  for n = 1 : node_num
    fprintf ( grf_fid, '%d  %f  %f', n, node_coordinates(1:2,n) );
    for i = adjacency_pointer(n) : adjacency_pointer(n+1) - 1
      fprintf ( grf_fid, '  %d', adjacency_list(i) );
    end
    fprintf ( grf_fid, '\n' );
  end

  fclose ( grf_fid );

  return
end
