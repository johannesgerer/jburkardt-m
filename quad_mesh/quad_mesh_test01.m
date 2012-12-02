function quad_mesh_test01 ( )

%*****************************************************************************80
%
%% QUAD_MESH_TEST01 tests ADJ_SIZE_Q4_MESH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_MESH_TEST01\n' );
  fprintf ( 1, '  ADJ_SIZE counts the node adjacencies.\n' );
%
%  Get the sizes of the example.
%
  [ node_num, element_num, hole_num ] = example1_q4_mesh_size ( );

  [ node_xy, element_node, element_neighbor ] = example1_q4_mesh ( ...
    node_num, element_num );
%
%  Get the count of the node adjacencies.
%
  [ adj_num, adj_col ] = adj_size_q4_mesh ( node_num, element_num, ...
    element_node, element_neighbor );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of adjacency entries is %d\n', adj_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Adjacency pointers:\n' );
  fprintf ( 1, '\n' );
  for node = 1 : node_num
    fprintf ( 1, '  %8d  %8d  %d\n', node, adj_col(node), adj_col(node+1)-1 );
  end

  return
end
