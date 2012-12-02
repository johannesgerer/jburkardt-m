function quad_mesh_test10 ( )

%*****************************************************************************80
%
%% QUAD_MESH_TEST10 tests NODE_ORDER_Q4_MESH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_MESH_TEST10\n' );
  fprintf ( 1, '  NODE_ORDER_4_MESH computes the order\n' );
  fprintf ( 1, '  of the nodes in a Q4 mesh.\n' );

  [ node_num, element_num, hole_num ] = example1_q4_mesh_size ( );

  [ node_xy, element_node, element_neighbor ] = example1_q4_mesh ( node_num, ...
    element_num );

  node_order = node_order_q4_mesh ( element_num, element_node, node_num );

  i4vec_print ( node_num, node_order, '      NODE         ORDER' );

  return
end
