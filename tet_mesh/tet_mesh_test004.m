function tet_mesh_test004 ( )

%*****************************************************************************80
%
%% TET_MESH_TEST004 tests TET_MESH_NODE_ORDER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2009
%
%  Author:
%
%    John Burkardt
%
  tet_order = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TET_MESH_TEST004\n' );
  fprintf ( 1, '  TET_MESH_NODE_ORDER determines the order of\n' );
  fprintf ( 1, '  each node in a tet mesh.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The order of a node is the number of tetrahedrons\n' );
  fprintf ( 1, '  that use the node as part of their definition.\n' );

  [ node_num, tet_num ] = tet_mesh_order10_example_size ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  This mesh has tetrahedron order %d\n', tet_order );
  fprintf ( 1, '  The number of tetrahedrons is   %d\n', tet_num );

  [ node_xyz, tet_node ] = tet_mesh_order10_example_set ( ...
    node_num, tet_num );

  i4mat_transpose_print ( tet_order, tet_num, tet_node, ...
    '  The tet mesh' );

  node_order = tet_mesh_node_order ( tet_order, tet_num, tet_node, node_num );

  i4vec_print ( node_num, node_order, '  Node orders:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Check that the following are equal:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of tetrahedrons * order = %d\n', tet_num * tet_order );
  fprintf ( 1, '  Sum of node orders             = %d\n', ...
    sum ( node_order(1:node_num) ) );

  return
end
