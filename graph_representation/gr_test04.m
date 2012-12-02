function gr_test04 ( node_num, node_coordinates, edge_num, edge_nodes );

%*****************************************************************************80
%
%% GR_TEST04 tests GR_ADJACENCY_STRUCTURE.
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
  fprintf ( 1, 'GR_TEST04:\n' );
  fprintf ( 1, '  GR_ADJACENCY_STRUCTURE computes the adjacency structure.\n' );

  adjacency_structure = gr_adjacency_structure ( node_num, node_coordinates, ...
    edge_num, edge_nodes );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node Degree    Neighbors\n');
  fprintf ( 1, '\n' );

  for node = 1 : node_num
    degree = length ( adjacency_structure{node} );
    fprintf ( 1, '    %2d     %2d  ', node, degree );
    for i = 1 : degree
      fprintf ( 1, '  %d', adjacency_structure{node}(i) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
